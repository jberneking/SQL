-- Select customer contact information --

SELECT CustomerID, CustomerName, PrimaryContactPersonID, PhoneNumber
FROM Sales.Customers
;

-- Select item price list --
SELECT StockItemID, StockItemName, UnitPrice
FROM Warehouse.StockItems
;