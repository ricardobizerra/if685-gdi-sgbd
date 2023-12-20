-- Pessoas que moram em SP
SELECT Pessoa.nome, Moradia.rua, Moradia.bairro
FROM Pessoa
INNER JOIN Moradia ON Pessoa.cep = Moradia.cep
WHERE Moradia.estado = 'SP';

-- Cria index para CPF
CREATE INDEX idx_cpf ON Pessoa (cpf);

