-- Quantos pedidos foram feitos por cada cliente?
SELECT c.Nome AS Cliente, COUNT(p.ID) AS NumPedidos
FROM Cliente c
LEFT JOIN Pedido p ON c.ID = p.Cliente_ID
GROUP BY c.Nome;
-- Algum vendedor também é fornecedor?
SELECT DISTINCT c.Nome
FROM Cliente c
JOIN Fornecedor f ON c.ID = f.ID;
-- Relação de produtos fornecedores e estoques:
SELECT p.Nome AS Produto, f.Nome AS Fornecedor, e.Quantidade AS Estoque
FROM Produto p
JOIN Estoque e ON p.ID = e.Produto_ID
JOIN Fornecedor f ON e.Fornecedor_ID = f.ID;
-- Relação de nomes dos fornecedores e nomes dos produtos:
SELECT f.Nome AS Fornecedor, p.Nome AS Produto
FROM Fornecedor f
JOIN Produto p ON f.ID = p.Fornecedor_ID;
