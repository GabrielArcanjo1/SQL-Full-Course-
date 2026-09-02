--STRING FUNCTIONS FUNCTIONS: A built-in SQL code.

--TASK: Show a list of customers first names together with their country in one column.
SELECT 
	first_name,
	country,
	CONCAT(first_name, '-', country) AS name_country
FROM customers

--TASK: Transform the customers first name to lowercase/uppercase.
SELECT 
	first_name,
	country,
	LOWER(first_name) AS low_name,
	UPPER(first_name) AS up_name
FROM customers

-- TASK: find customers whose first name contains leading or trailing spaces.
SELECT 
	first_name,
	LEN(first_name) AS len_name,
	LEN(TRIM(first_name)) AS len_trim_name,
	LEN(first_name) - LEN(TRIM(first_name)) As flag
FROM customers
WHERE LEN(first_name) != LEN(TRIM(first_name))
--WHERE first_name != TRIM(first_name)

--TASK: REmove dashes (-) from a phone number.
--TASK: Replace File Extence from txt to csv.
SELECT
'123-456-7890' AS phone,
REPLACE('123-456-7890', '-', '') AS clean_phone

SELECT
'report.txt',
REPLACE('report.txt', 'txt', 'csv')

--TASK:	Calculate the length of each customer's first name.
SELECT 
first_name,
LEN(first_name) As len_name
FROM customers

--TASK: Retrive the first two characters of each first/last name.
SELECT
	first_name,
	LEFT(TRIM(first_name, 2)) AS first_2_char --RIGHT(first_name, 2)
FROM customers

-- TASK: Retrive a list of customers first names after removing the first character.
SELECT
	first_name,
	SUBSTRING(TRIM(first_name), 2, LEN(first_name)) AS sub_name
FROM customers