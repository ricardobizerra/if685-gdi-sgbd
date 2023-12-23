-- Bloco anônimo para exibir a data atual
DECLARE
    current_date DATE := SYSDATE;
BEGIN
    dbms_output.put_line( current_date );
END;
/

-- Tipo de dado para armazenar uma pessoa
DECLARE TYPE pessoa_rec IS RECORD (
    cpf VARCHAR2(14),
    nome VARCHAR2(50),
    email VARCHAR2(100),
    sexo CHAR(1),
    data_de_nascimento DATE,
    cep VARCHAR2(8),
    numero NUMBER
);
pessoa pessoa_rec;

-- Seleciona uma pessoa e exibe seus dados
BEGIN
    SELECT cpf, nome, email, sexo, data_de_nascimento, cep, numero INTO pessoa
    FROM Pessoa
    WHERE cpf = '123.456.789-09';
    
    DBMS_OUTPUT.PUT_LINE('CPF: ' || pessoa.cpf);
    DBMS_OUTPUT.PUT_LINE('Nome: ' || pessoa.nome);
    DBMS_OUTPUT.PUT_LINE('Email: ' || pessoa.email);
    DBMS_OUTPUT.PUT_LINE('Sexo: ' || pessoa.sexo);
    DBMS_OUTPUT.PUT_LINE('Data de Nascimento: ' || TO_CHAR(pessoa.data_de_nascimento, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('CEP: ' || pessoa.cep);
    DBMS_OUTPUT.PUT_LINE('Numero: ' || TO_CHAR(pessoa.numero));
END;
/

-- Tipo de dado para armazenar uma pessoa
DECLARE TYPE pessoa_tab IS TABLE OF Pessoa%ROWTYPE;
pessoas pessoa_tab;

-- Seleciona todas as pessoas e exibe seus dados
BEGIN
    SELECT * BULK COLLECT INTO pessoas
    FROM Pessoa;
   
    FOR i IN 1..pessoas.COUNT LOOP
		CASE i
            WHEN pessoas.COUNT THEN DBMS_OUTPUT.PUT_LINE('Última Pessoa');
            ELSE DBMS_OUTPUT.PUT_LINE(i || 'º Pessoa');
        END CASE;

        DBMS_OUTPUT.PUT_LINE('CPF: ' || pessoas(i).cpf);
        DBMS_OUTPUT.PUT_LINE('Nome: ' || pessoas(i).nome);
        DBMS_OUTPUT.PUT_LINE('Email: ' || pessoas(i).email);
        DBMS_OUTPUT.PUT_LINE('Sexo: ' || pessoas(i).sexo);
        DBMS_OUTPUT.PUT_LINE('Data de Nascimento: ' || TO_CHAR(pessoas(i).data_de_nascimento, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('CEP: ' || pessoas(i).cep);
        DBMS_OUTPUT.PUT_LINE('Numero: ' || TO_CHAR(pessoas(i).numero));
		DBMS_OUTPUT.PUT_LINE('======================================');
    END LOOP;
END;
/

-- Exibe o salário de todos os funcionários que possuem um supervisor
DECLARE 
    CURSOR funcionario_cursor IS
        SELECT f.cpf_func, f.salario, f.cpf_supervisor, p.nome
        FROM Funcionario f
        JOIN Pessoa p ON f.cpf_func = p.cpf;

    value_cpf_funcionario Funcionario.cpf_func%TYPE;
    value_salario Funcionario.salario%TYPE;
    value_cpf_supervisor Funcionario.cpf_supervisor%TYPE;
    value_nome Pessoa.nome%TYPE;
BEGIN
    OPEN funcionario_cursor;
    LOOP
        FETCH funcionario_cursor INTO value_cpf_funcionario, value_salario, value_cpf_supervisor, value_nome;
        EXIT WHEN funcionario_cursor%NOTFOUND;
        IF value_cpf_supervisor IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('Nome: ' || value_nome);
            DBMS_OUTPUT.PUT_LINE('CPF: ' || value_cpf_funcionario);
            DBMS_OUTPUT.PUT_LINE('Salario: ' || value_salario);
            DBMS_OUTPUT.PUT_LINE('CPF do Supervisor: ' || value_cpf_supervisor);
		    DBMS_OUTPUT.PUT_LINE('======================================');
        END IF;
    END LOOP;
    CLOSE funcionario_cursor;
END;
/

-- Insere uma obra no sistema
CREATE OR REPLACE PROCEDURE InserirObra(
    value_isbn IN OUT Obra.isbn%TYPE,
    value_nome IN OUT Obra.nome%TYPE,
    value_tipo IN OUT Obra.tipo%TYPE,
    value_genero IN OUT Obra.genero%TYPE,
    value_ano_de_publicacao IN OUT Obra.ano_de_publicacao%TYPE,
    value_numero_de_paginas IN OUT Obra.numero_de_paginas%TYPE,
    value_editora IN OUT Obra.editora%TYPE
    )
IS
BEGIN
    INSERT INTO Obra (isbn, nome, tipo, genero, ano_de_publicacao, numero_de_paginas, editora)
    VALUES (value_isbn, value_nome, value_tipo, value_genero, value_ano_de_publicacao, value_numero_de_paginas, value_editora);
END;
/

-- Insere uma copia
CREATE OR REPLACE PROCEDURE InserirCopia(value_isbn IN OUT Copia.isbn%TYPE, value_numero_da_copia IN OUT Copia.numero_da_copia%TYPE, value_status_de_disponibilidade IN OUT Copia.status_de_disponibilidade%TYPE)
IS
BEGIN
    INSERT INTO Copia(isbn, numero_da_copia, status_de_disponibilidade)
    VALUES (value_isbn, value_numero_da_copia, value_status_de_disponibilidade);
END;
/

-- Retorna a quantidade de cópias disponíveis de uma determinada obra
CREATE OR REPLACE FUNCTION ObterQuantidadeCopias(value_isbn Obra.isbn%TYPE)
    RETURN NUMBER 
IS
    qtd_copias_disponíveis NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO qtd_copias_disponíveis FROM Copia WHERE isbn = value_isbn AND status_de_disponibilidade = 'Disponivel';
    RETURN qtd_copias_disponíveis;
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
END;
/

-- Determina a frequência (alta, média, baixa) de empréstimos de uma obra
CREATE OR REPLACE FUNCTION ObterFrequencia(value_isbn Obra.isbn%TYPE)
    RETURN VARCHAR2
IS 
    frequencia NUMBER;
BEGIN
    SELECT COUNT(*) INTO frequencia FROM Empresta WHERE isbn = value_isbn;

    IF frequencia > 100 THEN
        RETURN 'A Obra' || value_isbn || 'tem frequência alta de empréstimos';
    ELSIF frequencia > 50 THEN
        RETURN 'A Obra' || value_isbn || 'tem frequência média de empréstimos';
    ELSE
        RETURN 'A Obra' || value_isbn || 'tem frequência baixa de empréstimos';
    END IF;
END;
/

-- Lista de cpfs de todos os clientes com empréstimos
DECLARE
    TYPE lista IS TABLE OF Empresta.cpf_cliente%TYPE INDEX BY PLS_INTEGER;
    cpfs lista;
    i PLS_INTEGER := 1;
BEGIN
    SELECT cpf_cliente
    BULK COLLECT INTO cpfs
    FROM Empresta;

    WHILE i <= cpfs.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Cliente ' || i || ': ' || cpfs(i));
        i := i + 1;
    END LOOP;
END;
/

-- Insere uma copia e consulta a quantidade de copias existentes
CREATE OR REPLACE PACKAGE insercao_quantidade AS
    PROCEDURE InserirCopia(value_isbn IN OUT Copia.isbn%TYPE, value_numero_da_copia IN OUT Copia.numero_da_copia%TYPE, value_status_de_disponibilidade IN OUT Copia.status_de_disponibilidade%TYPE);
    FUNCTION ObterQuantidadeCopias(value_isbn IN Obra.isbn%TYPE) RETURN NUMBER;
END insercao_quantidade;
/

CREATE OR REPLACE PACKAGE BODY insercao_quantidade AS
    PROCEDURE InserirCopia(value_isbn IN OUT Copia.isbn%TYPE, value_numero_da_copia IN OUT Copia.numero_da_copia%TYPE, value_status_de_disponibilidade IN OUT Copia.status_de_disponibilidade%TYPE)
    IS
    BEGIN
        INSERT INTO Copia(isbn, numero_da_copia, status_de_disponibilidade)
        VALUES (value_isbn, value_numero_da_copia, value_status_de_disponibilidade);
    END InserirCopia;

    FUNCTION ObterQuantidadeCopias(value_isbn Obra.isbn%TYPE)
        RETURN NUMBER 
    IS
        qtd_copias_disponíveis NUMBER := 0;
    BEGIN
        SELECT COUNT(*) INTO qtd_copias_disponíveis FROM Copia WHERE isbn = value_isbn AND status_de_disponibilidade = 'Disponivel';
        RETURN qtd_copias_disponíveis;
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                RETURN 0;
    END ObterQuantidadeCopias;
END insercao_quantidade;
/

-- Define o salário padrão
CREATE OR REPLACE TRIGGER InsereSalarioMinimo
BEFORE INSERT ON Funcionario
FOR EACH ROW
BEGIN
    IF :NEW.salario IS NULL THEN
        :NEW.salario := 1000.00;
    END IF;
END;
/

-- Atualiza numero de livros emprestados 
CREATE OR REPLACE TRIGGER AtualizaNumeroEmprestimos
AFTER INSERT ON Empresta
FOR EACH ROW
DECLARE
    qtd_emprestimos NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO qtd_emprestimos
    FROM Empresta
    WHERE cpf_cliente = :NEW.cpf_cliente;

    UPDATE Livro_emprestado
    SET livro_emprestado = qtd_emprestimos
    WHERE cpf_cliente = :NEW.cpf_cliente;
END;
/
