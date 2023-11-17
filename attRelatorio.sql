CREATE DATABASE attiv;

USE attiv;

CREATE TABLE funcionarios(
       id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
       nome VARCHAR(255) NOT NULL,
       cargo VARCHAR(255) NOT NULL,
       categoria DECIMAL(10, 2) NOT NULL
);

CREATE TABLE vendas(
       id_venda INT AUTO_INCREMENT PRIMARY KEY,
       data_venda DATETIME NOT NULL,
       valor_venda DECIMAL (10, 2),
       funcionarioID INT,
      FOREIGN KEY (funcionarioID) references funcionarios(id_funcionario)
);

insert into funcionarios (nome, cargo, salario) values
('Giovana', 'Diretora', 6300.45),
('Maria', 'Operadora', 9500.52),
('Gabriel', 'Vendedor', 6800.54),
('Marcelo', 'Coordenador', 4800.60);

insert into vendas (data_venda, valor_venda, funcionarioid) values
('2023-11-15', 900.00, 1),
('2023-05-24', 4800.00, 4),
('2023-06-27', 600.60, 3),
('2023-11-09', 500.24, 2);


CREATE VIEW relatorio_vendas_funcionario AS 
SELECT f.nome AS "Nome",
count(v.id_venda) AS numero_vendas,
sum(v.valor_venda) AS valor_total
FROM  vendas v
JOIN funcionarios f ON f.id_funcionario = v.funcionarioid
GROUP BY f.id_funcionario, f.nome;

SELECT * FROM relatorio_vendas_funcionario;

DROP DATABASE attiv;

