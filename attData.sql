CREATE DATABASE attiv;

USE attiv;

CREATE TABLE funcionarios(
	id_funcionarios INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(225) NOT NULL,
    data_admissao DATE 
);
INSERT INTO funcionarios(nome, data_admissao) 
VALUES ('Giovana', '2023-11-15');

DELIMITER //

CREATE TRIGGER tg_data_admissao
BEFORE INSERT ON funcionarios 
FOR EACH ROW 
BEGIN
		IF NEW.data_admissao <= curdate() THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro na data. Tente novamente';
		END IF;

end;
// DELIMITER 

select * from Funcionarios;

DROP DATABASE attiv;

