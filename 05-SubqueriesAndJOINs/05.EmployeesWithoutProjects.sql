SELECT TOP 3
    e.EmployeeID,
    e.FirstName
    FROM Employees AS e
    LEFT JOIN EmployeesProjects AS ep on e.EmployeeID = ep.EmployeeID
    LEFT JOIN Projects AS p on ep.ProjectID = p.ProjectID
WHERE p.ProjectID IS NULL
ORDER BY e.EmployeeID

