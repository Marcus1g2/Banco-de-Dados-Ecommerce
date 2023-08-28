-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Nome, CPF, DataNascimento) VALUES
('João Silva', '12345678901', '1990-01-15'),
('Maria Souza', '98765432101', '1985-05-20');

-- Inserindo dados na tabela Conta
INSERT INTO Conta (Cliente_ID, TipoConta) VALUES
(1, 'PF'),
(2, 'PJ');

-- Inserindo dados na tabela Pedido
INSERT INTO Pedido (Cliente_ID) VALUES
(1),
(2);

-- Inserindo dados na tabela Pagamento
INSERT INTO Pagamento (Pedido_ID, FormaPagamento) VALUES
(1, 'Cartao'),
(2, 'Boleto');

-- Inserindo dados na tabela Produto
INSERT INTO Produto (Nome) VALUES
('Celular'),
('Notebook');

-- Inserindo dados na tabela Fornecedor
INSERT INTO Fornecedor (Nome) VALUES
('Fornecedor A'),
('Fornecedor B');

-- Inserindo dados na tabela Estoque
INSERT INTO Estoque (Produto_ID, Fornecedor_ID, Quantidade) VALUES
(1, 1, 100),
(2, 2, 50);

-- Inserindo dados na tabela Entrega
INSERT INTO Entrega (Pedido_ID, Status, CodigoRastreio) VALUES
(1, 'Pendente', '123456'),
(2, 'Enviado', '789012');
