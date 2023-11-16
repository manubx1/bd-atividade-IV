CREATE DATABASE attiv;

USE attiv;

CREATE TABLE livros(
	id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(225) NOT NULL,
    autor VARCHAR(225) NOT NULL,
    quantidade_estoque INT NOT NULL
);

CREATE TABLE emprestimos(
	id_emprestimo  INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATETIME,
    data_DEVOLUCAO DATETIME,
	livroID INT, 
    FOREIGN KEY (livroID) REFERENCES livros (id_livro)
); 

DELIMITER //

CREATE TRIGGER tr_atualizar_emprestimo
AFTER INSERT ON Emprestimos
FOR EACH ROW
BEGIN
	UPDATE Livros
    SET quantidade_estoque = quantidade_estoque - 1
    WHERE id_livro = NEW.livroID;
END
//
DELIMITER ;

INSERT INTO Livros(Titulo, Autor, quantidade_estoque)
VALUES('Assim que Acaba', 'Collen Hoover', 35);

INSERT INTO Emprestimos(data_emprestimo, data_devolucao, livroID)
VALUES('2023-10-07 08:54:08', '2023-11-07 14:46:27', 1);

SELECT * FROM Livros;

DROP DATABASE attiv;
