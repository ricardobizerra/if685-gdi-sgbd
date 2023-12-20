ALTER SESSION
SET
    NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- Obra
INSERT INTO
    Obra (isbn, nome, tipo, genero, ano_de_publicacao, numero_de_paginas, editora)
VALUES
    ('9783161484100', 'Dom Casmurro', 'Livro', 'Classico', 1899, 400, 'Companhia de Letras');

INSERT INTO
    Obra (isbn, nome, tipo, genero, ano_de_publicacao, numero_de_paginas, editora)
VALUES
    ('1233161485610', 'Percy Jackson e o Ladrão de Raios', 'Livro', 'Fantasia', 2004, 180, 'Penguin Random House');

INSERT INTO
    Obra (isbn, nome, tipo, genero, ano_de_publicacao, numero_de_paginas, editora)
VALUES
    ('2435161484111', 'Capricho', 'Revista', 'Infanto-juvenil', 2013, 40, 'Capricho');

INSERT INTO
    Obra (isbn, nome, tipo, genero, ano_de_publicacao, numero_de_paginas, editora)
VALUES
    ('2452261118100', 'SuperInteressante', 'Revista', 'Curiosidades', 2011, 70, 'Abril');

INSERT INTO
    Obra (isbn, nome, tipo, genero, ano_de_publicacao, numero_de_paginas, editora)
VALUES
    ('8471118484671', 'Homem-Aranha #1', 'Comic', 'Infanto-juvenil', 1967, 40, 'Marvel');

INSERT INTO
    Obra (isbn, nome, tipo, genero, ano_de_publicacao, numero_de_paginas, editora)
VALUES
    ('3452261118311', 'Artifícios das Trevas', 'Livro', 'Fantasia', 2016, 70, 'Galera');

INSERT INTO
    Obra (isbn, nome, tipo, genero, ano_de_publicacao, numero_de_paginas, editora)
VALUES
    ('983515482112', 'Guerra e Paz', 'Livro', 'Clássico', 1848, 600, 'CIA das Letras');

INSERT INTO
    Obra (isbn, nome, tipo, genero, ano_de_publicacao, numero_de_paginas, editora)
VALUES
    ('7452261118900', 'Naruto', 'Manga', 'Infanto-juvenil', 2009, 70, 'Abril');

-- Copia
INSERT INTO
    Copia (isbn, numero_da_copia, status_de_disponibilidade)
VALUES
    ('9783161484100', 1, 'Disponível');

INSERT INTO
    Copia (isbn, numero_da_copia, status_de_disponibilidade)
VALUES
    ('9783161484100', 2, 'Indisponivel');

INSERT INTO
    Copia (isbn, numero_da_copia, status_de_disponibilidade)
VALUES
    ('2435161484111', 1, 'Indisponível');

INSERT INTO
    Copia (isbn, numero_da_copia, status_de_disponibilidade)
VALUES
    ('7452261118900', 1, 'Disponível');

INSERT INTO
    Copia (isbn, numero_da_copia, status_de_disponibilidade)
VALUES
    ('7452261118900', 2, 'Disponível');

INSERT INTO
    Copia (isbn, numero_da_copia, status_de_disponibilidade)
VALUES
    ('3452261118311', 3, 'Disponível');

INSERT INTO
    Copia (isbn, numero_da_copia, status_de_disponibilidade)
VALUES
    ('983515482112', 1, 'Indisponível');

INSERT INTO
    Copia (isbn, numero_da_copia, status_de_disponibilidade)
VALUES
    ('7452261118900', 4, 'Indisponível');

-- Autor
INSERT INTO
    Autor (isbn, nome_autor)
VALUES
    ('9783161484100', 'Machado de Assis');

INSERT INTO
    Autor (isbn, nome_autor)
VALUES
    ('1233161485610', 'Rick Riordan');

INSERT INTO
    Autor (isbn, nome_autor)
VALUES
    ('2435161484111', 'Camilla Capricho');

INSERT INTO
    Autor (isbn, nome_autor)
VALUES
    ('2435161484111', 'Beatriz Capricho');

INSERT INTO
    Autor (isbn, nome_autor)
VALUES
    ('8471118484671', 'Stan Lee');

INSERT INTO
    Autor (isbn, nome_autor)
VALUES
    ('3452261118311', 'Cassandra Clare');

INSERT INTO
    Autor (isbn, nome_autor)
VALUES
    ('983515482112', 'Leo Tolstoy');

