create database clubeconvites;
use clubeconvites;

create table pessoa(
    id INT NOT NULL auto_increment,
    nome VARCHAR(80),
    sobrenome VARCHAR(80),
    cargo VARCHAR(50),
    criado TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

create table lote(
    id INT NOT NULL auto_increment,
    id_usuario INT NOT NULL,
    inicio_intervalo DATE NOT NULL UNIQUE,
    final_intervalo DATE NOT NULL UNIQUE,
    criado TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

create table convite(
    id_pessoa INT NOT NULL,
    id_lote INT NOT NULL,
    convites_disponiveis SMALLINT NOT NULL,
    convites_impressos SMALLINT DEFAULT 0 NOT NULL,
    criado TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id_pessoa, id_lote),
    FOREIGN KEY(id_pessoa) REFERENCES pessoa(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(id_lote) REFERENCES lote(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table usuario(
    id INT NOT NULL auto_increment,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(80) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    is_ativo BOOLEAN DEFAULT 1 NOT NULL,
    is_admin BOOLEAN NOT NULL,
    is_super BOOLEAN NOT NULL,
    criado TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

create table convite_utilizado(
    id INT NOT NULL auto_increment,
    id_pessoa INT NOT NULL,
    id_lote INT NOT NULL,
    doc VARCHAR(45) NOT NULL,
    nome VARCHAR(80) NOT NULL,
    foto TEXT NOT NULL,
    PRIMARY KEY(id)
);