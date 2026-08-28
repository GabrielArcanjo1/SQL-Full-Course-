
SELECT 
	o.OrderID,
	o.Sales,
	c.FirstName AS CustomerFirstName,
	c.LastName AS CustomerLastName,
	p.Product AS ProductName,
	p.Price,
	e.FirstName AS EmployeeFirstName,
	e.LastName AS EmployeeLastName
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS P
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS E
ON o.SalesPersonID = e.EmployeeID

--End of content on JOINs, including INNER, LEFT, RIGHT, FULL, CROSS and Anti JOINs. 
--And also which JOIN to use in each situation and also how to join multiple tables. (Unfortunately I only remembered to save the files in the last part)