INSERT INTO
    Autor (isbn, nome_autor)
VALUES
    ('7452261118900', 'Masashi Kishimoto');

-- Subgenero
INSERT INTO
    Subgenero (isbn, tipo_subgenero)
VALUES
    ('9783161484100', 'Romance');

INSERT INTO
    Subgenero (isbn, tipo_subgenero)
VALUES
    ('1233161485610', 'Infanto-juvenil');

INSERT INTO
    Subgenero (isbn, tipo_subgenero)
VALUES
    ('1233161485610', 'Mitologia Grega');

INSERT INTO
    Subgenero (isbn, tipo_subgenero)
VALUES
    ('8471118484671', 'Fantasia');

INSERT INTO
    Subgenero (isbn, tipo_subgenero)
VALUES
    ('3452261118311', 'Romance');

INSERT INTO
    Subgenero (isbn, tipo_subgenero)
VALUES
    ('983515482112', 'Romance');

INSERT INTO
    Subgenero (isbn, tipo_subgenero)
VALUES
    ('7452261118900', 'Infanto-juvenil');

-- Moradia
INSERT INTO
    Moradia (cep, rua, bairro, cidade, estado)
VALUES
    ('01234567', 'Avenida Central', 'Bela Vista', 'Metropolis', 'SP');

INSERT INTO
    Moradia (cep, rua, bairro, cidade, estado)
VALUES
    ('54321098', 'Rua dos Girassóis', 'Jardim das Flores', 'Cidade do Sol', 'SP');

INSERT INTO
    Moradia (cep, rua, bairro, cidade, estado)
VALUES
    ('45678901', 'Rua das Palmeiras', 'Centro Histórico', 'Vila Velha', 'ES');

INSERT INTO
    Moradia (cep, rua, bairro, cidade, estado)
VALUES
    ('98765432', 'Avenida das Águias', 'Lagoa Azul', 'Praia Grande', 'RJ');

INSERT INTO
    Moradia (cep, rua, bairro, cidade, estado)
VALUES
    ('34567890', 'Travessa das Orquídeas', 'Jardim Primavera', 'Porto Alegre', 'RS');

INSERT INTO
    Moradia (cep, rua, bairro, cidade, estado)
VALUES
    ('21098765', 'Rua das Acácias', 'Vila Aurora', 'Salvador', 'BA');

INSERT INTO
    Moradia (cep, rua, bairro, cidade, estado)
VALUES
    ('87654321', 'Avenida dos Flamboyants', 'Jardim Botânico', 'Brasília', 'DF');

INSERT INTO
    Moradia (cep, rua, bairro, cidade, estado)
VALUES
    ('78901234', 'Rua das Violetas', 'Floresta Encantada', 'Manaus', 'AM');

-- Dados bancários
INSERT INTO
    Dados_bancarios (conta, codigo_do_banco, agencia)
VALUES
    ('00000876224123688', '01001', '29717221');
INSERT INTO
    Dados_bancarios (conta, codigo_do_banco, agencia)
VALUES
    ('00001234561234567', '02002', '12345678');
INSERT INTO
    Dados_bancarios (conta, codigo_do_banco, agencia)
VALUES
    ('00002468012468012', '03003', '98765432');
INSERT INTO
    Dados_bancarios (conta, codigo_do_banco, agencia)
VALUES
    ('00003698723698723', '04004', '13579246');
INSERT INTO
    Dados_bancarios (conta, codigo_do_banco, agencia)
VALUES
    ('00004000014000014', '05005', '86420973');
INSERT INTO
    Dados_bancarios (conta, codigo_do_banco, agencia)
VALUES
    ('00005432165432165', '06006', '74125896');
INSERT INTO
    Dados_bancarios (conta, codigo_do_banco, agencia)
VALUES
    ('00006876546876546', '07007', '36985214');
INSERT INTO
    Dados_bancarios (conta, codigo_do_banco, agencia)
VALUES
    ('00007293817293817', '08008', '25814736');

-- Cartões
INSERT INTO
    Cartao (numero_do_cartao, cvv, validade) 
VALUES 
    ('1234598765432456', '123', '12/2025');
INSERT INTO
    Cartao (numero_do_cartao, cvv, validade) 
VALUES 
    ('6543210987654321', '456', '06/2023');
INSERT INTO
    Cartao (numero_do_cartao, cvv, validade) 
VALUES 
    ('9876543210987654', '789', '09/2024');
