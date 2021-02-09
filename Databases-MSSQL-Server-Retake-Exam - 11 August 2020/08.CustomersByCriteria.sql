SELECT c.FirstName,
       c.Age,
       c.PhoneNumber
    FROM Customers AS c
    JOIN Countries AS c2 ON c.CountryId = c2.Id
    WHERE (c.Age >= 21 AND c.FirstName LIKE '%an%')
    OR (RIGHT(c.PhoneNumber, 2) = '38' AND c2.Name != 'Greece')
ORDER BY c.FirstName, c.Age DESC