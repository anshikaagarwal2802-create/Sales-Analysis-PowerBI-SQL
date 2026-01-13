CREATE TABLE Customers (
    CustomerID INT  identity(1,1) PRIMARY KEY ,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Country VARCHAR(50),
    CreatedDate DATE
);
