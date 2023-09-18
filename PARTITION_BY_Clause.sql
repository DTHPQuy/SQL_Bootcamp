--USE PARTITION BY TO TAKE A COUNT BUT STILL KEEP ALL INFORMATION OF ALL COLUNMS 
SELECT FirstName,LastName,Salary,Gender,
COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM [SQLTutorial].[dbo].[EmployeeDemographics] demo
INNER JOIN [SQLTutorial].[dbo].[EmployeeSalary] sal
ON demo.EmployeeID = sal.EmployeeID
