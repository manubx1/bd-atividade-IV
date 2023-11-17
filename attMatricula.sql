CREATE DATABASE attiv;

USE attiv;

CREATE TABLE alunos(
	id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(225) NOT NULL,
    data_nascimento DATE NOT NULL,
    serie INT NOT NULL
);
CREATE TABLE matriculas(
	id_item_venda INT AUTO_INCREMENT PRIMARY KEY,
    alunoID INT,
    FOREIGN KEY (alunoID) REFERENCES alunos (id_aluno),
    estatus VARCHAR (100),
    data_matricula DATE
);

INSERT INTO alunos (Nome,  data_nascimento, serie)
VALUES ('Carlos Almeida', '2008-04-21', 9);
 
INSERT INTO matriculas (estatus, data_matricula, alunoID)
 VALUES ('Matriculado(a)', 2023-02-01, 1);
 

DELIMITER //

CREATE TRIGGER tg_matricula
BEFORE INSERT ON matriculas 
FOR EACH ROW 
BEGIN
		IF (SELECT serie 
        FROM alunos
        WHERE id_aluno = NEW.alunoID) < NEW.quantidade THEN 

        
-- END;
// DELIMITER 


DROP DATABASE attiv;

