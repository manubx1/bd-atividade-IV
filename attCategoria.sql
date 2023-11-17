CREATE DATABASE attiv;

USE attiv;

CREATE TABLE categorias (
       id_categoria INT AUTO_INCREMENT PRIMARY KEY,
       nome_categoria VARCHAR(255) NOT NULL,
       descricao VARCHAR(255) NOT NULL
);

CREATE TABLE produtos(
       id_produto  INT AUTO_INCREMENT PRIMARY KEY,
       nome  DATETIME NOT NULL,
       preco_unitario DECIMAL (10, 2),
       categoriaID INT,
      FOREIGN KEY (categoriaID) references categorias(id_categoria)
);

INSERT INTO categorias (nome_categoria, descricao) VALUES
( 'Joia', 'Pulseira Tinker Bell'),
('Casa-Sala', 'SofaCama'),
( 'Perfumaria', '212 Internacional'),
( 'Farmacia', 'Atroveran DIP');

INSERT INTO  produtos (id_produto, nome, preco_unitario, categoriaid) VALUES
(' bell Blue', 25.99, 1),
( 'Sofa Barbie', 29.90, 2),
( 'Perfuminho cheiroso', 655.75, 3),
('Remedio DIP', 10.50, 4);


CREATE VIEW vw_produtos_categoria AS 
SELECT c.nome_categoria AS "Nome",
count(p.id_produto) AS  quantidade_produto,
FROM  categorias c
JOIN produtos p ON  c.id_categoria = p.categoriaid
GROUP BY c.id_categoria;

SELECT * FROM vw_produtos_categoria;

DROP DATABASE attiv;

