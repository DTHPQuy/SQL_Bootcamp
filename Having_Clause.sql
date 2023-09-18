SELECT JobTitle, COUNT(JobTitle) AS Job_Count, AVG(Salary)
FROM  SQLTutorial.dbo.EmployeeDemographics 
INNER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000