INSERT INTO
    Cartao (numero_do_cartao, cvv, validade) 
VALUES 
    ('2345987654324567', '234', '03/2022');
INSERT INTO
    Cartao (numero_do_cartao, cvv, validade) 
VALUES 
    ('7654321098765432', '567', '08/2026');
INSERT INTO
    Cartao (numero_do_cartao, cvv, validade) 
VALUES 
    ('3210987654321098', '890', '05/2023');
INSERT INTO
    Cartao (numero_do_cartao, cvv, validade) 
VALUES 
    ('5432109876543210', '123', '11/2025');
INSERT INTO
    Cartao (numero_do_cartao, cvv, validade) 
VALUES 
    ('8901234598765432', '456', '02/2024');

-- Pessoas
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES
    ('123.456.789-09', 'João da Silva', 'joao.silva@email.com', 'M', '1980-05-15', '01234567', 12);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES
    ('987.654.321-00', 'Maria Oliveira', 'maria.oliveira@email.com', 'F', '1992-08-23', '01234567', 34);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES
    ('234.567.890-12', 'Carlos Santos', 'carlos.santos@email.com', 'M', '1985-11-07', '01234567', 56);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES
    ('345.678.901-23', 'Ana Pereira', 'ana.pereira@email.com', 'F', '1998-02-10', '01234567', 78);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES
    ('876.543.210-34', 'Pedro Rocha', 'pedro.rocha@email.com', 'M', '1973-09-28', '98765432', 90);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES    
    ('987.654.321-45', 'Mariana Costa', 'mariana.costa@email.com', 'F', '1987-04-03', '01234567', 12);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES    
    ('567.890.123-56', 'Rafaela Santos', 'rafaela.santos@email.com', 'F', '1995-06-20', '78901234', 34);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES
    ('321.098.765-67', 'Lucas Lima', 'lucas.lima@email.com', 'M', '1982-12-14', '34567890', 56);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES    
    ('111.222.333-44', 'Fernanda Oliveira', 'fernanda@email.com', 'F', '1990-03-25', '34567890', 45);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES    
    ('444.555.666-77', 'Cristina Silva', 'cristina.silva@email.com', 'F', '1993-09-05', '87654321', 89);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES
    ('222.333.444-55', 'Roberto Costa', 'roberto.costa@email.com', 'M', '1984-01-18', '21098765', 23);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES
    ('999.888.777-66', 'Camila Rocha', 'camila.rocha@email.com', 'F', '1997-04-30', '21098765', 45);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES
    ('777.888.999-00', 'Eduardo Santos', 'eduardo.santos@email.com', 'M', '1986-11-08', '87654321', 67);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES
    ('666.777.888-99', 'Larissa Lima', 'larissa.lima@email.com', 'F', '1991-05-14', '78901234', 89);
INSERT INTO
    Pessoa (cpf, nome, email, sexo, data_de_nascimento, cep, numero)
VALUES
    ('333.444.555-66', 'Gustavo Costa', 'gustavo.costa@email.com', 'M', '1989-08-27', '21098765', 23);

-- Funcionario
INSERT INTO
    Funcionario (cpf_func, ctps, conta, salario, cpf_supervisor)
VALUES
    ('987.654.321-00', '98765432102', '00001234561234567', 4200.80, NULL);
INSERT INTO
    Funcionario (cpf_func, ctps, conta, salario, cpf_supervisor)
VALUES
    ('321.098.765-67', '34567890108', '00007293817293817', 1320.00, NULL);
INSERT INTO
    Funcionario (cpf_func, ctps, conta, salario, cpf_supervisor)
VALUES
    ('123.456.789-09', '12345678901', '00000876224123688', 1000.00, '987.654.321-00');
INSERT INTO
    Funcionario (cpf_func, ctps, conta, salario, cpf_supervisor)
VALUES
    ('234.567.890-12', '45678901203', '00002468012468012', 1400.22, '987.654.321-00');
INSERT INTO
    Funcionario (cpf_func, ctps, conta, salario, cpf_supervisor)
VALUES
    ('345.678.901-23', '89012345604', '00003698723698723', 1984.32, '987.654.321-00');
INSERT INTO
    Funcionario (cpf_func, ctps, conta, salario, cpf_supervisor)
VALUES
    ('876.543.210-34', '23456789005', '00004000014000014', 2200.99, '321.098.765-67');
