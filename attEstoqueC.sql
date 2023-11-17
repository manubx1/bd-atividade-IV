CREATE DATABASE attiv;

USE attiv;

CREATE TABLE Produtos(
       id_produtos INT AUTO_INCREMENT PRIMARY KEY,
       Nome VARCHAR(255) NOT NULL,
       preco_unitario VARCHAR(255) NOT NULL,
       categoria VARCHAR(30) NOT NULL
);

CREATE TABLE Estoque(
       quantidade INT,
       produtoID INT,
      FOREIGN KEY (produtoID) references Produtos(id_produtos)
);

INSERT INTO Produtos(Nome,preco_unitario, categoria)
VALUES ("Rimel",50.0,"Maquiagem");

INSERT INTO Produto(Nome,PrecoUnitario,Categoria)
VALUES("Base Matte",60.2,"Maquiagem");

INSERT INTO Produto(Nome,PrecoUnitario,Categoria)
VALUES("Blush",25.2,"Maquiagem");

INSERT INTO Produto(Nome,PrecoUnitario,Categoria)
VALUES("Batom",65.5,"Maquiagem");

INSERT INTO Estoque(produtoID,Quantidade)
VALUES(1, 4);

INSERT INTO Estoque(produtoID,Quantidade)
VALUES(2, 3);

INSERT INTO Estoque(produtoID,Quantidade)
VALUES(3, 2);

INSERT INTO Estoque(produtoID,Quantidade)
VALUES(4, 1);

CREATE VIEW vw_estoque_critico AS 
SELECT P.Nome AS "Nome",
E.Quantidade AS "Quantidade"
FROM Produtos P
INNER JOIN Estoque E
ON P.id_produtos = E.produtoID
WHERE Quantidade < 10;

select * from vw_estoque_critico;

DROP DATABASE attiv;

