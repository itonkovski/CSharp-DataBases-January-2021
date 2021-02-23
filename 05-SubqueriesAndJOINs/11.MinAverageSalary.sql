SELECT TOP(1) AVG(Salary) AS AverageSalary
    FROM Employees AS e
    JOIN Departments AS d on e.DepartmentID = d.DepartmentID
GROUP BY e.DepartmentID
ORDER BY AverageSalary

--Another solution
/*SELECT TOP(1) AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
ORDER BY AvgSalary*/