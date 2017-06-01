#-- Setup Database Jons --#

CREATE DATABASE joons;

USE joons;

CREATE TABLE setor (
	id int(11) primary key auto_increment,
    nome varchar(20) not null
);

CREATE TABLE endereco (
	id int(11) primary key auto_increment,
    cep int(8) not null unique key,
    rua varchar(45) not null,
    bairro varchar(45) not null
);
    
CREATE TABLE cliente (
	id int(11) primary key auto_increment,
    nome varchar(45) not null,
    sobrenome varchar(45) not null,
    CPF varchar(14) not null,
    RG varchar(45) not null
);
    
CREATE TABLE telefone (
	id int(11) primary key auto_increment,
    ddd varchar(45) not null,
    telefone varchar(45) not null unique key
);

CREATE TABLE funcionario (
	id int(11) primary key auto_increment,
    nome varchar(45) not null,
    sobrenome varchar(45) not null,
    CPF varchar(14) not null,
    RG varchar(45) not null,
    id_setor int(11),
    FOREIGN KEY (id_setor) REFERENCES setor(id)
);
    
CREATE TABLE dependente (
	id int(11) primary key auto_increment,
    nome varchar(45) not null,
    sobrenome varchar(45) not null,
    CPF varchar(14) not null,
    RG varchar(45) not null,
    id_funcionario int(11),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario (id)
 );

CREATE TABLE email (
	id int(11) primary key auto_increment,
    nome varchar(45) not null unique key,
    id_cliente int(11),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id)
 );



CREATE TABLE cliente_has_endereco (
	id int(11) primary key auto_increment,
    id_endereco int(11),
    id_cliente int(11),
    numero int(10),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id),
    FOREIGN KEY (id_endereco) REFERENCES endereco (id)
);

CREATE TABLE cliente_has_telefone (
	id int(11) primary key auto_increment,
    id_telefone int(11),
    id_cliente int(11),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id),
    FOREIGN KEY (id_telefone) REFERENCES telefone (id)
);

CREATE TABLE funcionario_has_endereco (
	id int(11) primary key auto_increment,
    id_endereco int(11),
    id_funcionario int(11),
    numero int(10),
    FOREIGN KEY (id_endereco) REFERENCES endereco (id),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario (id)
);


CREATE TABLE funcionario_has_telefone (
	id int(11) primary key auto_increment,
    id_telefone int(11),
    id_funcionario int(11),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario (id),
    FOREIGN KEY (id_telefone) REFERENCES telefone (id)
);

CREATE TABLE pedido (
	id int(11) primary key auto_increment,
    codigo varchar(45) not null unique key,
    total float(11,2) not null,
    id_cliente int(11),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id)
 );

#-- Fim DDL --#​

insert into cliente (nome, sobrenome, cpf, rg) values ('Pedro', 'Silva', '123', '432'), ('Mauro', 'Silva', '123', '432'), ('Rafael', 'Osorio', '1234', '123123'), ('Joao', 'Silva', '23123', '34234123'), ('Manoela', 'Pereira', '123', '432'), ('Maiara', 'Silva', '112323', '431232');

insert into setor (nome) values ('Financeiro'), ('Comercial'), ('Marketing'), ('TI'), ('Compras');

insert into endereco (cep, rua, bairro) values (123123, 'Rua das flores', 'Carioca'), (34534, 'Rua Andradas', 'Centro'), (5532, 'Rua Gasometro', 'Gas'), (5234, 'Rua tomaz flores', 'Bom fim'), (1231234, 'Rua das flores', 'Carioca'), (344534, 'Rua Andradas', 'Centro'), (55312, 'Rua Gasometro', 'Gas'), (52314, 'Rua tomaz flores', 'Bom fim');

insert into funcionario (nome, sobrenome, cpf, rg, id_setor) values ('Amanda', 'Silva', '123', '432', 1), ('Roberto', 'Zafari', '123', '432',2), ('Bruna', 'Toloti', '1234', '433123',3), ('Joao', 'Silva', '23123', '34234123',1), ('Roger', 'Pereira', '123', '432',4), ('Lucas', 'Vando', '112323', '431232',5);

insert into dependente (nome, sobrenome, cpf, rg, id_funcionario) values ('Victor', 'Silva', '123', '432',1), ('Mariana', 'Silva', '123', '432',1), ('Ana Paula', 'Osorio', '1234', '123123',2), ('Leonardo', 'Silva', '23123', '34234123',2), ('Gabriela', 'Pereira', '123', '432',3), ('Lara', 'Silva', '112323', '431232',2);

insert into email (nome, id_cliente) values ('teste@teste.com', 1), ('teste@gmail.com',2), ('olatt@hotmail.com', 3), ('eu@ti.inf.com',2), ('mar@jjk.com.br',3);

insert into pedido (codigo, total, id_cliente) values ('aa1123', 34.2, 1), ('aa11223', 54.2, 1), ('aa13123', 64.2, 2), ('aa11234', 323.2, 3);

insert into telefone (ddd, telefone) values ('51', '12312341223'), ('51', '12341234'), ('51', '45634563456'), ('51', '564564563456'), ('51','1231234123');

insert into cliente_has_endereco (id_endereco, id_cliente, numero) values (1, 1, 1223), (2, 2, 123), (2, 3, 123), (3, 2, 1233), (4, 4, 123), (4, 3, 123);

insert into cliente_has_telefone (id_telefone, id_cliente) values (1, 1), (2, 2);

insert into funcionario_has_endereco (id_endereco, id_funcionario, numero) values (1, 1, 1223), (2, 2, 123), (2, 3, 123), (4, 3, 123);

insert into funcionario_has_telefone (id_telefone, id_funcionario) values (3, 1), (4, 2);