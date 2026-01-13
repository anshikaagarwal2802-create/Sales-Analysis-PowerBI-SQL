--CATEGORY WISE PERFORMANCE 
SELECT 
    p.Category,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * p.SellingPrice) AS TotalRevenue,
    SUM(od.Quantity * (p.SellingPrice - p.CostPrice)) AS TotalProfit
FROM Products p
JOIN OrderDetails od 
    ON p.ProductID = od.ProductID
JOIN Orders o 
    ON od.OrderID = o.OrderID
GROUP BY p.Category
ORDER BY TotalRevenue DESC;
