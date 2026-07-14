-- ============================================
-- EXERCÍCIO 03 - PRODUTOS E CATEGORIAS
-- ============================================

-- Apaga o banco caso já exista
DROP DATABASE IF EXISTS db_loja;

-- Cria o banco
CREATE DATABASE db_loja;

-- Seleciona o banco
USE db_loja;

-- Criação da tabela Categorias
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL
);

-- Criação da tabela Produtos
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    id_categoria INT,
    CONSTRAINT fk_produto_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
);

-- Inserindo categorias
INSERT INTO categorias (nome_categoria) VALUES
('Informática'),
('Celulares'),
('Periféricos'),
('Escritório'),
('Games'),
('Áudio'),
('TV'),
('Eletrodomésticos'),
('Móveis'),
('Acessórios');

-- Inserindo produtos
INSERT INTO produtos (nome, preco, estoque, id_categoria) VALUES
('Teclado',120.00,30,1),
('Mouse',80.00,50,3),
('Monitor',900.00,15,1),
('Notebook',3500.00,8,1),
('Cadeira Gamer',1200.00,10,9),
('Headset',250.00,20,6),
('Impressora',700.00,12,4),
('Smartphone',1800.00,18,2),
('Controle Xbox',350.00,25,5),
('Pendrive',60.00,100,10);

-- Mostrar todas as categorias
SELECT * FROM categorias;

-- Mostrar todos os produtos
SELECT * FROM produtos;

-- Produtos com preço maior que R$ 500,00
SELECT * FROM produtos
WHERE preco > 500;

-- Atualizar preço do teclado
UPDATE produtos
SET preco = 150.00
WHERE id_produto = 1;

-- Excluir Pendrive
DELETE FROM produtos
WHERE id_produto = 10;

-- Mostrar produto junto com sua categoria
SELECT
    p.id_produto,
    p.nome AS Produto,
    p.preco,
    p.estoque,
    c.nome_categoria AS Categoria
FROM produtos p
INNER JOIN categorias c
ON p.id_categoria = c.id_categoria;