INSERT INTO
    Funcionario (cpf_func, ctps, conta, salario, cpf_supervisor)
VALUES
    ('987.654.321-45', '59876543206', '00005432165432165', 3290.00, '321.098.765-67');
INSERT INTO
    Funcionario (cpf_func, ctps, conta, salario, cpf_supervisor)
VALUES
    ('567.890.123-56', '01234567807', '00006876546876546', 2209.00, '321.098.765-67');

-- Cliente
INSERT INTO 
    Cliente (cpf_cliente, numero_de_livro_emprestado, numero_do_cartao)
VALUES
    ('111.222.333-44', 45, '1234598765432456');
INSERT INTO 
    Cliente (cpf_cliente, numero_de_livro_emprestado, numero_do_cartao)
VALUES
    ('444.555.666-77', 89, '6543210987654321');
INSERT INTO 
    Cliente (cpf_cliente, numero_de_livro_emprestado, numero_do_cartao)
VALUES
    ('222.333.444-55', 23, '9876543210987654');
INSERT INTO 
    Cliente (cpf_cliente, numero_de_livro_emprestado, numero_do_cartao)
VALUES
    ('999.888.777-66', 45, '2345987654324567');
INSERT INTO 
    Cliente (cpf_cliente, numero_de_livro_emprestado, numero_do_cartao)
VALUES
    ('777.888.999-00', 67, '3210987654321098');
INSERT INTO 
    Cliente (cpf_cliente, numero_de_livro_emprestado, numero_do_cartao)
VALUES
    ('666.777.888-99', 89, '5432109876543210');
INSERT INTO 
    Cliente (cpf_cliente, numero_de_livro_emprestado, numero_do_cartao)
VALUES
    ('333.444.555-66', 23, '8901234598765432'); 

-- Telefone
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('123.456.789-09', '1122334455');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('123.456.789-09', '8812332455');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('987.654.321-00', '5544332211');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('234.567.890-12', '9988776655');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('345.678.901-23', '6677889900');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('876.543.210-34', '1122334455');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('876.543.210-34', '9922531455');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('987.654.321-45', '9988776655');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('567.890.123-56', '6677889900');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('321.098.765-67', '5544332211');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('111.222.333-44', '1122334455');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('444.555.666-77', '6677889900');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('222.333.444-55', '5544332211');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('999.888.777-66', '9988776655');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('777.888.999-00', '6677889900');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('666.777.888-99', '1122334455');
INSERT INTO 
    Telefone (cpf, telefone) 
VALUES
    ('333.444.555-66', '9988776655');

-- Livro Emprestado
INSERT INTO
    Livro_emprestado (cpf_cliente, livro_emprestado)
VALUES
    ('111.222.333-44', 4);
INSERT INTO
    Livro_emprestado (cpf_cliente, livro_emprestado)
VALUES
    ('444.555.666-77', 8);
INSERT INTO
    Livro_emprestado (cpf_cliente, livro_emprestado)
VALUES
    ('222.333.444-55', 2);
INSERT INTO
    Livro_emprestado (cpf_cliente, livro_emprestado)
VALUES
    ('999.888.777-66', 4);
INSERT INTO
    Livro_emprestado (cpf_cliente, livro_emprestado)
VALUES
    ('777.888.999-00', 6);
INSERT INTO
    Livro_emprestado (cpf_cliente, livro_emprestado)
VALUES
    ('666.777.888-99', 8);
INSERT INTO
    Livro_emprestado (cpf_cliente, livro_emprestado)
VALUES
    ('333.444.555-66', 2); 

-- Empresta
INSERT INTO
    Empresta (cpf_cliente, cpf_func, isbn, numero_da_copia, data_de_emprestimo, cpf_func_multa, valor_multa)
VALUES
    ('111.222.333-44', '123.456.789-09', '9783161484100', 1, '2023-12-18', '', 0);
INSERT INTO
    Empresta (cpf_cliente, cpf_func, isbn, numero_da_copia, data_de_emprestimo, cpf_func_multa, valor_multa)
VALUES
    ('222.333.444-55', '876.543.210-34', '2435161484111', 1, '2023-12-21', '', 0);
INSERT INTO
    Empresta (cpf_cliente, cpf_func, isbn, numero_da_copia, data_de_emprestimo, cpf_func_multa, valor_multa)
VALUES
    ('666.777.888-99', '321.098.765-67', '3452261118311', 3, '2023-12-24', '', 0);
