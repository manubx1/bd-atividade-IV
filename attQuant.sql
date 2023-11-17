CREATE DATABASE attiv;

USE attiv;

CREATE TABLE produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(225) NOT NULL,
    quantidade_estoque INT NOT NULL 
);
CREATE TABLE vendas(
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_vendas DATETIME
);
CREATE TABLE itens_vendas(
	id_item_venda INT AUTO_INCREMENT PRIMARY KEY,
    produtoID INT,
    vendaID INT,
    quantidade INT,
    FOREIGN KEY (produtoID) REFERENCES produto (id_produto),
    FOREIGN KEY (vendaID) REFERENCES vendas (id_venda)
);

INSERT INTO Produtos (Nome, quantidade_estoque)
VALUES ('Perfume 212', 10);
 
INSERT INTO Vendas (Data_venda)
 VALUES ('2023-11-15 10:45:00');
 
INSERT INTO Itens_venda (vendaID, produtoID, quantidade) 
VALUES (1, 1, 15);

DELIMITER //

CREATE TRIGGER tg_quanti_estoq
BEFORE INSERT ON itens_vendas 
FOR EACH ROW 
BEGIN
		IF (SELECT quantidade_estoque 
        FROM produto
        WHERE id_produto = NEW.produtoID) < NEW.quantidade THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Quantidade insuficiente';
        END IF;
        
END;
// DELIMITER 


DROP DATABASE attiv;

