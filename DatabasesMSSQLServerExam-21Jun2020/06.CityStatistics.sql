SELECT c.Name,
       COUNT(h.Id)
    FROM Cities AS c
    RIGHT JOIN Hotels AS h ON c.Id = h.CityId
GROUP BY c.Name
ORDER BY COUNT(h.Id) DESC,
         c.Name