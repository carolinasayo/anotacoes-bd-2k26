/* -- dados contendo apenas as turmas de verdade (manhã) */
PRAGMA foreign_keys = ON;

INSERT INTO turmas (nome, serie, turno) VALUES
  ('1ª Série A', 1, 'Manhã'),
  ('1ª Série B', 1, 'Tarde'),
  ('2ª Série A', 2, 'Manhã'),
  ('2ª Série B', 2, 'Tarde'),
  ('3ª Série A', 3, 'Manhã'),
  ('3ª Série B', 3, 'Tarde');

INSERT INTO disciplinas (sigla, nome) VALUES
  ('BD I', 'Banco de Dados I'),
  ('HIST', 'História'),
  ('ARTE', 'Arte'),
  ('LI', 'Língua Inglesa'),
  ('FIS', 'Física'),
  ('MAT', 'Matemática'),
  ('LP', 'Língua Portuguesa'),
  ('GEO', 'Geografia'),
  ('BIO', 'Biologia'),
  ('PA', 'PA'),
  ('PW I', 'Programação Web I'),
  ('PTIC', 'PTIC'),
  ('SEIT', 'SEIT'),
  ('QUI', 'Química'),
  ('EF', 'Educação Física'),
  ('CPRT', 'CPRT'),
  ('DS', 'Desenvolvimento de Sistemas'),
  ('PW', 'Programação Web'),
  ('INGLÊS', 'Inglês'),
  ('PAM', 'Programação de Aplicativos Mobile'),
  ('ECO', 'Ética e Cidadania Organizacional'),
  ('LPL', 'Língua Portuguesa e Literatura'),
  ('BD', 'Banco de Dados'),
  ('IPSSI', 'IPSSI'),
  ('PAM II', 'Programação de Aplicativos Mobile II'),
  ('PDTCC', 'Planejamento e Desenvolvimento do TCC'),
  ('SE', 'SE'),
  ('SOCIO', 'Sociologia'),
  ('FILO', 'Filosofia'),
  ('QTS', 'Qualidade e Teste de Software'),
  ('PW III', 'Programação Web III');

INSERT INTO professores (nome, email) VALUES
  ('Aleteia V. M. Souto', 'leteia@camargoearanha'),
  ('Alícia V. Lima', NULL),
  ('Andre S. Maia', NULL),
  ('Bruno Cano', 'bc@camargoearanha'),
  ('Cassio M. L. de Aquino', NULL),
  ('Célide T. da Silva', 'celidetassogoat@camargoearanha'),
  ('Danilo K. dos S. Araujo', NULL),
  ('Davi Vilar', 'davigoat@camargoearanha'),
  ('Fabiano de A. Machado', NULL),
  ('Fernanda C. Medeiros', NULL),
  ('Gustavo M. G. Martins', NULL),
  ('Henrique D. Pastor', NULL),
  ('Joao E. T. Martins', NULL),
  ('Joao P. T. de Siles', 'jnoctis@camargoearanha'),
  ('Jose A. de Campos', NULL),
  ('Jose A. do Amaral', NULL),
  ('Juarez B. de S. Junior', NULL),
  ('Lara C. Dable', NULL),
  ('Leandro B. de Souza', NULL),
  ('Luis T. V. Festino', NULL),
  ('Luiz A. de Lima', NULL),
  ('Marcelo P. Broti', NULL),
  ('Marcio Bergamin', NULL),
  ('Marcos V. R. Vital', NULL),
  ('Maria de L. B. Fuentes', NULL),
  ('Marilene A. Viana', NULL),
  ('Miriam F. R. Couto', NULL),
  ('Moyses B. Filho', NULL),
  ('Paola C. de Oliveira', NULL),
  ('Raphael de A. N. Gomes', NULL),
  ('Regina C. P. Ramos', NULL),
  ('Renata F. Ferrari', NULL),
  ('Rhanyel E. A. R. G. de Lima', NULL),
  ('Ricardo F. Palhares', NULL),
  ('Ricardo S. Arruda / Gabriel P. de G. Alves', NULL),
  ('Ruth do Carmo', NULL),
  ('Sandra R. S. de Oliveira', NULL),
  ('Silvio A. Pêra', NULL),
  ('Talyta C. A. Rubio', NULL),
  ('Thiago G. Pascotto', NULL),
  ('Valdeci B. Mangianelli', NULL),
  ('Vanessa A. G. Giron', NULL),
  ('Veruska M. de Sousa', NULL),
  ('Vinicius B. M. Guidio', NULL),
  ('Vivaldo R. Silva', NULL);

