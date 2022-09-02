CREATE DATABASE IF NOT EXISTS  megafarma;

USE megafarma;


CREATE TABLE clientes(
NomeCliente VARCHAR(30) NOT NULL,
CPFCliente VARCHAR(14) NOT NULL,
CorFavorita VARCHAR(20) NOT NULL
);

CREATE TABLE pedidos(
IDVenda INT NOT NULL PRIMARY KEY,
DataDoBagulho DATETIME NOT NULL,
IDCliente INT NOT NULL

);
  

DESC clientes

ALTER TABLE clientes
ADD COLUMN IDCliente INT NOT NULL FIRST;

ADD COLUMN Endereco VARCHAR(10) NOT NULL AFTER CPFCliente;


ALTER TABLE clientes
MODIFY COLUMN Endereco VARCHAR(50) NOT NULL;


ALTER TABLE clientes 
MODIFY COLUMN CorFavorita TINYINT NOT NULL;


DESC pedidos;

ALTER TABLE pedidos 
CHANGE COLUMN DataDoBagulho DataVenda DATETIME NOT NULL;



ALTER TABLE pedidos
RENAME TO vendas ; 


ALTER TABLE clientes 
DROP COLUMN CorFavorita;


ALTER TABLE clientes 
ADD CONSTRAINT PK_Clientes PRIMARY KEY (IDCliente);


ALTER TABLE vendas
ADD CONSTRAINT fk_vendas_clientes FOREIGN KEY (IDCliente)
REFERENCES clientes (IDCliente);


ALTER TABLE clientes 
ADD COLUMN Bairro VARCHAR (30) NOT NULL,
ADD COLUMN Cidade VARCHAR(40) NOT NULL,
ADD COLUMN Estado CHAR(2) NOT NULL,
ADD CONSTRAINT uk_clientes UNIQUE KEY (CPFCliente) ;




EXERCICIO 



CREATE DATABASE IF NOT EXISTS  editora;

USE editora;

CREATE TABLE Livraria(
IDLivraria INT NOT NULL 
);


CREATE TABLE Livros(
IDLivro INT NOT NULL PRIMARY KEY ,
Auto VARCHAR(40)

);


CREATE TABLE NotasFiscais(
CodigoVenda INT NOT NULL PRIMARY KEY,
DataVenda DATETIME NOT NULL ,
IDLivraria INT NOT NULL 

);


CREATE TABLE ItensNF(
CodigoVenda INT NOT NULL,
IDLivro INT NOT NULL ,
QtdeVendida INT NOT NULL

);


ALTER TABLE Livraria 
ADD CONSTRAINT PK_IDLivraria PRIMARY KEY (IDLivraria),
ADD COLUMN NomeLivraria VARCHAR(40) NOT NULL ,
ADD COLUMN Endereco VARCHAR(50) NOT NULL ,
ADD COLUMN CNPJ VARCHAR(18) NOT NULL ,
ADD CONSTRAINT uk_Livraria UNIQUE KEY (CNPJ);



ALTER TABLE Livros
ADD COLUMN TituloLivro VARCHAR(70) NOT NULL  AFTER IDLivro,
ADD COLUMN PrecoUnitario DECIMAL (5,2) NOT NULL ;


ALTER TABLE ItensNF
ADD CONSTRAINT fk_ItensNF_Livros FOREIGN KEY (IDLivro)
REFERENCES Livros (IDLivro),

ADD CONSTRAINT k_ItensNF_NotasFiscais FOREIGN KEY (CodigoVenda)
REFERENCES NotasFiscais (CodigoVenda);

