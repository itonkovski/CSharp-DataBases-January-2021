CREATE PROCEDURE usp_EmployeesBySalaryLevel(@LevelOfSalary VARCHAR(20))
AS
SELECT FirstName, LastName
    FROM Employees
    WHERE dbo.ufn_GetSalaryLevel(Salary) = @LevelOfSalary

--EXECUTE usp_EmployeesBySalaryLevel 'High'

CREATE FUNCTION ufn_IsWordComprised(@SetOfLetters, @Word)
RETURNS BIT