INSERT INTO salas (nome, tipo, capacidade) VALUES
  ('Sala 1', 'Sala', 40),
  ('Sala 2', 'Sala', 40),
  ('Sala 3', 'Sala', 40),
  ('Sala 4', 'Sala', 40),
  ('Sala 5', 'Sala', 40),
  ('Sala 6', 'Sala', 40),
  ('Lab 1', 'Laboratório', 20),
  ('Lab 2', 'Laboratório', 20),
  ('Lab 3', 'Laboratório', 20),
  ('Lab 4', 'Laboratório', 20),
  ('Lab 5', 'Laboratório', 20);

INSERT INTO dias_semana (id, nome, abreviacao) VALUES
  (1, 'Segunda-feira', 'Seg'),
  (2, 'Terça-feira', 'Ter'),
  (3, 'Quarta-feira', 'Qua'),
  (4, 'Quinta-feira', 'Qui'),
  (5, 'Sexta-feira', 'Sex');

INSERT INTO horarios (ordem, inicio, fim) VALUES
  (1, '07:00', '07:50'),
  (2, '07:50', '08:40'),
  (3, '08:40', '09:30'),
  (4, '09:45', '10:20'),
  (5, '09:45', '10:35'),
  (6, '10:20', '11:10'),
  (7, '10:35', '11:25'),
  (8, '11:10', '12:00'),
  (9, '11:25', '12:15'),
  (10, '13:00', '13:50'),
  (11, '13:15', '14:05'),
  (12, '13:50', '14:40'),
  (13, '14:05', '14:55'),
  (14, '14:40', '15:30'),
  (15, '15:45', '16:35'),
  (16, '16:35', '17:25'),
  (17, '17:25', '18:15');

