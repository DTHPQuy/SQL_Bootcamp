WITH CTE_Employee AS
(
SELECT FirstName,LastName,Gender,
COUNT(Gender) OVER (PARTITION BY Gender) AS Total_Gender
FROM SQLTutorial.dbo.EmployeeDemographics emp
JOIN SQLTutorial.dbo.EmployeeSalary sal
ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > 45000
)
SELECT FirstName
FROM CTE_Employee
