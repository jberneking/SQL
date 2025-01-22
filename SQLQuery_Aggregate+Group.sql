-- List of customers by total sales --

SELECT Sales.Customers.CustomerName, SUM(Quantity * UnitPrice) AS TotalSales
FROM Sales.OrderLines

INNER JOIN Sales.Orders ON Sales.Orders.OrderID = Sales.OrderLines.OrderID

INNER JOIN Sales.Customers ON Sales.Orders.CustomerID = Sales.Customers.CustomerID

GROUP BY Sales.Customers.CustomerName
ORDER BY TotalSales DESC
;

-- Monthly sales report --
SELECT 
	DATEPART(YEAR, o.OrderDate) AS Year,
	DATEPART(MONTH, o.OrderDate) AS Month,
	SUM(ol.Quantity * ol.UnitPrice) AS TotalSales

FROM Sales.Orders o
INNER JOIN Sales.OrderLines ol ON o.OrderID = ol.OrderID

GROUP BY DATEPART(YEAR, o.OrderDate), DATEPART(MONTH, o.OrderDate)
ORDER BY Year, Month
;