CREATE TABLE venda (
    id int PRIMARY KEY,
    idproduto int,
    idrepresentante int,
    idfarmacia int,
    quantidade double,
    valortotal double
);

CREATE TABLE produto (
    id int PRIMARY KEY,
	idLaboratorio int,
    idPrincipioAtivo int,
    nomeComercial varchar(50),
    preco double
);

CREATE TABLE laboratorio (
    id int PRIMARY KEY,
    idfarmacia int,
    nome varchar(50),
    cnpj int UNIQUE
);

CREATE TABLE principioAtivo (
    id int PRIMARY KEY,
    nome varchar(50),
    restricaoUso varchar(50)
);

CREATE TABLE representante (
    id int PRIMARY KEY,
    idfarmacia int,
    nome varchar(50),
    cpf int UNIQUE,
    endereco varchar(50)
);

CREATE TABLE farmacia (
    id int PRIMARY KEY,
    idtipofarmacia int,
    nome varchar(50),
    cnpj int,
    endereco varchar(50),
    venda double
);

CREATE TABLE tipofarmacia (
    id int PRIMARY KEY,
    tipo enum('manipulacao', 'convencional'), 
    descricao text
);

ALTER TABLE venda 
	ADD FOREIGN KEY (idproduto)
    REFERENCES produto (id);

ALTER TABLE venda 
	ADD FOREIGN KEY (idrepresentante)
    REFERENCES representante (id);

ALTER TABLE venda 
	ADD FOREIGN KEY (idfarmacia)
    REFERENCES farmacia (id);    

ALTER TABLE produto 
	ADD FOREIGN KEY  (idlaboratorio)
    REFERENCES laboratorio (id);

ALTER TABLE produto 
	ADD FOREIGN KEY (idprincipioativo)
    REFERENCES principioAtivo (id);
    
ALTER TABLE laboratorio 
	ADD FOREIGN KEY (idfarmacia)
    REFERENCES farmacia (id);

ALTER TABLE farmacia 
	ADD FOREIGN KEY (idtipofarmacia)
    REFERENCES tipofarmacia (id);

ALTER TABLE representante 
	ADD FOREIGN KEY (idfarmacia)
    REFERENCES farmacia (id);


INSERT INTO tipofarmacia (id, tipo, descricao) VALUES
(1, 'convencional', 'Venda de medicamentos industrializados e cosméticos'),
(2, 'manipulacao', 'Preparação de fórmulas magistrais e oficinais'),
(3, 'convencional', 'Drogaria de rede com foco em perfumaria'),
(4, 'manipulacao', 'Especializada em homeopatia'),
(5, 'convencional', 'Farmácia popular'),
(6, 'convencional', 'Farmácia hospitalar interna'),
(7, 'manipulacao', 'Dermocosméticos manipulados'),
(8, 'convencional', 'Drugstore 24 horas'),
(9, 'manipulacao', 'Veterinária manipulada'),
(10, 'convencional', 'Farmácia de bairro');

INSERT INTO principioAtivo (id, nome, restricaoUso) VALUES
(1, 'Paracetamol', 'Hepatotóxico em altas doses'),
(2, 'Dipirona Sódica', 'Contraindicado para alérgicos a pirazolonas'),
(3, 'Ibuprofeno', 'Cautela em casos de úlcera gástrica'),
(4, 'Amoxicilina', 'Venda sob retenção de receita'),
(5, 'Clonazepam', 'Tarja preta - Risco de dependência'),
(6, 'Omeprazol', 'Uso prolongado pode reduzir absorção de B12'),
(7, 'Sildenafila', 'Contraindicado com nitratos'),
(8, 'Loratadina', 'Pode causar sonolência'),
(9, 'Simeticona', 'Sem restrições graves conhecidas'),
(10, 'Metformina', 'Monitorar função renal');