-- colunas: turma_id, disciplina_id, professor_id, sala_id, dia_id, horario_id, grupo
INSERT INTO alocacoes (turma_id, disciplina_id, professor_id, sala_id, dia_id, horario_id, grupo) VALUES
  -- 1ª Série A
  (1, 1, 40, NULL, 1, 1, 'A'), -- Seg 07:00 BD I (A)
  (1, 1, 7, NULL, 1, 1, 'B'), -- Seg 07:00 BD I (B)
  (1, 2, 38, NULL, 2, 1, 'Classe inteira'), -- Ter 07:00 HIST
  (1, 3, 39, NULL, 3, 1, 'Classe inteira'), -- Qua 07:00 ARTE
  (1, 4, 18, NULL, 4, 1, 'Classe inteira'), -- Qui 07:00 LI
  (1, 5, 15, NULL, 5, 1, 'Classe inteira'), -- Sex 07:00 FIS
  (1, 1, 40, NULL, 1, 2, 'A'), -- Seg 07:50 BD I (A)
  (1, 1, 7, NULL, 1, 2, 'B'), -- Seg 07:50 BD I (B)
  (1, 2, 38, NULL, 2, 2, 'Classe inteira'), -- Ter 07:50 HIST
  (1, 3, 39, NULL, 3, 2, 'Classe inteira'), -- Qua 07:50 ARTE
  (1, 4, 18, NULL, 4, 2, 'Classe inteira'), -- Qui 07:50 LI
  (1, 5, 15, NULL, 5, 2, 'Classe inteira'), -- Sex 07:50 FIS
  (1, 6, 13, NULL, 1, 3, 'Classe inteira'), -- Seg 08:40 MAT
  (1, 7, 42, NULL, 2, 3, 'Classe inteira'), -- Ter 08:40 LP
  (1, 8, 5, NULL, 3, 3, 'Classe inteira'), -- Qua 08:40 GEO
  (1, 9, 37, NULL, 4, 3, 'Classe inteira'), -- Qui 08:40 BIO
  (1, 9, 37, NULL, 5, 3, 'Classe inteira'), -- Sex 08:40 BIO
  (1, 6, 13, NULL, 1, 5, 'Classe inteira'), -- Seg 09:45 MAT
  (1, 7, 42, NULL, 2, 5, 'Classe inteira'), -- Ter 09:45 LP
  (1, 8, 5, NULL, 3, 5, 'Classe inteira'), -- Qua 09:45 GEO
  (1, 10, 40, NULL, 4, 5, 'A'), -- Qui 09:45 PA (A)
  (1, 10, 1, NULL, 4, 5, 'B'), -- Qui 09:45 PA (B)
  (1, 11, 40, NULL, 5, 5, 'Classe inteira'), -- Sex 09:45 PW I
  (1, 12, 4, NULL, 1, 7, 'A'), -- Seg 10:35 PTIC (A)
  (1, 12, NULL, NULL, 1, 7, 'B'), -- Seg 10:35 PTIC (B)
  (1, 13, 1, NULL, 2, 7, 'A'), -- Ter 10:35 SEIT (A)
  (1, 13, 6, NULL, 2, 7, 'B'), -- Ter 10:35 SEIT (B)
  (1, 14, 29, NULL, 3, 7, 'Classe inteira'), -- Qua 10:35 QUI
  (1, 10, 40, NULL, 4, 7, 'A'), -- Qui 10:35 PA (A)
  (1, 10, 1, NULL, 4, 7, 'B'), -- Qui 10:35 PA (B)
  (1, 11, 40, NULL, 5, 7, 'Classe inteira'), -- Sex 10:35 PW I
  (1, 12, 4, NULL, 1, 9, 'A'), -- Seg 11:25 PTIC (A)
  (1, 12, NULL, NULL, 1, 9, 'B'), -- Seg 11:25 PTIC (B)
  (1, 13, 1, NULL, 2, 9, 'A'), -- Ter 11:25 SEIT (A)
  (1, 13, 6, NULL, 2, 9, 'B'), -- Ter 11:25 SEIT (B)
  (1, 14, 29, NULL, 3, 9, 'Classe inteira'), -- Qua 11:25 QUI
  (1, 10, 40, NULL, 4, 9, 'A'), -- Qui 11:25 PA (A)
  (1, 10, 1, NULL, 4, 9, 'B'), -- Qui 11:25 PA (B)
  (1, 11, 40, NULL, 5, 9, 'Classe inteira'), -- Sex 11:25 PW I
  (1, 15, NULL, NULL, 5, 11, 'Classe inteira'), -- Sex 13:15 EF
  (1, 15, NULL, NULL, 5, 13, 'Classe inteira'), -- Sex 14:05 EF
  (1, 16, 22, NULL, 4, 14, 'Classe inteira'), -- Qui 14:40 CPRT

  -- 1ª Série B
  (2, 16, 22, NULL, 2, 4, 'Classe inteira'), -- Ter 09:45 CPRT
  (2, 15, NULL, NULL, 5, 6, 'Classe inteira'), -- Sex 10:20 EF
  (2, 15, NULL, NULL, 5, 8, 'Classe inteira'), -- Sex 11:10 EF
  (2, 9, 10, NULL, 1, 10, 'Classe inteira'), -- Seg 13:00 BIO
  (2, 7, 44, NULL, 2, 10, 'Classe inteira'), -- Ter 13:00 LP
  (2, 5, 15, NULL, 3, 10, 'Classe inteira'), -- Qua 13:00 FIS
  (2, 10, 3, NULL, 4, 10, 'A'), -- Qui 13:00 PA (A)
  (2, 10, 1, NULL, 4, 10, 'B'), -- Qui 13:00 PA (B)
  (2, 4, 24, NULL, 5, 10, 'Classe inteira'), -- Sex 13:00 LI
  (2, 9, 10, NULL, 1, 12, 'Classe inteira'), -- Seg 13:50 BIO
  (2, 7, 44, NULL, 2, 12, 'Classe inteira'), -- Ter 13:50 LP
  (2, 5, 15, NULL, 3, 12, 'Classe inteira'), -- Qua 13:50 FIS
  (2, 10, 3, NULL, 4, 12, 'A'), -- Qui 13:50 PA (A)
  (2, 10, 1, NULL, 4, 12, 'B'), -- Qui 13:50 PA (B)
  (2, 4, 24, NULL, 5, 12, 'Classe inteira'), -- Sex 13:50 LI
  (2, 13, NULL, NULL, 1, 14, 'A'), -- Seg 14:40 SEIT (A)
  (2, 13, 34, NULL, 1, 14, 'B'), -- Seg 14:40 SEIT (B)
  (2, 14, 29, NULL, 2, 14, 'Classe inteira'), -- Ter 14:40 QUI
  (2, 1, 32, NULL, 3, 14, 'A'), -- Qua 14:40 BD I (A)
  (2, 1, 3, NULL, 3, 14, 'B'), -- Qua 14:40 BD I (B)
  (2, 10, 3, NULL, 4, 14, 'A'), -- Qui 14:40 PA (A)
  (2, 10, 1, NULL, 4, 14, 'B'), -- Qui 14:40 PA (B)
  (2, 3, 45, NULL, 5, 14, 'Classe inteira'), -- Sex 14:40 ARTE
  (2, 13, NULL, NULL, 1, 15, 'A'), -- Seg 15:45 SEIT (A)
  (2, 13, 34, NULL, 1, 15, 'B'), -- Seg 15:45 SEIT (B)
  (2, 14, 29, NULL, 2, 15, 'Classe inteira'), -- Ter 15:45 QUI
  (2, 1, 32, NULL, 3, 15, 'A'), -- Qua 15:45 BD I (A)
  (2, 1, 3, NULL, 3, 15, 'B'), -- Qua 15:45 BD I (B)
  (2, 11, 3, NULL, 4, 15, 'A'), -- Qui 15:45 PW I (A)
  (2, 11, 12, NULL, 4, 15, 'B'), -- Qui 15:45 PW I (B)
  (2, 3, 45, NULL, 5, 15, 'Classe inteira'), -- Sex 15:45 ARTE
  (2, 2, NULL, NULL, 1, 16, 'Classe inteira'), -- Seg 16:35 HIST
  (2, 12, NULL, NULL, 2, 16, 'A'), -- Ter 16:35 PTIC (A)
  (2, 12, 34, NULL, 2, 16, 'B'), -- Ter 16:35 PTIC (B)
  (2, 8, NULL, NULL, 3, 16, 'Classe inteira'), -- Qua 16:35 GEO
  (2, 11, 3, NULL, 4, 16, 'A'), -- Qui 16:35 PW I (A)
  (2, 11, 12, NULL, 4, 16, 'B'), -- Qui 16:35 PW I (B)
  (2, 6, 25, NULL, 5, 16, 'Classe inteira'), -- Sex 16:35 MAT
  (2, 2, NULL, NULL, 1, 17, 'Classe inteira'), -- Seg 17:25 HIST
  (2, 12, NULL, NULL, 2, 17, 'A'), -- Ter 17:25 PTIC (A)
  (2, 12, 34, NULL, 2, 17, 'B'), -- Ter 17:25 PTIC (B)
  (2, 8, NULL, NULL, 3, 17, 'Classe inteira'), -- Qua 17:25 GEO
  (2, 11, 3, NULL, 4, 17, 'A'), -- Qui 17:25 PW I (A)
  (2, 11, 12, NULL, 4, 17, 'B'), -- Qui 17:25 PW I (B)
  (2, 6, 25, NULL, 5, 17, 'Classe inteira'), -- Sex 17:25 MAT

  -- 2ª Série A
  (3, 17, 8, NULL, 1, 1, 'A'), -- Seg 07:00 DS (A)
  (3, 17, 14, NULL, 1, 1, 'B'), -- Seg 07:00 DS (B)
  (3, 18, 40, NULL, 2, 1, 'A'), -- Ter 07:00 PW (A)
  (3, 18, 6, NULL, 2, 1, 'B'), -- Ter 07:00 PW (B)
  (3, 9, 37, NULL, 3, 1, 'Classe inteira'), -- Qua 07:00 BIO
  (3, 5, 28, NULL, 4, 1, 'Classe inteira'), -- Qui 07:00 FIS
  (3, 19, 19, NULL, 5, 1, 'Classe inteira'), -- Sex 07:00 INGLÊS
  (3, 17, 8, NULL, 1, 2, 'A'), -- Seg 07:50 DS (A)
  (3, 17, 14, NULL, 1, 2, 'B'), -- Seg 07:50 DS (B)
  (3, 18, 40, NULL, 2, 2, 'A'), -- Ter 07:50 PW (A)
  (3, 18, 6, NULL, 2, 2, 'B'), -- Ter 07:50 PW (B)
  (3, 9, 37, NULL, 3, 2, 'Classe inteira'), -- Qua 07:50 BIO
  (3, 5, 28, NULL, 4, 2, 'Classe inteira'), -- Qui 07:50 FIS
  (3, 19, 19, NULL, 5, 2, 'Classe inteira'), -- Sex 07:50 INGLÊS
  (3, 17, 8, NULL, 1, 3, 'A'), -- Seg 08:40 DS (A)
  (3, 17, 14, NULL, 1, 3, 'B'), -- Seg 08:40 DS (B)
  (3, 2, 38, NULL, 2, 3, 'Classe inteira'), -- Ter 08:40 HIST
  (3, 6, 13, NULL, 3, 3, 'Classe inteira'), -- Qua 08:40 MAT
  (3, 6, 13, NULL, 4, 3, 'Classe inteira'), -- Qui 08:40 MAT
  (3, 20, 16, NULL, 5, 3, 'A'), -- Sex 08:40 PAM (A)
  (3, 20, 6, NULL, 5, 3, 'B'), -- Sex 08:40 PAM (B)
  (3, 21, 26, NULL, 1, 5, 'Classe inteira'), -- Seg 09:45 ECO
  (3, 2, 38, NULL, 2, 5, 'Classe inteira'), -- Ter 09:45 HIST
  (3, 22, 36, NULL, 3, 5, 'Classe inteira'), -- Qua 09:45 LPL
  (3, 6, 13, NULL, 4, 5, 'Classe inteira'), -- Qui 09:45 MAT
  (3, 20, 16, NULL, 5, 5, 'A'), -- Sex 09:45 PAM (A)
  (3, 20, 6, NULL, 5, 5, 'B'), -- Sex 09:45 PAM (B)
  (3, 22, 36, NULL, 1, 7, 'Classe inteira'), -- Seg 10:35 LPL
  (3, 15, 31, NULL, 2, 7, 'Classe inteira'), -- Ter 10:35 EF
  (3, 14, 28, NULL, 3, 7, 'Classe inteira'), -- Qua 10:35 QUI
  (3, 23, 8, NULL, 4, 7, 'A'), -- Qui 10:35 BD (A)
  (3, 23, 6, NULL, 4, 7, 'B'), -- Qui 10:35 BD (B)
  (3, 8, NULL, NULL, 5, 7, 'Classe inteira'), -- Sex 10:35 GEO
  (3, 22, 36, NULL, 1, 9, 'Classe inteira'), -- Seg 11:25 LPL
  (3, 15, 31, NULL, 2, 9, 'Classe inteira'), -- Ter 11:25 EF
  (3, 14, 28, NULL, 3, 9, 'Classe inteira'), -- Qua 11:25 QUI
  (3, 23, 8, NULL, 4, 9, 'A'), -- Qui 11:25 BD (A)
  (3, 23, 6, NULL, 4, 9, 'B'), -- Qui 11:25 BD (B)
  (3, 8, NULL, NULL, 5, 9, 'Classe inteira'), -- Sex 11:25 GEO

  -- 2ª Série B
  (4, 2, 9, NULL, 1, 10, 'Classe inteira'), -- Seg 13:00 HIST
  (4, 23, 8, NULL, 2, 10, 'A'), -- Ter 13:00 BD (A)
  (4, 23, 4, NULL, 2, 10, 'B'), -- Ter 13:00 BD (B)
  (4, 19, 43, NULL, 3, 10, 'Classe inteira'), -- Qua 13:00 INGLÊS
  (4, 17, 12, NULL, 4, 10, 'A'), -- Qui 13:00 DS (A)
  (4, 17, 34, NULL, 4, 10, 'B'), -- Qui 13:00 DS (B)
  (4, 14, 29, NULL, 5, 10, 'Classe inteira'), -- Sex 13:00 QUI
  (4, 2, 9, NULL, 1, 12, 'Classe inteira'), -- Seg 13:50 HIST
  (4, 23, 8, NULL, 2, 12, 'A'), -- Ter 13:50 BD (A)
  (4, 23, 4, NULL, 2, 12, 'B'), -- Ter 13:50 BD (B)
  (4, 19, 43, NULL, 3, 12, 'Classe inteira'), -- Qua 13:50 INGLÊS
  (4, 17, 12, NULL, 4, 12, 'A'), -- Qui 13:50 DS (A)
  (4, 17, 34, NULL, 4, 12, 'B'), -- Qui 13:50 DS (B)
  (4, 14, 29, NULL, 5, 12, 'Classe inteira'), -- Sex 13:50 QUI
  (4, 22, 11, NULL, 1, 14, 'Classe inteira'), -- Seg 14:40 LPL
  (4, 18, 40, NULL, 2, 14, 'A'), -- Ter 14:40 PW (A)
  (4, 18, 34, NULL, 2, 14, 'B'), -- Ter 14:40 PW (B)
  (4, 20, 23, NULL, 3, 14, 'Classe inteira'), -- Qua 14:40 PAM
  (4, 17, 12, NULL, 4, 14, 'A'), -- Qui 14:40 DS (A)
  (4, 17, 34, NULL, 4, 14, 'B'), -- Qui 14:40 DS (B)
  (4, 9, 10, NULL, 5, 14, 'Classe inteira'), -- Sex 14:40 BIO
  (4, 6, 13, NULL, 1, 15, 'Classe inteira'), -- Seg 15:45 MAT
  (4, 18, 40, NULL, 2, 15, 'A'), -- Ter 15:45 PW (A)
  (4, 18, 34, NULL, 2, 15, 'B'), -- Ter 15:45 PW (B)
  (4, 20, 23, NULL, 3, 15, 'Classe inteira'), -- Qua 15:45 PAM
  (4, 21, 22, NULL, 4, 15, 'Classe inteira'), -- Qui 15:45 ECO
  (4, 9, 10, NULL, 5, 15, 'Classe inteira'), -- Sex 15:45 BIO
  (4, 5, 30, NULL, 1, 16, 'Classe inteira'), -- Seg 16:35 FIS
  (4, 6, 13, NULL, 2, 16, 'Classe inteira'), -- Ter 16:35 MAT
  (4, 8, 27, NULL, 3, 16, 'Classe inteira'), -- Qua 16:35 GEO
  (4, 15, 33, NULL, 4, 16, 'Classe inteira'), -- Qui 16:35 EF
  (4, 22, 11, NULL, 5, 16, 'Classe inteira'), -- Sex 16:35 LPL
  (4, 5, 30, NULL, 1, 17, 'Classe inteira'), -- Seg 17:25 FIS
  (4, 6, 13, NULL, 2, 17, 'Classe inteira'), -- Ter 17:25 MAT
  (4, 8, 27, NULL, 3, 17, 'Classe inteira'), -- Qua 17:25 GEO
  (4, 15, 33, NULL, 4, 17, 'Classe inteira'), -- Qui 17:25 EF
  (4, 22, 11, NULL, 5, 17, 'Classe inteira'), -- Sex 17:25 LPL

  -- 3ª Série A
  (5, 24, 17, NULL, 1, 1, 'A'), -- Seg 07:00 IPSSI (A)
  (5, 24, 4, NULL, 1, 1, 'B'), -- Seg 07:00 IPSSI (B)
  (5, 7, 11, NULL, 2, 1, 'Classe inteira'), -- Ter 07:00 LP
  (5, 25, 14, NULL, 3, 1, 'Classe inteira'), -- Qua 07:00 PAM II
  (5, 26, 8, NULL, 4, 1, 'A'), -- Qui 07:00 PDTCC (A)
  (5, 26, 6, NULL, 4, 1, 'B'), -- Qui 07:00 PDTCC (B)
  (5, 6, 13, NULL, 5, 1, 'Classe inteira'), -- Sex 07:00 MAT
  (5, 24, 17, NULL, 1, 2, 'A'), -- Seg 07:50 IPSSI (A)
  (5, 24, 4, NULL, 1, 2, 'B'), -- Seg 07:50 IPSSI (B)
  (5, 7, 11, NULL, 2, 2, 'Classe inteira'), -- Ter 07:50 LP
  (5, 25, 14, NULL, 3, 2, 'Classe inteira'), -- Qua 07:50 PAM II
  (5, 26, 8, NULL, 4, 2, 'A'), -- Qui 07:50 PDTCC (A)
  (5, 26, 6, NULL, 4, 2, 'B'), -- Qui 07:50 PDTCC (B)
  (5, 6, 13, NULL, 5, 2, 'Classe inteira'), -- Sex 07:50 MAT
  (5, 9, 37, NULL, 1, 3, 'Classe inteira'), -- Seg 08:40 BIO
  (5, 27, 1, NULL, 2, 3, 'Classe inteira'), -- Ter 08:40 SE
  (5, 8, 20, NULL, 3, 3, 'Classe inteira'), -- Qua 08:40 GEO
  (5, 26, 8, NULL, 4, 3, 'A'), -- Qui 08:40 PDTCC (A)
  (5, 26, 6, NULL, 4, 3, 'B'), -- Qui 08:40 PDTCC (B)
  (5, 28, 2, NULL, 5, 3, 'Classe inteira'), -- Sex 08:40 SOCIO
  (5, 9, 37, NULL, 1, 5, 'Classe inteira'), -- Seg 09:45 BIO
  (5, 27, 1, NULL, 2, 5, 'Classe inteira'), -- Ter 09:45 SE
  (5, 8, 20, NULL, 3, 5, 'Classe inteira'), -- Qua 09:45 GEO
  (5, 7, 11, NULL, 4, 5, 'Classe inteira'), -- Qui 09:45 LP
  (5, 28, 2, NULL, 5, 5, 'Classe inteira'), -- Sex 09:45 SOCIO
  (5, 29, 2, NULL, 1, 7, 'Classe inteira'), -- Seg 10:35 FILO
  (5, 6, 13, NULL, 2, 7, 'Classe inteira'), -- Ter 10:35 MAT
  (5, 30, 23, NULL, 3, 7, 'A'), -- Qua 10:35 QTS (A)
  (5, 30, 40, NULL, 3, 7, 'B'), -- Qua 10:35 QTS (B)
  (5, 4, 19, NULL, 4, 7, 'Classe inteira'), -- Qui 10:35 LI
  (5, 31, 14, NULL, 5, 7, 'Classe inteira'), -- Sex 10:35 PW III
  (5, 29, 2, NULL, 1, 9, 'Classe inteira'), -- Seg 11:25 FILO
  (5, 6, 13, NULL, 2, 9, 'Classe inteira'), -- Ter 11:25 MAT
  (5, 30, 23, NULL, 3, 9, 'A'), -- Qua 11:25 QTS (A)
  (5, 30, 40, NULL, 3, 9, 'B'), -- Qua 11:25 QTS (B)
  (5, 4, 19, NULL, 4, 9, 'Classe inteira'), -- Qui 11:25 LI
  (5, 31, 14, NULL, 5, 9, 'Classe inteira'), -- Sex 11:25 PW III

  -- 3ª Série B
  (6, 27, 4, NULL, 1, 10, 'A'), -- Seg 13:00 SE (A)
  (6, 27, 34, NULL, 1, 10, 'B'), -- Seg 13:00 SE (B)
  (6, 24, 1, NULL, 2, 10, 'A'), -- Ter 13:00 IPSSI (A)
  (6, 24, 6, NULL, 2, 10, 'B'), -- Ter 13:00 IPSSI (B)
  (6, 31, 8, NULL, 3, 10, 'A'), -- Qua 13:00 PW III (A)
  (6, 31, 21, NULL, 3, 10, 'B'), -- Qua 13:00 PW III (B)
  (6, 7, 44, NULL, 4, 10, 'Classe inteira'), -- Qui 13:00 LP
  (6, 25, 4, NULL, 5, 10, 'A'), -- Sex 13:00 PAM II (A)
  (6, 25, 34, NULL, 5, 10, 'B'), -- Sex 13:00 PAM II (B)
  (6, 27, 4, NULL, 1, 12, 'A'), -- Seg 13:50 SE (A)
  (6, 27, 34, NULL, 1, 12, 'B'), -- Seg 13:50 SE (B)
  (6, 24, 1, NULL, 2, 12, 'A'), -- Ter 13:50 IPSSI (A)
  (6, 24, 6, NULL, 2, 12, 'B'), -- Ter 13:50 IPSSI (B)
  (6, 31, 8, NULL, 3, 12, 'A'), -- Qua 13:50 PW III (A)
  (6, 31, 21, NULL, 3, 12, 'B'), -- Qua 13:50 PW III (B)
  (6, 7, 44, NULL, 4, 12, 'Classe inteira'), -- Qui 13:50 LP
  (6, 25, 4, NULL, 5, 12, 'A'), -- Sex 13:50 PAM II (A)
  (6, 25, 34, NULL, 5, 12, 'B'), -- Sex 13:50 PAM II (B)
  (6, 8, 41, NULL, 1, 14, 'Classe inteira'), -- Seg 14:40 GEO
  (6, 9, 10, NULL, 2, 14, 'Classe inteira'), -- Ter 14:40 BIO
  (6, 30, 8, NULL, 3, 14, 'A'), -- Qua 14:40 QTS (A)
  (6, 30, 21, NULL, 3, 14, 'B'), -- Qua 14:40 QTS (B)
  (6, 7, 44, NULL, 4, 14, 'Classe inteira'), -- Qui 14:40 LP
  (6, 29, 2, NULL, 5, 14, 'Classe inteira'), -- Sex 14:40 FILO
  (6, 8, 41, NULL, 1, 15, 'Classe inteira'), -- Seg 15:45 GEO
  (6, 9, 10, NULL, 2, 15, 'Classe inteira'), -- Ter 15:45 BIO
  (6, 30, 8, NULL, 3, 15, 'A'), -- Qua 15:45 QTS (A)
  (6, 30, 21, NULL, 3, 15, 'B'), -- Qua 15:45 QTS (B)
  (6, 26, 8, NULL, 4, 15, 'A'), -- Qui 15:45 PDTCC (A)
  (6, 26, 34, NULL, 4, 15, 'B'), -- Qui 15:45 PDTCC (B)
  (6, 29, 2, NULL, 5, 15, 'Classe inteira'), -- Sex 15:45 FILO
  (6, 6, 13, NULL, 1, 16, 'Classe inteira'), -- Seg 16:35 MAT
  (6, 28, 35, NULL, 2, 16, 'Classe inteira'), -- Ter 16:35 SOCIO
  (6, 6, 13, NULL, 3, 16, 'Classe inteira'), -- Qua 16:35 MAT
  (6, 26, 8, NULL, 4, 16, 'A'), -- Qui 16:35 PDTCC (A)
  (6, 26, 34, NULL, 4, 16, 'B'), -- Qui 16:35 PDTCC (B)
  (6, 4, 43, NULL, 5, 16, 'Classe inteira'), -- Sex 16:35 LI
  (6, 6, 13, NULL, 1, 17, 'Classe inteira'), -- Seg 17:25 MAT
  (6, 28, 35, NULL, 2, 17, 'Classe inteira'), -- Ter 17:25 SOCIO
  (6, 6, 13, NULL, 3, 17, 'Classe inteira'), -- Qua 17:25 MAT
  (6, 26, 8, NULL, 4, 17, 'A'), -- Qui 17:25 PDTCC (A)
  (6, 26, 34, NULL, 4, 17, 'B'), -- Qui 17:25 PDTCC (B)
  (6, 4, 43, NULL, 5, 17, 'Classe inteira'); -- Sex 17:25 LI
