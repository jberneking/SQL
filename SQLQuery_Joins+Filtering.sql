-- List of customers and purchasing contacts who have placed an order within the past 10 years --

SELECT DISTINCT Sales.Orders.CustomerID, CustomerName, Sales.Customers.PhoneNumber, FullName, EmailAddress

FROM Sales.Orders

INNER JOIN Sales.Customers ON Sales.Orders.CustomerID = Sales.Customers.CustomerID

INNER JOIN Application.People ON Sales.Orders.ContactPersonID = Application.People.PersonID

WHERE Sales.Customers.IsOnCreditHold = 0 AND Sales.Orders.OrderDate >= DATEADD(year, -10, GETDATE())
;

-- List of low stock products --

SELECT Warehouse.StockItems.StockItemID, StockItemName, QuantityOnHand, ReorderLevel
FROM Warehouse.StockItems

INNER JOIN Warehouse.StockItemHoldings ON Warehouse.StockItemHoldings.StockItemID = Warehouse.StockItems.StockItemID
WHERE QuantityOnHand < ReorderLevel
;