INSERT INTO farmacia (id, idtipofarmacia, nome, cnpj, endereco, venda) VALUES
(1, 1, 'Farmácia Central', 10001, 'Av. Brasil, 100', 500000.00),
(2, 2, 'Erva Doce Manipulação', 10002, 'Rua das Flores, 20', 120000.00),
(3, 1, 'Drogasilva', 10003, 'Av. Paraná, 500', 950000.00),
(4, 3, 'Nissei Center', 10004, 'Rua Santos Dumont, 88', 800000.00),
(5, 5, 'Farmácia do Povo', 10005, 'Rua Operária, 12', 300000.00),
(6, 4, 'HomeoVida', 10006, 'Av. Natureza, 77', 150000.00),
(7, 1, 'Raia Norte', 10007, 'Av. Colombo, 3000', 600000.00),
(8, 2, 'Magistral Farma', 10008, 'Rua Tuiuti, 45', 200000.00),
(9, 8, 'Plantão 24h', 10009, 'Praça da Sé, 1', 1100000.00),
(10, 1, 'Drogaria São Paulo', 10010, 'Av. Paulista, 900', 2000000.00);

INSERT INTO laboratorio (id, idfarmacia, nome, cnpj) VALUES
(1, 1, 'Laboratório NeoQuímica', 20001),
(2, 3, 'Medley Genéricos', 20002),
(3, 4, 'Eurofarma', 20003),
(4, 1, 'EMS', 20004),
(5, 7, 'Pfizer', 20005),
(6, 2, 'Bayer', 20006),
(7, 5, 'Teuto', 20007),
(8, 8, 'Novartis', 20008),
(9, 9, 'Sanofi', 20009),
(10, 10, 'Aché', 20010);

INSERT INTO representante (id, idfarmacia, nome, cpf, endereco) VALUES
(1, 1, 'João Silva', 30001, 'Rua A, 1'),
(2, 3, 'Maria Oliveira', 30002, 'Rua B, 2'),
(3, 4, 'Carlos Souza', 30003, 'Rua C, 3'),
(4, 1, 'Ana Pereira', 30004, 'Rua D, 4'),
(5, 7, 'Roberto Lima', 30005, 'Rua E, 5'),
(6, 2, 'Fernanda Costa', 30006, 'Rua F, 6'),
(7, 5, 'Paulo Rocha', 30007, 'Rua G, 7'),
(8, 8, 'Lucas Martins', 30008, 'Rua H, 8'),
(9, 9, 'Juliana Alves', 30009, 'Rua I, 9'),
(10, 10, 'Marcos Dias', 30010, 'Rua J, 10');

INSERT INTO produto (id, idLaboratorio, idPrincipioAtivo, nomeComercial, preco) VALUES
(1, 1, 1, 'Tylenol', 25.90),
(2, 2, 2, 'Novalgina', 18.50),
(3, 4, 3, 'Advil', 32.00),
(4, 7, 4, 'Amoxil', 45.00),
(5, 3, 5, 'Rivotril', 15.00),
(6, 6, 6, 'Peprazul', 22.90),
(7, 5, 7, 'Viagra', 150.00),
(8, 2, 8, 'Claritin', 30.00),
(9, 9, 9, 'Luftal', 12.50),
(10, 10, 10, 'Glifage', 8.00);

INSERT INTO venda (id, idproduto, idrepresentante, idfarmacia, quantidade, valortotal) VALUES
(1, 1, 1, 1, 2, 51.80),
(2, 2, 2, 3, 1, 18.50),
(3, 3, 3, 4, 3, 96.00),
(4, 4, 1, 1, 1, 45.00),
(5, 5, 5, 7, 2, 30.00),
(6, 6, 6, 2, 1, 22.90),
(7, 7, 4, 1, 1, 150.00),
(8, 8, 2, 3, 2, 60.00),
(9, 9, 9, 9, 4, 50.00),
(10, 10, 10, 10, 10, 80.00);

ALTER TABLE principioAtivo
	ADD COLUMN precoKG double,
	ADD COLUMN formula varchar(20);

ALTER TABLE tipofarmacia 
	ADD COLUMN regulamentacao varchar(100),
	ADD COLUMN taxa_licenca double;

ALTER TABLE farmacia 
	ADD COLUMN telefone varchar(20),
	ADD COLUMN data_fundacao date;

SELECT id, nomeComercial FROM produto;

SELECT * FROM venda WHERE idProduto = 2;

SELECT sum(valortotal) FROM venda;

SELECT venda.id, venda.quantidade, venda.valortotal, produto.preco,
	   produto.id, produto.nomeComercial FROM venda, produto;
