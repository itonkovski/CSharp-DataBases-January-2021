SELECT c.ContinentName,
       SUM(c2.AreaInSqKm) AS CountriesArea,
       SUM(CAST(c2.Population AS BIGINT)) AS CountriesPopulation
    FROM Continents AS c
    JOIN Countries AS c2 ON c.ContinentCode = c2.ContinentCode
GROUP BY c.ContinentName
ORDER BY CountriesPopulation DESC