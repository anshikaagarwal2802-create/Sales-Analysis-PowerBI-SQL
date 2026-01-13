--REPEAT CUSTOMERS OR ONE TIME CUSTOMERS 
SELECT 
    CustomerType,
    COUNT(*) AS TotalCustomers
FROM (
    SELECT 
        c.CustomerID,
        CASE 
            WHEN COUNT(o.OrderID) = 1 THEN 'One-Time Customer'
            ELSE 'Repeat Customer'
        END AS CustomerType
    FROM Customers c
    JOIN Orders o 
        ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID
) t
GROUP BY CustomerType;
