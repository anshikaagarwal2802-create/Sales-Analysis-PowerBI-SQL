--TO CALCULATE TOTAL REVENUE AND TOTAL ORDERS FOR EACH MONTH

SELECT
    FORMAT(o.OrderDate, 'yyyy-MM') AS SalesMonth,
    COUNT(DISTINCT o.OrderID) AS TotalOrders,
    SUM(od.Quantity * p.SellingPrice) AS TotalRevenue
FROM dbo.Orders o
JOIN dbo.OrderDetails od
    ON o.OrderID = od.OrderID
JOIN dbo.Products p
    ON od.ProductID = p.ProductID
GROUP BY FORMAT(o.OrderDate, 'yyyy-MM')
ORDER BY SalesMonth;
