DROP TABLE Empresta;
DROP TABLE Livro_emprestado;
DROP TABLE Telefone;
DROP TABLE Subgenero;
DROP TABLE Autor;
DROP TABLE Copia;
DROP TABLE Obra;
DROP TABLE Cliente;
DROP TABLE Funcionario;
DROP TABLE Pessoa;
DROP TABLE Cartao;
DROP TABLE Dados_bancarios;
DROP TABLE Moradia;

CREATE TABLE Moradia (
    cep VARCHAR2(8),
    rua VARCHAR2(255),
    bairro VARCHAR2(255),
    cidade VARCHAR2(255),
    estado VARCHAR2(2),
    CONSTRAINT moradia_pk PRIMARY KEY (cep)
);

CREATE TABLE Dados_bancarios (
    conta VARCHAR2(20),
    codigo_do_banco VARCHAR2(5),
    agencia VARCHAR2(10),
    CONSTRAINT dados_bancarios_pk PRIMARY KEY (conta)
);


CREATE TABLE Cartao (
    numero_do_cartao VARCHAR2(16),
    cvv VARCHAR2(3),
    validade VARCHAR2(7),
    CONSTRAINT cartao_pk PRIMARY KEY (numero_do_cartao)
);

CREATE TABLE Pessoa (
    cpf VARCHAR2(14),
    nome VARCHAR2(50),
    email VARCHAR2(100),
    sexo CHAR(1),
    data_de_nascimento DATE,
    cep VARCHAR2(8),
    numero NUMBER,
    CONSTRAINT pessoa_pk PRIMARY KEY (cpf),
    CONSTRAINT pessoa_cep_fk FOREIGN KEY (cep) REFERENCES Moradia (cep)
);

CREATE TABLE Funcionario (
    cpf_func VARCHAR2(14),
    ctps VARCHAR2(20),
    conta VARCHAR2(20),
    salario DECIMAL(10,2),
    cpf_supervisor VARCHAR(14),
    CONSTRAINT funcionario_pk PRIMARY KEY (cpf_func),
    CONSTRAINT funcionario_cpf_fk FOREIGN KEY (cpf_func) REFERENCES Pessoa (cpf),
    CONSTRAINT funcionario_conta_fk FOREIGN KEY (conta) REFERENCES Dados_bancarios (conta),
	CONSTRAINT funcionario_cpf_supervisor_fk FOREIGN KEY (cpf_supervisor) REFERENCES Funcionario (cpf_func)
);

CREATE TABLE Cliente (
    cpf_cliente VARCHAR2(14),
    numero_de_livro_emprestado NUMBER,
    numero_do_cartao VARCHAR2(16),
    CONSTRAINT cliente_pk PRIMARY KEY (cpf_cliente),
    CONSTRAINT cliente_cpf_fk FOREIGN KEY (cpf_cliente) REFERENCES Pessoa (cpf),
    CONSTRAINT cliente_numero_do_cartao_fk FOREIGN KEY (numero_do_cartao) REFERENCES Cartao (numero_do_cartao)
);

CREATE TABLE Obra (
    isbn VARCHAR2(13),
    nome VARCHAR2(255),
    tipo VARCHAR2(50),
    genero VARCHAR2(50),
    ano_de_publicacao NUMBER,
    numero_de_paginas NUMBER,
    editora VARCHAR2(100),
    CONSTRAINT obra_pk PRIMARY KEY (isbn)
);

CREATE TABLE Copia (
    isbn VARCHAR2(13),
    numero_da_copia NUMBER,
    status_de_disponibilidade VARCHAR2(20),
    CONSTRAINT copia_pk PRIMARY KEY (isbn, numero_da_copia),
    CONSTRAINT copia_isbn_fk FOREIGN KEY (isbn) REFERENCES Obra (isbn)
);

CREATE TABLE Autor (
    isbn VARCHAR2(13),
    nome_autor VARCHAR2(255),
    CONSTRAINT autor_pk PRIMARY KEY (isbn, nome_autor),
    CONSTRAINT autor_isbn_fk FOREIGN KEY (isbn) REFERENCES Obra (isbn)
);

CREATE TABLE Subgenero (
    isbn VARCHAR2(13),
    tipo_subgenero VARCHAR2(255),
    CONSTRAINT subgenero_pk PRIMARY KEY (isbn, tipo_subgenero),
    CONSTRAINT subgenero_isbn_fk FOREIGN KEY (isbn) REFERENCES Obra (isbn)
);

CREATE TABLE Telefone (
    cpf VARCHAR2(14),
    telefone VARCHAR2(20),
    CONSTRAINT telefone_pk PRIMARY KEY (cpf, telefone),
    CONSTRAINT telefone_cpf_fk FOREIGN KEY (cpf) REFERENCES Pessoa (cpf)
);

CREATE TABLE Livro_emprestado (
    cpf_cliente VARCHAR2(14),
    livro_emprestado NUMBER,
    CONSTRAINT livro_emprestado_pk PRIMARY KEY (cpf_cliente, livro_emprestado),
    CONSTRAINT livro_emprestado_cpf_cliente_fk FOREIGN KEY (cpf_cliente) REFERENCES Cliente (cpf_cliente)
);

CREATE TABLE Empresta (
    cpf_cliente VARCHAR2(14),
    cpf_func VARCHAR2(14),
    isbn VARCHAR2(13),
    numero_da_copia NUMBER,
    data_de_emprestimo DATE,
    cpf_func_multa VARCHAR(14),
    valor_multa NUMBER,
    CONSTRAINT empresta_pk PRIMARY KEY (cpf_cliente, cpf_func, isbn, numero_da_copia),
    CONSTRAINT empresta_cpf_cliente_fk FOREIGN KEY (cpf_cliente) REFERENCES Cliente (cpf_cliente),
    CONSTRAINT empresta_cpf_func_fk FOREIGN KEY (cpf_func) REFERENCES Funcionario (cpf_func),
    CONSTRAINT empresta_isbn_fk FOREIGN KEY (isbn, numero_da_copia) REFERENCES Copia (isbn, numero_da_copia),
    CONSTRAINT empresta_cpf_func_multa_fk FOREIGN KEY (cpf_func_multa) REFERENCES Funcionario(cpf_func)
);
