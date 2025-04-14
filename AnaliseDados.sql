-- SELECT em todas as tabelas para visualizar se está tudo certo com os valores:

SELECT * FROM alugueis;
SELECT * FROM atores;
SELECT * FROM atuacoes;
SELECT * FROM clientes;
SELECT * FROM  filmes;

-- A média de preço de aluguel de filmes:

SELECT AVG(preco) from alugueis;


-- Qual o preço médio de cada filme de acordo com o seu gênero: 

SELECT 
    f.genero,
    ROUND(AVG(a.preco), 2) AS preco_medio
FROM filmes f
JOIN alugueis a ON f.id_filme = a.id_filme
GROUP BY f.genero;

-- Mesma análise de preço médio de caada filme por genêro, mas, que o ano de lançamento seja igual ou maior a 2010:

SELECT 
    f.genero,
    ROUND(AVG(a.preco), 2) AS preco_medio
FROM filmes f
JOIN alugueis a ON f.id_filme = a.id_filme
WHERE ano_lancamento >= 2010 
GROUP BY f.genero;

-- Analisar o desempenho dos filmes e identificar aqueles que tiveram a nota acima da média. 

SELECT * FROM filmes;

SELECT AVG(avaliacao) as notaMédiaFilmes from filmes; -- 8,20

SELECT * FROM filmes
WHERE avaliacao >= 8.20 ;

-- Criar uma View

CREATE VIEW FilmesAcimaMédia AS 
SELECT * FROM filmes
WHERE avaliacao >= 8.20 ; 

-- Visualiza View:
 
SELECT * FROM FilmesAcimaMédia;