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