CREATE DATABASE loja_roupas;
USE loja_roupas;

CREATE TABLE categoria(
id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome varchar(30));

CREATE TABLE estoque(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
quantidade INT NOT NULL,
categoria_id INT,
FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

INSERT INTO categoria (id, nome) VALUES 
(NULL,'calca jeans'),
(NULL, 'camisa polo'),
(NULL, 'camiseta regata'),
(NULL, 'blusa de moletom'); 

SELECT * FROM categoria;

INSERT INTO estoque(id, quantidade, categoria_id) VALUES
(NULL, 300, 1),
(NULL, 250, 2),
(NULL, 150, 3),
(NULL, 500, 4);

SELECT * FROM estoque;

SELECT categoria.nome, estoque.quantidade
FROM categoria LEFT JOIN estoque
ON categoria.id = estoque.categoria_id
ORDER BY categoria.nome;