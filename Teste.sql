SELECT Firstname, LastName, Gender, Salary, COUNT(Gender) OVER (PARTITION BY Gender) AS Totalgender
FROM EmployeeDemographics dem
JOIN EmployeeSalary sal
	ON dem.employeeid = sal.employeeid


SELECT  Gender, COUNT(Gender)
FROM EmployeeDemographics dem
JOIN EmployeeSalary sal
	ON dem.employeeid = sal.employeeid
GROUP BY Gender


WITH CTE_Employee AS (
	SELECT FirstName, LastName, Gender, Salary, COUNT(gender) OVER (PARTITION by Gender) AS TotalGender,
		ROUND(AVG(Salary) OVER (PARTITION BY Gender), 2) AS AvgSalary
	FROM EmployeeDemographics emp 
	JOIN EmployeeSalary sal
		ON emp.employeeid = sal.employeeid
	WHERE Salary > '45000'
)

SELECT FirstName, AvgSalary 
FROM CTE_Employee

CREATE TEMP TABLE tempEmployee (
EmployeeID INT,
JobTitle VARCHAR (100),
Salary INT)

SELECT *
FROM tempEmployee

INSERT INTO tempEmployee VALUES (
	'1001', 'HR', '45000'
)

INSERT INTO tempEmployee
SELECT*
FROM employeeSalary


DROP TABLE IF EXISTS Temp_Employee2;
CREATE TEMP TABLE Temp_Employee2 (
JobTitle VARCHAR (50),
EmployeePerJob INT,
AvgAge INT,
AvgSalary INT
);

INSERT INTO Temp_Employee2 
	(SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
	FROM EmployeeDemographics emp
	JOIN EmployeeSalary sal
		ON emp.employeeid = sal.employeeid
	GROUP BY JobTitle
);
SELECT *
FROM Temp_Employee2

	
