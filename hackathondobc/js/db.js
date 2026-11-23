/* db.js - camada de acesso ao banco de dados
   usa sql.js (SQLite compilado para WebAssembly), então o banco
   roda inteiro no navegador... sem ter que integrar nada em algo antiquado como php */

const HorariosDB = (() => {
  const SQLJS_CDN = "https://cdnjs.cloudflare.com/ajax/libs/sql.js/1.8.0/";

  // Abre o banco: cria as tabelas (schema.sql) e carrega os dados (seed.sql)
  async function open() {
    const [SQL, schema, seed] = await Promise.all([
      initSqlJs({ locateFile: (file) => SQLJS_CDN + file }),
      fetch("database/schema.sql").then(checkResponse),
      fetch("database/seed.sql").then(checkResponse),
    ]);

    const db = new SQL.Database();
    db.run(schema);
    db.run(seed);
    db.run("PRAGMA foreign_keys = ON;");
    return new Wrapper(db);
  }

  function checkResponse(res) {
    if (!res.ok) throw new Error(`Não foi possível carregar ${res.url} (${res.status})`);
    return res.text();
  }

  class Wrapper {
    constructor(db) {
      this.db = db;
    }

    // Executa um SELECT e devolve um array de objetos
    query(sql, params = {}) {
      const stmt = this.db.prepare(sql);
      stmt.bind(params);
      const rows = [];
      while (stmt.step()) rows.push(stmt.getAsObject());
      stmt.free();
      return rows;
    }

    // ---- listas para preencher os filtros ----
    turmas()      { return this.query("SELECT id, nome FROM turmas ORDER BY serie, nome"); }
    professores() { return this.query("SELECT id, nome FROM professores ORDER BY nome"); }
    salas()       { return this.query("SELECT id, nome, tipo FROM salas ORDER BY tipo DESC, nome"); }
    dias()        { return this.query("SELECT id, nome, abreviacao FROM dias_semana ORDER BY id"); }
    horarios()    { return this.query("SELECT id, inicio, fim FROM horarios ORDER BY ordem"); }

    // "SIGLA — Nome" quando existe nome por extenso; só a sigla quando não existe
    disciplinas() {
      return this.query(
        `SELECT id,
                CASE WHEN nome = sigla THEN sigla ELSE sigla || ' — ' || nome END AS nome
           FROM disciplinas
          ORDER BY nome`
      );
    }

    // Alguma aula já tem sala cadastrada? (se não, o filtro de sala não faz sentido)
    temSalas() {
      return this.query("SELECT COUNT(*) AS n FROM alocacoes WHERE sala_id IS NOT NULL")[0].n > 0;
    }

    // ---- consulta principal com filtros opcionais ----
    // filtros: { turma, professor, dia, sala, disciplina } (id numérico ou null)
    grade(f = {}) {
      return this.query(
        `SELECT * FROM vw_grade
          WHERE (:turma      IS NULL OR turma_id      = :turma)
            AND (:professor  IS NULL OR professor_id  = :professor)
            AND (:dia        IS NULL OR dia_id        = :dia)
            AND (:sala       IS NULL OR sala_id       = :sala)
            AND (:disciplina IS NULL OR disciplina_id = :disciplina)
          ORDER BY dia_id, horario_ordem, turma_id, grupo`,
        toParams(f)
      );
    }

    // Quem leciona cada disciplina (e para quais turmas), respeitando os filtros
    disciplinasEProfessores(f = {}) {
      return this.query(
        `SELECT disciplina_sigla, disciplina, professor,
                COUNT(*)                                        AS aulas_semana,
                GROUP_CONCAT(DISTINCT turma)                    AS turmas
           FROM vw_grade
          WHERE (:turma      IS NULL OR turma_id      = :turma)
            AND (:professor  IS NULL OR professor_id  = :professor)
            AND (:dia        IS NULL OR dia_id        = :dia)
            AND (:sala       IS NULL OR sala_id       = :sala)
            AND (:disciplina IS NULL OR disciplina_id = :disciplina)
          GROUP BY disciplina_id, professor_id
          ORDER BY disciplina_sigla, professor`,
        toParams(f)
      );
    }
  }

  function toParams(f) {
    const v = (x) => (x === undefined || x === null || x === "" ? null : Number(x));
    return {
      ":turma": v(f.turma),
      ":professor": v(f.professor),
      ":dia": v(f.dia),
      ":sala": v(f.sala),
      ":disciplina": v(f.disciplina),
    };
  }

  return { open };
})();
