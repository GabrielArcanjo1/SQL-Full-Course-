--Number Functions
--ROUND: above 5, round up, below 5 round down.
SELECT 
3.516,
ROUND(3.516, 2) as ROUND_2,
ROUND(3.516, 1) as ROUND_1,
ROUND(3.516, 0) as ROUND_0

--ABS/ABSOLUTE: Converts any negative number to positive.
SELECT
-10,
ABS(-10),
ABS(10)

--Date and time functions
SELECT	
OrderID,
OrderDate,
ShipDate,
CreationTime
FROM Sales.Orders

--Date and Time Values
SELECT	
OrderID,
CreationTime,
'2025-08-20' AS HardCoded,
GETDATE() Today
FROM Sales.Orders

--Date and Time Functions and Extraction
SELECT	
OrderID,
CreationTime,
YEAR(CreationTime) AS Year,
MONTH(CreationTime) AS Month,
DAY(CreationTime) AS Day
FROM Sales.Orders

--DATEPART
SELECT	
OrderID,
CreationTime,
DATEPART(year, OrderDate) Year,
DATEPART(month, OrderDate) Month,
DATEPART(day, OrderDate) Day,
DATEPART(hour, CreationTime) Hour,
DATEPART(quarter, CreationTime) Quarter,
DATEPART(week, CreationTime) Week
FROM Sales.Orders

--DATENAME
SELECT
OrderID,
CreationTime,
DATENAME(month, OrderDate) Month,
DATENAME(weekday, OrderDate) Day
FROM Sales.Orders

--DATETRUNC
SELECT
OrderID,
CreationTime,
DATETRUNC(minute, CreationTime) Minute,
DATETRUNC(day, CreationTime) day,
DATETRUNC(year, CreationTime) year
FROM Sales.Orders

--EOMONTH
SELECT 
OrderID,
CreationTime,
EOMONTH(CreationTime) EndOfMonth
FROM Sales.Orders

--How many orders were placed each year?
SELECT
YEAR(OrderDate),
COUNT(*) NrOrders
FROM Sales.Orders
GROUP BY YEAR(OrderDate)

--How many orders were placed each month?
SELECT
DATENAME(month, OrderDate) AS OrderDate,
COUNT(*) NrOrders
FROM Sales.Orders
GROUP BY DATENAME(month, OrderDate)
