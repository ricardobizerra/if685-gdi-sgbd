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
