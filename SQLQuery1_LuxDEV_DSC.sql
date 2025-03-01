-- Create Database--
CREATE DATABASE LuxDevSQL;
GO

--Initialize database--
USE LuxDevSQL;
go

--Create table orders---
CREATE TABLE Orders(
OrderID INT PRIMARY KEY IDENTITY(1,1),
CustomerID INT NOT NULL,
OrderDate DATE NOT NULL,
TotalAmount decimal(10,2) NOT NULL
);
GO

--Enter values--
INSERT INTO Orders(CustomerID, OrderDate, TotalAmount)
VALUES
(101, '2023-01-05', 200.00),
(102, '2023-01-07', 150.00),
(101, '2023-01-10', 300.00),
(103, '2023-01-15', 450.00),
(102, '2023-01-20', 100.00),
(101, '2023-01-25', 250.00);
go

--Queries--
SELECT customerID, SUM(totalAmount) AS totalAmount, Count(*) AS totalOrders
FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Orders GROUP BY CustomerID 
					    HAVING COUNT(CustomerID) >1)
GROUP BY CustomerID
ORDER BY totalOrders DESC;

