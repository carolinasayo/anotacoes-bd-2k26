/* ============================================================
   app.js - interface: filtros, abas e renderização
   ============================================================ */
(async function () {
  const $ = (sel) => document.querySelector(sel);
  const esc = (s) =>
    String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));

  const statusEl = $("#status");
  const filtros = {
    turma: $("#f-turma"),
    professor: $("#f-professor"),
    disciplina: $("#f-disciplina"),
    dia: $("#f-dia"),
    sala: $("#f-sala"),
  };

  // ---------- abre o banco ----------
  let db;
  try {
    db = await HorariosDB.open();
  } catch (err) {
    console.error(err);
    statusEl.textContent =
      "Erro ao carregar o banco de dados. Se abriu o arquivo direto do disco, rode um servidor local " +
      "(ex.: python -m http.server) e acesse http://localhost:8000. Detalhe: " + err.message;
    statusEl.classList.add("erro");
    return;
  }
  statusEl.remove();

  // ---------- preenche os filtros com dados do banco ----------
  const dias = db.dias();
  const horarios = db.horarios();

  fillSelect(filtros.turma, db.turmas());
  fillSelect(filtros.professor, db.professores());
  fillSelect(filtros.disciplina, db.disciplinas());
  fillSelect(filtros.dia, dias);

  // Salas e laboratórios separados em grupos
  const salas = db.salas();
  ["Laboratório", "Sala"].forEach((tipo) => {
    const grupo = document.createElement("optgroup");
    grupo.label = tipo === "Sala" ? "Salas" : "Laboratórios";
    salas.filter((s) => s.tipo === tipo).forEach((s) => grupo.append(new Option(s.nome, s.id)));
    filtros.sala.append(grupo);
  });

  // Enquanto nenhuma aula tiver sala cadastrada, o filtro de sala fica escondido
  if (!db.temSalas()) filtros.sala.closest("label").style.display = "none";

  function fillSelect(select, itens) {
    itens.forEach((i) => select.append(new Option(i.nome, i.id)));
  }

  // ---------- estado ----------
  let viewAtual = "grade";

  function filtrosAtuais() {
    return Object.fromEntries(Object.entries(filtros).map(([k, el]) => [k, el.value || null]));
  }

  // ---------- render ----------
  function render() {
    const f = filtrosAtuais();
    const aulas = db.grade(f);

    $("#contador").textContent = `${aulas.length} ${aulas.length === 1 ? "aula encontrada" : "aulas encontradas"}`;

    if (viewAtual === "grade") renderGrade(aulas, f);
    if (viewAtual === "lista") renderLista(aulas);
    if (viewAtual === "prof") renderProfessores(db.disciplinasEProfessores(f));
  }

  function vazio(msg) {
    return `<div class="vazio-geral">${msg}</div>`;
  }

  const rotuloGrupo = (g) => (g === "Classe inteira" ? "" : `Grupo ${g}`);

  // Grade semanal: linhas = horários, colunas = dias
  function renderGrade(aulas, f) {
    const el = $("#view-grade");
    if (!aulas.length) return (el.innerHTML = vazio("Nenhuma aula encontrada com esses filtros."));

    const diasVisiveis = f.dia ? dias.filter((d) => String(d.id) === String(f.dia)) : dias;
    const mostrarTurma = !f.turma;

    // só mostra os horários que têm aula no resultado atual
    const usados = new Set(aulas.map((a) => a.horario_id));
    const horariosVisiveis = horarios.filter((h) => usados.has(h.id));

    const thead = `<thead><tr><th>Horário</th>${diasVisiveis.map((d) => `<th>${esc(d.nome)}</th>`).join("")}</tr></thead>`;

    const linhas = horariosVisiveis
      .map((h) => {
        const celulas = diasVisiveis
          .map((d) => {
            const doSlot = aulas.filter((a) => a.dia_id === d.id && a.horario_id === h.id);
            if (!doSlot.length) return `<td class="vazio" data-dia="${esc(d.nome)}">—</td>`;
            return `<td data-dia="${esc(d.nome)}">${doSlot.map((a) => cardAula(a, mostrarTurma)).join("")}</td>`;
          })
          .join("");
        return `<tr><th scope="row">${esc(h.inicio)}<small>até ${esc(h.fim)}</small></th>${celulas}</tr>`;
      })
      .join("");

    el.innerHTML = `<div class="tabela-wrap"><table class="grade">${thead}<tbody>${linhas}</tbody></table></div>`;
  }

  function cardAula(a, mostrarTurma) {
    const lab = a.sala_tipo === "Laboratório";
    const grupo = rotuloGrupo(a.grupo);
    return `
      <div class="aula${lab ? " lab" : ""}">
        <strong>${esc(a.disciplina)}</strong>
        <span class="prof">${esc(a.professor)}</span>
        <div class="tags">
          ${a.sala ? `<span class="tag">${esc(a.sala)}</span>` : ""}
          ${grupo ? `<span class="tag">${esc(grupo)}</span>` : ""}
          ${mostrarTurma ? `<span class="tag">${esc(a.turma)}</span>` : ""}
        </div>
      </div>`;
  }

  // Lista completa (tabela)
  function renderLista(aulas) {
    const el = $("#view-lista");
    if (!aulas.length) return (el.innerHTML = vazio("Nenhuma aula encontrada com esses filtros."));
    const linhas = aulas
      .map(
        (a) => `<tr>
          <td>${esc(a.dia)}</td>
          <td>${esc(a.inicio)}–${esc(a.fim)}</td>
          <td>${esc(a.turma)}</td>
          <td>${esc(rotuloGrupo(a.grupo) || "Classe inteira")}</td>
          <td>${esc(a.disciplina)}</td>
          <td>${esc(a.professor)}</td>
          <td>${esc(a.sala || "—")}</td>
        </tr>`
      )
      .join("");
    el.innerHTML = `<div class="tabela-wrap"><table class="simples">
      <thead><tr><th>Dia</th><th>Horário</th><th>Turma</th><th>Grupo</th><th>Disciplina</th><th>Professor</th><th>Sala</th></tr></thead>
      <tbody>${linhas}</tbody></table></div>`;
  }

  // Disciplinas x professores
  function renderProfessores(rows) {
    const el = $("#view-prof");
    if (!rows.length) return (el.innerHTML = vazio("Nenhum resultado com esses filtros."));
    const linhas = rows
      .map(
        (r) => `<tr>
          <td>${esc(r.disciplina)}</td>
          <td>${esc(r.professor)}</td>
          <td>${esc(String(r.turmas).split(",").join(", "))}</td>
          <td>${r.aulas_semana}</td>
        </tr>`
      )
      .join("");
    el.innerHTML = `<div class="tabela-wrap"><table class="simples">
      <thead><tr><th>Disciplina</th><th>Professor responsável</th><th>Turmas</th><th>Aulas na semana</th></tr></thead>
      <tbody>${linhas}</tbody></table></div>`;
  }

  // ---------- eventos ----------
  Object.values(filtros).forEach((el) => el.addEventListener("change", render));

  $("#btn-limpar").addEventListener("click", () => {
    Object.values(filtros).forEach((el) => (el.value = ""));
    render();
  });

  document.querySelectorAll('[role="tab"]').forEach((btn) =>
    btn.addEventListener("click", () => mostrarView(btn.dataset.view))
  );

  function mostrarView(nome) {
    viewAtual = nome;
    document.querySelectorAll('[role="tab"]').forEach((b) =>
      b.setAttribute("aria-selected", String(b.dataset.view === nome))
    );
    ["grade", "lista", "prof"].forEach((v) => ($(`#view-${v}`).hidden = v !== nome));
    render();
  }

  mostrarView("grade");
})();
