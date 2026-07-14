-- ============================================
-- EXERCÍCIO 02 - FUNCIONÁRIOS E DEPARTAMENTOS
-- ============================================

-- Apaga o banco caso já exista
DROP DATABASE IF EXISTS db_empresa;

-- Cria o banco
CREATE DATABASE db_empresa;

-- Seleciona o banco
USE db_empresa;

-- Criação da tabela Departamentos
CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome_departamento VARCHAR(100) NOT NULL
);

-- Criação da tabela Funcionários
CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    id_departamento INT,
    CONSTRAINT fk_funcionario_departamento
        FOREIGN KEY (id_departamento)
        REFERENCES departamentos(id_departamento)
);

-- Inserindo departamentos
INSERT INTO departamentos (nome_departamento) VALUES
('Tecnologia'),
('Financeiro'),
('Recursos Humanos'),
('Marketing'),
('Vendas'),
('Logística'),
('Produção'),
('Compras'),
('Jurídico'),
('Atendimento');

-- Inserindo funcionários
INSERT INTO funcionarios (nome, cargo, salario, id_departamento) VALUES
('Carlos','Programador',3500.00,1),
('Ana','Analista Financeiro',4200.00,2),
('Bruno','Assistente RH',2200.00,3),
('Daniela','Designer',3800.00,4),
('Eduardo','Vendedor',2600.00,5),
('Fernanda','Logística',3100.00,6),
('Gabriel','Operador',2400.00,7),
('Helena','Compradora',3600.00,8),
('Igor','Advogado',5500.00,9),
('Juliana','Atendente',2100.00,10);

-- Mostrar todos os departamentos
SELECT * FROM departamentos;

-- Mostrar todos os funcionários
SELECT * FROM funcionarios;

-- Funcionários com salário maior que R$ 3.000,00
SELECT * FROM funcionarios
WHERE salario > 3000;

-- Atualizar salário do Carlos
UPDATE funcionarios
SET salario = 4000.00
WHERE id_funcionario = 1;

-- Excluir Bruno
DELETE FROM funcionarios
WHERE id_funcionario = 3;

-- Mostrar funcionário junto com seu departamento
SELECT
    f.id_funcionario,
    f.nome AS Funcionario,
    f.cargo,
    f.salario,
    d.nome_departamento AS Departamento
FROM funcionarios f
INNER JOIN departamentos d
ON f.id_departamento = d.id_departamento;