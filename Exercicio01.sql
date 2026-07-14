-- ============================================
-- EXERCÍCIO 01 - CURSOS E ALUNOS
-- ============================================

-- Apaga o banco caso já exista
DROP DATABASE IF EXISTS db_escola;

-- Cria o banco de dados
CREATE DATABASE db_escola;

-- Seleciona o banco
USE db_escola;

-- Criação da tabela Cursos
CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);

-- Criação da tabela Alunos
CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    id_curso INT,
    CONSTRAINT fk_aluno_curso
        FOREIGN KEY (id_curso)
        REFERENCES cursos(id_curso)
);

-- Inserindo os cursos
INSERT INTO cursos (nome_curso, carga_horaria) VALUES
('Java',400),
('Python',300),
('Banco de Dados',200),
('HTML e CSS',120),
('JavaScript',180),
('C#',350),
('PHP',250),
('Redes',220),
('Segurança da Informação',280),
('Excel',100);

-- Inserindo os alunos
INSERT INTO alunos (nome, idade, id_curso) VALUES
('Ana',20,1),
('Bruno',17,2),
('Carlos',25,3),
('Daniela',19,4),
('Eduardo',22,5),
('Fernanda',16,6),
('Gabriel',21,7),
('Helena',18,8),
('Igor',27,9),
('Juliana',23,10);

-- Mostrar todos os cursos
SELECT * FROM cursos;

-- Mostrar todos os alunos
SELECT * FROM alunos;

-- Mostrar apenas alunos maiores de idade
SELECT * FROM alunos
WHERE idade >= 18;

-- Atualizar a idade da Ana (usa a chave primária)
UPDATE alunos
SET idade = 21
WHERE id_aluno = 1;

-- Excluir o aluno Bruno (usa a chave primária)
DELETE FROM alunos
WHERE id_aluno = 2;

-- Mostrar aluno junto com o curso
SELECT
    a.id_aluno,
    a.nome AS Aluno,
    a.idade,
    c.nome_curso AS Curso,
    c.carga_horaria
FROM alunos a
INNER JOIN cursos c
ON a.id_curso = c.id_curso;