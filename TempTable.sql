CREATE TABLE #temp_Employee 
(
EmployeeID int,
JobTitle VARCHAR(100),
Salaray INT
)

SELECT *
from #temp_Employee

INSERT INTO #temp_Employee
SELECT * 
FROM SQLTutorial..EmployeeSalary

SELECT * FROM SQLTutorial..EmployeeDemographics
SELECT * FROM SQLTutorial..EmployeeSalary
SELECT * FROM #temp_EmployeeJobs

CREATE TABLE #temp_EmployeeJobs
(
EmployeeID INT,
JobTitles VARCHAR(100),
AVG_Age INT,
AVG_Salary INT
)

INSERT INTO #temp_EmployeeJobs
SELECT demo. EmployeeID, JobTitle,
AVG(Age) OVER (PARTITION BY Age),
AVG(Salary) OVER (PARTITION BY Salary)
FROM SQLTutorial..EmployeeDemographics demo
INNER JOIN SQLTutorial..EmployeeSalary sal
ON demo.EmployeeID = sal.EmployeeID

CREATE TABLE #temp_EmployeeAll
( 
EmployeeID INT,
FirstName VARCHAR(30),
Age INT,
JobTitle VARCHAR(100),
Salary INT
)

INSERT INTO #temp_EmployeeAll
SELECT demo.EmployeeID, demo.FirstName, demo.Age, sal.JobTitle, sal.Salary 
FROM SQLTutorial..EmployeeDemographics demo
INNER JOIN SQLTutorial..EmployeeSalary sal
ON demo.EmployeeID = sal.EmployeeID