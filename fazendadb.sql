CREATE DATABASE fazendabd;

USE fazendabd;

CREATE TABLE funcionarios(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome varchar(30),
cpf varchar(11) NOT NULL,
salarios DECIMAL(10,2),
dataNascimento DATE,
equipamentos_id INT,
produtos_id INT,
FOREIGN KEY (equipamentos_id) REFERENCES equipamentos(id),
FOREIGN KEY (produtos_id) REFERENCES produtos(id)
);

CREATE TABLE producaoDeLeite(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
especie varchar(30),
dataNascimento DATE,
ultimaOrdenha DATETIME,
temperaturaLeite INT,
produtividadeQuarto INT,
inseminacoes TINYINT(1),
estimativaParto DATE,
secagemEsperada DATE,
minutosRuminacao INT
);

CREATE TABLE producaoDeQueijo(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
tipo varchar(30),
dataProducao DATE,
peso DECIMAL,
quantidade INT
);

CREATE TABLE producaoDeFruta(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
tipo varchar(30),
dataProducao DATE,
peso DECIMAL,
quantidade INT
);

CREATE TABLE producaoDeOvos(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
tipo varchar(30),
dataNascimento DATE,
peso DECIMAL,
mediaSemanal INT
);

CREATE TABLE producaoVerduras(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
tipo varchar(30),
dataProducao DATE,
peso DECIMAL,
quantidade INT
);

CREATE TABLE produtos(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome varchar(30),
tipo varchar(30),
quantidadeEmEstoque INT,
preco DECIMAL(10,2)
);

CREATE TABLE equipamentos(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome varchar(30),
tipo varchar(30),
situacao varchar(30)
);

CREATE TABLE varejistas(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome varchar(30),
cpf varchar(11),
telefone varchar(15),
email varchar(30),
produtos_id INT,
FOREIGN KEY (produtos_id) REFERENCES produtos(id)
);

INSERT INTO funcionarios(nome, cpf, salarios, dataNascimento, equipamentos_id, produtos_id) VALUES
('Joao', 11111111111, 999.99, '1990-01-01', 1, 1);

INSERT INTO producaoDeLeite(especie, dataNascimento, ultimaOrdenha, temperaturaLeite, produtividadeQuarto, inseminacoes, estimativaParto, secagemEsperada, minutosRuminacao) VALUES
('Angus', '2015-10-10', '2020-10-20 15:00:00', 40, 100, 0, NULL, NULL, 500);

INSERT INTO producaoDeQueijo(tipo, dataProducao, peso, quantidade) VALUES
('Minas', '2020-10-20', 5, 25);

INSERT INTO producaoDeFruta(tipo, dataProducao, peso, quantidade) VALUES
('Banana', '2020-09-10', 50, 3);

INSERT INTO producaoDeOvos(tipo, dataNascimento, peso, mediaSemanal) VALUES
('Rhode Island', '2020-02-12', 5, 7);

INSERT INTO producaoVerduras(tipo, dataProducao, peso, quantidade) VALUES
('Repolho', '2020-10-01', 10, 2);

INSERT INTO produtos(nome, tipo, quantidadeEmEstoque, preco) VALUES
('Doce de banana', 'Doces', 25, 5.00),
('Doce de figo', 'Doces', 30, 7.00);

INSERT INTO equipamentos(nome, tipo, situacao) VALUES
('Enxada', 'Agricola', 'Desgastado');

INSERT INTO varejistas(nome, cpf, telefone, email, produtos_id) VALUES
('Maria Carlota', '22222222222', '1111-5555', 'mariacarlota@gmail.com', 1);

SELECT funcionarios.nome AS 'Nome', produtos.nome AS 'Produto'
FROM funcionarios LEFT JOIN produtos
ON funcionarios.produtos_id = produtos.id
ORDER BY funcionarios.nome;

SELECT nome, preco FROM produtos ORDER BY preco;

SELECT funcionarios.nome AS 'Nome', equipamentos.nome AS 'equipamento'
FROM funcionarios INNER JOIN equipamentos 
ON funcionarios.equipamentos_id = equipamentos.id
ORDER BY funcionarios.nome;

SELECT varejistas.nome AS 'Varejista', produtos.nome AS 'Produto'
FROM varejistas LEFT JOIN produtos
ON varejistas.produtos_id = produtos.id
ORDER BY varejistas.nome;

SELECT * FROM produtos WHERE preco > 5.00;

SELECT * FROM equipamentos WHERE situacao = 'Desgastado';