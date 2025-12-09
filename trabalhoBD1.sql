create database trabalhoBD1;
use trabalhoBD1;

create table venda (
    id int primary key,
    idproduto int,
    idrepresentante int,
    idfarmacia int,
    quantidade double,
    valortotal double
);

alter table venda 
	add foreign key (idproduto)
    references produto (id);

alter table venda 
	add foreign key (idrepresentante)
    references representante (id);

alter table venda 
	add foreign key (idfarmacia)
    references farmacia (id);
    
create table produto (
    id int primary key,
	idLaboratorio int,
    idPrincipioAtivo int,
    nomeComercial varchar(50),
    preco double
);

alter table produto 
	add foreign key (idlaboratorio)
    references laboratorio (id);

alter table produto 
	add foreign key (idprincipioativo)
    references principioativo (id);
    
create table principioAtivo (
    id int primary key,
    nome varchar(50),
    restricaoUso varchar(50)
);

create table laboratorio (
    id int primary key,
    idfarmacia int,
    nome varchar(50),
    cnpj int unique
);

alter table laboratorio 
	add foreign key (idfarmacia)
    references farmacia (id);

create table farmacia (
    id int primary key,
    idtipofarmacia int,
    nome varchar(50),
    cnpj int,
    endereco varchar(50),
    venda double
);


alter table farmacia 
	add foreign key (idtipofarmacia)
    references tipofarmacia (id);


create table representante (
    id int primary key,
    idfarmacia int,
    nome varchar(50),
    cpf int unique,
    endereco varchar(50)
);

alter table representante 
	add foreign key (idfarmacia)
    references farmacia (id);

create table tipofarmacia (
    id int primary key,
    tipo enum('manipulacao', 'convencional'), 
    descricao text
);
