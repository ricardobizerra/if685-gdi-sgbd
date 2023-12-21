-- Pessoas que moram em SP
SELECT Pessoa.nome, Moradia.rua, Moradia.bairro
FROM Pessoa
INNER JOIN Moradia ON Pessoa.cep = Moradia.cep
WHERE Moradia.estado = 'SP';

-- Cria index para CPF
CREATE INDEX idx_cpf ON Pessoa (cpf);

-- Insere novo cliente
INSERT INTO Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES ('777.999.999-00', 'Eduardo Santos', 'eduardo.santos@email.com', 'M', '1986-11-08', '87654321', 67);

-- Alterar valores das tabelas
UPDATE Funcionario
SET salario = salario * 1.1
WHERE cpf_func = '123.456.789-09';

-- Deleta registro de livro emprestado
DELETE FROM Livro_emprestado
WHERE cpf_cliente = '111.222.333-44' AND livro_emprestado = 4;

-- Mostra nome e ano de publicação das 5 obras mais recentes
SELECT nome, ano_de_publicacao
FROM Obra
ORDER BY ano_de_publicacao DESC
LIMIT 5;

-- Média de páginas por gênero
SELECT genero, AVG(numero_de_paginas) AS media_paginas
FROM Obra
GROUP BY genero;

-- Junta seleção de pessoas do sexo masculino com seleção de funcionários que não possuem supervisor
SELECT cpf FROM Pessoa WHERE sexo = 'M'
UNION
SELECT cpf_func FROM Funcionario WHERE cpf_supervisor IS NULL;

-- Cria view para listar empréstimos vencidos
CREATE VIEW EmprestimosVencidos AS
SELECT *
FROM Empresta
WHERE data_de_emprestimo < CURRENT_DATE;

-- listar os livros que os anos de publicação é 2000 a 2010
SELECT nome, ano_de_publicacao FROM Obra
WHERE ano_de_publicacao BETWEEN 2000 AND 2010;

-- mostrar funcionario com maior e menor salario 
SELECT f.*, p.nome
FROM Funcionario f
JOIN Pessoa p ON f.cpf_func = p.cpf
WHERE f.salario = (SELECT MAX(salario) FROM Funcionario);

SELECT f.*, p.nome
FROM Funcionario f
JOIN Pessoa p ON f.cpf_func = p.cpf
WHERE f.salario = (SELECT MIN(salario) FROM Funcionario);

-- listar funcionários que ganham menos de 2000 e que não tem supervisor 
SELECT f.*, p.nome
FROM Funcionario f
JOIN Pessoa p ON f.cpf_func = p.cpf
WHERE f.salario < 2000
GROUP BY f.cpf_func, f.ctps, f.conta, f.salario, f.cpf_supervisor, p.nome
HAVING f.cpf_supervisor IS NULL;

-- Alterar definição de tabela
ALTER TABLE Obra DROP (ano_de_publicacao);

-- Pessoas cujo CPF sejam um dos seguintes: 123.456.789-09, 444.555.666-77, 777.888.999-00
SELECT * FROM Pessoa WHERE cpf IN ('123.456.789-09', '444.555.666-77', '777.888.999-00');

-- Pessoas cujo nome comece com Eduardo
SELECT * FROM Pessoa WHERE nome LIKE 'Eduardo%';

-- Funcionários que não possuem supervisor
SELECT * FROM Funcionario WHERE cpf_supervisor IS NULL;

-- Esta consulta recupera o nome de cada livro e o número de cópias disponíveis para cada livro.
-- Ela faz um join entre a tabela "Obra" e a tabela "Copia" na coluna "isbn" e filtra as cópias com o status "Disponível".
-- O resultado é agrupado pela coluna "isbn".
SELECT Obra.nome, COUNT(Copia.numero_da_copia) AS num_copias_available
FROM Obra
LEFT JOIN Copia ON Obra.isbn = Copia.isbn AND Copia.status_de_disponibilidade = 'Disponível'
GROUP BY Obra.nome;

-- Permite que o usuário my_user possa ler, inserir e atualizar dados da tabela Moradia
GRANT SELECT, INSERT, UPDATE ON Moradia TO my_user; -- Não testar no Oracle!!! Ele não reconhece

-- Mostra CPF e nome de pessoas que possuem livro emprestado do gênero "Clássico"
SELECT cpf, nome
FROM Pessoa
WHERE cpf IN (
    SELECT DISTINCT Cliente.cpf_cliente
    FROM Cliente
    JOIN Livro_emprestado ON Cliente.cpf_cliente = Livro_emprestado.cpf_cliente
    JOIN Empresta ON Livro_emprestado.cpf_cliente = Empresta.cpf_cliente
    JOIN Copia ON Empresta.isbn = Copia.isbn AND Empresta.numero_da_copia = Copia.numero_da_copia
    JOIN Obra ON Copia.isbn = Obra.isbn
    WHERE Obra.genero = 'Classico'
);

