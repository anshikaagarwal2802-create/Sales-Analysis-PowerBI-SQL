--1)monthwise revenue
SELECT
    YEAR(o.OrderDate) AS Year,
    MONTH(o.OrderDate) AS Month,
    CONCAT(YEAR(o.OrderDate), '-', RIGHT('00' + CAST(MONTH(o.OrderDate) AS VARCHAR), 2)) AS YearMonth,
    SUM(od.Quantity * p.SellingPrice) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY Year, Month;
