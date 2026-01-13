-- low performing product by quantity 
SELECT TOP 5
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * p.SellingPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Products p
    ON od.ProductID = p.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY
    TotalQuantitySold ASC;
