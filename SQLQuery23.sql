--MONTHLY SALES DROP DETECTION 
WITH MonthlySales AS (
    SELECT 
        YEAR(o.OrderDate) AS SalesYear,
        MONTH(o.OrderDate) AS SalesMonth,
        DATENAME(MONTH, o.OrderDate) AS MonthName,
        SUM(od.Quantity * p.SellingPrice) AS MonthlyRevenue
    FROM Orders o
    JOIN OrderDetails od 
        ON o.OrderID = od.OrderID
    JOIN Products p 
        ON od.ProductID = p.ProductID
    GROUP BY 
        YEAR(o.OrderDate),
        MONTH(o.OrderDate),
        DATENAME(MONTH, o.OrderDate)
),
SalesComparison AS (
    SELECT 
        *,
        LAG(MonthlyRevenue) OVER (
            ORDER BY SalesYear, SalesMonth
        ) AS PreviousMonthRevenue,
        MonthlyRevenue 
            - LAG(MonthlyRevenue) OVER (
                ORDER BY SalesYear, SalesMonth
            ) AS RevenueChange
    FROM MonthlySales
)
SELECT *
FROM SalesComparison
ORDER BY SalesYear, SalesMonth;
