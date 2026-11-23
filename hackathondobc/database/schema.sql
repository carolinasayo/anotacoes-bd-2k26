/*
Hackathon Prolongado de Banco de Dados II
Horários de aula - Curso de Desenvolvimento de Sistemas
Banco: SQLite (roda no navegador via sql.js)
*/

PRAGMA foreign_keys = ON;

DROP VIEW  IF EXISTS vw_grade;
DROP TABLE IF EXISTS alocacoes;
DROP TABLE IF EXISTS horarios;
DROP TABLE IF EXISTS dias_semana;
DROP TABLE IF EXISTS salas;
DROP TABLE IF EXISTS professores;
DROP TABLE IF EXISTS disciplinas;
DROP TABLE IF EXISTS turmas;

-- Turmas do curso (são 6: 1ª, 2ª e 3ª séries, turmas A e B)
CREATE TABLE turmas (
    id     INTEGER PRIMARY KEY AUTOINCREMENT,
    nome   TEXT    NOT NULL UNIQUE,             -- ex: '1ª Série A'
    serie  INTEGER NOT NULL CHECK (serie BETWEEN 1 AND 3),
    turno  TEXT    NOT NULL CHECK (turno IN ('Manhã', 'Tarde', 'Noite'))
);

-- Disciplinas: 'sigla' é como aparece na grade (ex: 'BD I'); 'nome' é o nome por extenso
CREATE TABLE disciplinas (
    id     INTEGER PRIMARY KEY AUTOINCREMENT,
    sigla  TEXT NOT NULL UNIQUE,
    nome   TEXT NOT NULL
);

CREATE TABLE professores (
    id     INTEGER PRIMARY KEY AUTOINCREMENT,
    nome   TEXT NOT NULL UNIQUE,
    email  TEXT UNIQUE                          -- opcional
);

-- Salas comuns e laboratórios
CREATE TABLE salas (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    nome        TEXT    NOT NULL UNIQUE,
    tipo        TEXT    NOT NULL CHECK (tipo IN ('Sala', 'Laboratório')),
    capacidade  INTEGER NOT NULL CHECK (capacidade > 0)
);

CREATE TABLE dias_semana (
    id          INTEGER PRIMARY KEY,            -- 1 = segunda ... 5 = sexta
    nome        TEXT NOT NULL UNIQUE,
    abreviacao  TEXT NOT NULL UNIQUE
);

-- Faixas de horário (a grade das turmas da manhã e da tarde usa horários diferentes)
CREATE TABLE horarios (
    id      INTEGER PRIMARY KEY AUTOINCREMENT,
    ordem   INTEGER NOT NULL UNIQUE,
    inicio  TEXT    NOT NULL,                   -- 'HH:MM'
    fim     TEXT    NOT NULL,
    CHECK (inicio < fim),
    UNIQUE (inicio, fim)
);

-- Grade horária: cada linha = uma aula de uma turma (ou de um grupo da turma)
-- num dia e horário. Professor e sala podem ficar em branco (NULL) quando
-- ainda não foram definidos.
CREATE TABLE alocacoes (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    turma_id      INTEGER NOT NULL REFERENCES turmas(id)      ON UPDATE CASCADE ON DELETE CASCADE,
    disciplina_id INTEGER NOT NULL REFERENCES disciplinas(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    professor_id  INTEGER          REFERENCES professores(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    sala_id       INTEGER          REFERENCES salas(id)       ON UPDATE CASCADE ON DELETE RESTRICT,
    dia_id        INTEGER NOT NULL REFERENCES dias_semana(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    horario_id    INTEGER NOT NULL REFERENCES horarios(id)    ON UPDATE CASCADE ON DELETE RESTRICT,
    grupo         TEXT    NOT NULL DEFAULT 'Classe inteira'
                  CHECK (grupo IN ('Classe inteira', 'A', 'B')),

    -- Evita conflitos de agenda:
    UNIQUE (turma_id,     grupo, dia_id, horario_id),  -- turma/grupo não tem duas aulas ao mesmo tempo
    UNIQUE (professor_id, dia_id, horario_id),         -- professor não dá duas aulas ao mesmo tempo
    UNIQUE (sala_id,      dia_id, horario_id)          -- sala não é usada por duas turmas ao mesmo tempo
);

CREATE INDEX idx_aloc_turma     ON alocacoes (turma_id);
CREATE INDEX idx_aloc_professor ON alocacoes (professor_id);
CREATE INDEX idx_aloc_sala      ON alocacoes (sala_id);
CREATE INDEX idx_aloc_dia       ON alocacoes (dia_id);

-- View usada pela aplicação: junta tudo numa consulta pronta
CREATE VIEW vw_grade AS
SELECT
    a.id                              AS id,
    t.id                              AS turma_id,
    t.nome                            AS turma,
    d.id                              AS disciplina_id,
    d.sigla                           AS disciplina_sigla,
    d.nome                            AS disciplina,
    p.id                              AS professor_id,
    COALESCE(p.nome, 'A definir')     AS professor,
    s.id                              AS sala_id,
    s.nome                            AS sala,
    s.tipo                            AS sala_tipo,
    a.grupo                           AS grupo,
    w.id                              AS dia_id,
    w.nome                            AS dia,
    w.abreviacao                      AS dia_abrev,
    h.id                              AS horario_id,
    h.ordem                           AS horario_ordem,
    h.inicio                          AS inicio,
    h.fim                             AS fim
FROM alocacoes a
JOIN turmas       t ON t.id = a.turma_id
JOIN disciplinas  d ON d.id = a.disciplina_id
LEFT JOIN professores p ON p.id = a.professor_id
LEFT JOIN salas       s ON s.id = a.sala_id
JOIN dias_semana  w ON w.id = a.dia_id
JOIN horarios     h ON h.id = a.horario_id;
