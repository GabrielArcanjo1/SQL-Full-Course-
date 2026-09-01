--SET Operators: UNION

--ORDER BY can be used only once.
--The number and order of columns must be the same, and the type of data must be match.
--The first query give the name on the output.

SELECT
FirstName,
LastName
FROM Sales.Customers

UNION --Return all distintic rows from both tables.

SELECT
FirstName,
LastName
FROM Sales.Employees;

--TASK: Combine the Data from employees and customers into one table.
--SOLUTION: Must check both tables for matching columns, and select them in the queries.

SELECT 
FirstName,
LastName
FROM Sales.Customers
UNION
SELECT 
FirstName,
LastName
FROM Sales.Employees;

--SET Operators: UNION ALL

--It doesn't eliminate duplicates like UNION. It's faster.

SELECT 
FirstName,
LastName
FROM Sales.Customers
UNION ALL
SELECT 
FirstName,
LastName
FROM Sales.Employees;

--SET Operators: EXCEPT(or Minus)

--Returns all distinct rows from the first query that are not found in the second query.
-- The order of queries does affect the result.

--TASK: Find the employees who are not customers at the same time
SELECT 
FirstName,
LastName
FROM Sales.Employees
EXCEPT
SELECT 
FirstName,
LastName
FROM Sales.Customers;

-- SET Operators : INTERSECT

-- Returns common rows between two tables.

-- TASK: Find employees who are also customers.

SELECT 
FirstName,
LastName
FROM Sales.Employees
INTERSECT
SELECT 
FirstName,
LastName
FROM Sales.Customers;

-- Use cases for SET Operators
-- Combine similar information before analyzing the data (UNION or UNION ALL)

-- TASK: Orders data are stored in separetes tables (Oders and OrdersArchive).
--Combine all orders data into one report without duplicates.
--SOLUTION: Using a * is not a good practice, if there are changes to the table the code may break.

SELECT 
       'Orders' AS SourceTable,
       [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.Orders
UNION
SELECT 
       'OrdersArchive' AS SourceTable,
       [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive
ORDER BY OrderID;