CREATE DATABASE oficina;
use oficina;

CREATE TABLE Cliente (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Telefone VARCHAR(20),
    Endereco VARCHAR(255)
);

CREATE TABLE Veiculo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Cliente_ID INT,
    Modelo VARCHAR(50) NOT NULL,
    Ano INT,
    Placa VARCHAR(10),
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID)
);

CREATE TABLE Servico (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Agendamento (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Cliente_ID INT,
    Veiculo_ID INT,
    Servico_ID INT,
    DataAgendamento DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID),
    FOREIGN KEY (Veiculo_ID) REFERENCES Veiculo(ID),
    FOREIGN KEY (Servico_ID) REFERENCES Servico(ID)
);


-- Recuperação de todos os clientes:
SELECT * FROM Cliente;

-- Recuperação de veículos de um cliente específico:
SELECT * FROM Veiculo WHERE Cliente_ID = 1;

-- Cálculo do total gasto por cliente:
SELECT c.Nome, SUM(s.Preco) AS TotalGasto
FROM Cliente c
JOIN Agendamento a ON c.ID = a.Cliente_ID
JOIN Servico s ON a.Servico_ID = s.ID
GROUP BY c.ID;

-- Listagem de agendamentos agendados para o próximo mês:
SELECT a.ID, c.Nome AS Cliente, v.Modelo AS Veiculo, s.Nome AS Servico, a.DataAgendamento
FROM Agendamento a
JOIN Cliente c ON a.Cliente_ID = c.ID
JOIN Veiculo v ON a.Veiculo_ID = v.ID
JOIN Servico s ON a.Servico_ID = s.ID
WHERE MONTH(a.DataAgendamento) = MONTH(NOW()) + 1;
