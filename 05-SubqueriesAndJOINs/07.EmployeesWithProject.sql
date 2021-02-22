SELECT TOP 5
    e.EmployeeID,
    e.FirstName,
    p.Name AS ProjectName
    FROM Employees AS e
    INNER JOIN EmployeesProjects AS ep on e.EmployeeID = ep.EmployeeID
    INNER JOIN Projects AS p on ep.ProjectID = p.ProjectID
WHERE p.StartDate > '08-13-2002'
AND p.EndDate IS NULL
ORDER BY e.EmployeeID