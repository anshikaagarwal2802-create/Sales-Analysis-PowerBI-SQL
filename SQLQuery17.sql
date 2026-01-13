--top selling product by revenue 

SELECT TOP 10
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity * p.SellingPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Products p 
    ON od.ProductID = p.ProductID
GROUP BY 
    p.ProductID, 
    p.ProductName
ORDER BY 
    TotalRevenue DESC;
