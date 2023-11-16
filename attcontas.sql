CREATE DATABASE attiv;

USE attiv;

CREATE TABLE contas(
	id_conta INT AUTO_INCREMENT PRIMARY KEY,
    nome  VARCHAR(225) NOT NULL,
    saldo DECIMAL NOT NULL
);

CREATE TABLE transacoes(
	id_transacao INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR (30) NOT NULL,
    valor DECIMAL NOT NULL,
    contaID INT,
    FOREIGN KEY (contaID) REFERENCES contas(id_conta)
);

DELIMITER //

CREATE TRIGGER tg_atualizar_saldo 
AFTER INSERT ON transacoes 
FOR EACH ROW 
BEGIN
		IF NEW.tipo = 'in' THEN
		UPDATE Contas
        SET Saldo = Saldo + NEW.Valor
        WHERE id_conta = contaID;
		END IF;
    
		IF NEW.tipo = 'out' THEN 
        UPDATE contas 
        SET saldo = saldo - NEW.valor
        WHERE id_conta = contaID;
        END IF;
end;
// DELIMITER 

INSERT INTO contas(nome, saldo) 
VALUES ('Carla Dias', 500);

INSERT INTO transacoes (tipo, valor, contaID)
VALUES ('out', 100.00, 1);

select * from Contas;

DROP DATABASE attiv;
