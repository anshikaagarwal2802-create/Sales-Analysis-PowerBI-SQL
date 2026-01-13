 --peak sales days 
 SELECT
    CAST(o.OrderDate AS DATE) AS SalesDate,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * p.SellingPrice) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od 
    ON o.OrderID = od.OrderID
JOIN Products p 
    ON od.ProductID = p.ProductID
GROUP BY CAST(o.OrderDate AS DATE)
ORDER BY TotalRevenue DESC;
