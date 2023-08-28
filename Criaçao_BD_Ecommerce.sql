CREATE DATABASE desafio;

use desafio;

-- Tabela Cliente
CREATE TABLE Cliente (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    CPF CHAR(11) NOT NULL,
    DataNascimento DATE NOT NULL,
    CONSTRAINT UQ_CPF UNIQUE (CPF)
);

-- Tabela Conta
CREATE TABLE Conta (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Cliente_ID INT UNSIGNED,
    TipoConta ENUM('PF', 'PJ'),
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID)
);

-- Tabela Pedido
CREATE TABLE Pedido (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Cliente_ID INT UNSIGNED,
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Pedido_ID INT UNSIGNED,
    FormaPagamento ENUM('Cartao', 'Boleto'),
    FOREIGN KEY (Pedido_ID) REFERENCES Pedido(ID)
);

-- Tabela Produto
CREATE TABLE Produto (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

-- Tabela Estoque
CREATE TABLE Estoque (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Produto_ID INT UNSIGNED,
    Fornecedor_ID INT UNSIGNED,
    Quantidade INT,
    FOREIGN KEY (Produto_ID) REFERENCES Produto(ID),
    FOREIGN KEY (Fornecedor_ID) REFERENCES Fornecedor(ID)
);

-- Tabela Entrega
CREATE TABLE Entrega (
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Pedido_ID INT UNSIGNED,
    Status VARCHAR(255),
    CodigoRastreio VARCHAR(255),
    FOREIGN KEY (Pedido_ID) REFERENCES Pedido(ID)
);
