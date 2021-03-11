SELECT c.CountryName,
       c2.ContinentName,
       COUNT(r2.Id) AS RiversCount,
       ISNULL(SUM(r2.Length), 0) AS TotalLength
    FROM Countries AS c
    JOIN Continents AS c2 ON c2.ContinentCode = c.ContinentCode
    LEFT JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
    LEFT JOIN Rivers AS r2 ON r2.Id = cr.RiverId
GROUP BY c.CountryName,
         c2.ContinentName
ORDER BY RiversCount DESC,
         TotalLength DESC,
         c.CountryName