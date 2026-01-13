--high revenue but low profit product 
SELECT TOP 5
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity * p.SellingPrice) AS TotalRevenue,
    SUM(od.Quantity * (p.SellingPrice - p.CostPrice)) AS TotalProfit
FROM OrderDetails od
JOIN Products p
    ON od.ProductID = p.ProductID
GROUP BY
    p.ProductID,
    p.ProductName
HAVING
    SUM(od.Quantity * p.SellingPrice) > (
        SELECT AVG(od2.Quantity * p2.SellingPrice)
        FROM OrderDetails od2
        JOIN Products p2
            ON od2.ProductID = p2.ProductID
    )
ORDER BY
    TotalProfit ASC;
