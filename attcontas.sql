CREATE DATABASE attiv;

USE attiv;

CREATE TABLE contas(
	id_conta INT AUTO_INCREMENT PRIMARY KEY,
    nome  VARCHAR(225) NOT NULL,
    saldo DECIMAL NOT NULL
);

CREATE TABLE emprestimos(
	id_emprestimo  INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATETIME NOT NULL,
    data_devolucao DATETIME NOT NULL,
	livroID INT, 
    FOREIGN KEY (livroID) REFERENCES livros (id_livro)
); 