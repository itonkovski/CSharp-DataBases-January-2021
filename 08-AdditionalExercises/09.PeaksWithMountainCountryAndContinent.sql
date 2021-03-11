SELECT p.PeakName,
       m.MountainRange AS [Mountain],
       c.CountryName,
       c2.ContinentName
    FROM Peaks AS p
    JOIN Mountains AS m ON p.MountainId = m.Id
    JOIN MountainsCountries AS mc ON m.Id = mc.MountainId
    JOIN Countries AS c ON mc.CountryCode = c.CountryCode
    JOIN Continents AS c2 ON c2.ContinentCode = c.ContinentCode
ORDER BY p.PeakName,
         c2.ContinentName