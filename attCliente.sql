CREATE DATABASE attiv;

USE attiv;

CREATE TABLE Clientes(
       id_cliente INT AUTO_INCREMENT PRIMARY KEY,
       Nome VARCHAR(255) NOT NULL,
       email VARCHAR(255) NOT NULL,
       telefone VARCHAR(30) NOT NULL
);

CREATE TABLE pedidos(
       Idpedido INT AUTO_INCREMENT PRIMARY KEY,
       IdCliente INT,
       Data_Pedido DATE,
       Valor_Total FLOAT,
      FOREIGN KEY (IdCliente) references Clientes(id_cliente)
);

INSERT INTO Clientes(Nome,Email,Telefone)
VALUES ('Marcelo','marcelo@gmail.com', '(11) 91111-1111');


Insert into Pedidos(IdCliente,Data_Pedido,Valor_Total)
Value(1,'2023-05-19',11);

CREATE VIEW vw_cliente_pedido AS 
SELECT C.Nome AS "nome",
count(P.Idpedido) AS "Quantidade de Pedidos",
P.ValorTotal AS "Valor Total"
FROM Clientes C
Inner Join Pedidos P on C.id_cliente = P.IdCliente;

DROP DATABASE attiv;

