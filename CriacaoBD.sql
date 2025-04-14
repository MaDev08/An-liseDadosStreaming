CREATE DATABASE FilmesStreaming;
USE FilmesStreaming; 

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento DATE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE filmes (
    id_filme INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(200) NOT NULL,
    ano_lancamento INT,
    genero VARCHAR(50),
    duracao_minutos INT,
    avaliacao DECIMAL(3,1), -- média de avaliação, ex: 8.7
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE atores (
    id_ator INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE
);

CREATE TABLE atuacoes (
    id_filme INT,
    id_ator INT,
    nome_personagem VARCHAR(100),
    PRIMARY KEY (id_filme, id_ator),
    FOREIGN KEY (id_filme) REFERENCES filmes(id_filme),
    FOREIGN KEY (id_ator) REFERENCES atores(id_ator)
);

CREATE TABLE alugueis (
    id_aluguel INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_filme INT NOT NULL,
    data_aluguel DATE NOT NULL,
    data_devolucao DATE,
    preco DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_filme) REFERENCES filmes(id_filme)
);

INSERT INTO clientes (nome, email, data_nascimento)
VALUES
('Ana Souza', 'ana.souza@email.com', '1995-04-10'),
('Bruno Lima', 'bruno.lima@email.com', '1990-08-22'),
('Carlos Pereira', 'carlos.p@email.com', '1988-12-05');

INSERT INTO filmes (titulo, ano_lancamento, genero, duracao_minutos, avaliacao)
VALUES
('A Origem', 2010, 'Ficção Científica', 148, 8.8),
('Titanic', 1997, 'Romance', 195, 7.8),
('Os Vingadores', 2012, 'Ação', 143, 8.0);

INSERT INTO atores (nome, data_nascimento)
VALUES
('Leonardo DiCaprio', '1974-11-11'),
('Joseph Gordon-Levitt', '1981-02-17'),
('Kate Winslet', '1975-10-05'),
('Robert Downey Jr.', '1965-04-04'),
('Chris Evans', '1981-06-13');

INSERT INTO atuacoes (id_filme, id_ator, nome_personagem)
VALUES
(1, 1, 'Dom Cobb'),             -- A Origem, DiCaprio
(1, 2, 'Arthur'),               -- A Origem, Joseph
(2, 1, 'Jack Dawson'),          -- Titanic, DiCaprio
(2, 3, 'Rose DeWitt Bukater'), -- Titanic, Kate
(3, 4, 'Tony Stark'),           -- Vingadores, Downey Jr.
(3, 5, 'Steve Rogers');         -- Vingadores, Chris Evans

INSERT INTO alugueis (id_cliente, id_filme, data_aluguel, data_devolucao, preco)
VALUES
(1, 1, '2025-04-01', '2025-04-03', 12.90),
(2, 2, '2025-04-02', '2025-04-05', 9.90),
(3, 3, '2025-04-03', NULL, 14.90); -- Ainda não devolvido


