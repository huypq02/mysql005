-- BAI 1
--
SELECT *
FROM Products p 
JOIN Suppliers s ON p.SupplierID = s.SupplierID 
WHERE p.Price > 15.00

-- BAI 2
--
SELECT * 
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID 
WHERE Country = 'Mexico'


-- BAI 3
--
SELECT *
FROM Orders o 
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID 
JOIN Suppliers s ON p.SupplierID = s.SupplierID 
GROUP BY s.Country 

-- BAI 4
--
SELECT s.SupplierName, SUM(od.Quantity)
FROM Suppliers s
JOIN Products p ON s.SupplierID = p.SupplierID 
JOIN OrderDetails od ON p.ProductID = od.ProductID 
GROUP BY s.SupplierName 


-- BAI 5
-- 
SELECT p.ProductName, p.Price 
FROM Products p 
WHERE p.Price > (SELECT DISTINCT (Price) FROM Products p2 WHERE p2.ProductName = 'Chang')

-- BAI 6
-- 
SELECT *
FROM Products p 
JOIN OrderDetails od ON p.ProductID = od.ProductID 
JOIN Orders o ON od.OrderID = o.OrderID
WHERE EXTRACT(YEAR_MONTH FROM o.OrderDate) = '202405'

-- BAI 7
--


-- BAI 8
-- 
SELECT o.OrderID, p.ProductName, sum(p.Price * od.Quantity) as total_price
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID 
JOIN Products p ON od.ProductID = p.ProductID 
GROUP BY o.OrderID,  p.ProductName
HAVING total_price > 200.00


-- BAI 9
-- 
SELECT o.OrderID, p.ProductName, AVG(p.Price * od.Quantity) as avg_price
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID 
JOIN Products p ON od.ProductID = p.ProductID 
GROUP BY o.OrderID,  p.ProductName


-- BAI 10
-- 
SELECT c.CustomerName, SUM(p.Price * od.Quantity) as total_price
FROM Customers c 
JOIN Orders o ON c.CustomerID = o.OrderID 
JOIN OrderDetails od ON o.OrderID = od.OrderID 
JOIN Products p ON od.ProductID = p.ProductID 
GROUP BY c.CustomerName 
ORDER BY total_price DESC
LIMIT 1


-- BAI 11
