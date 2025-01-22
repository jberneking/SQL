-- 2015 orders --

SELECT
	o.OrderDate, 
	c.CustomerName, 
	si.StockItemName, 
	ol.Quantity, 
	ol.UnitPrice,
	SUM(ol.Quantity * ol.UnitPrice) AS OrderTotal

FROM Sales.Orders o

INNER JOIN Sales.Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Sales.OrderLines ol ON o.OrderID = ol.OrderID
INNER JOIN Warehouse.StockItems si ON ol.StockItemID = si.StockItemID

WHERE ol.Quantity >200 AND (o.OrderDate BETWEEN '2015-01-01' AND '2015-12-31')

GROUP BY
	c.CustomerName,
	o.OrderDate,
	si.StockItemName, 
	ol.Quantity, 
	ol.UnitPrice
	
ORDER BY
	o.OrderDate
;