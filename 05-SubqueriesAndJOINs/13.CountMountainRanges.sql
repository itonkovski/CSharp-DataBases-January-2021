SELECT c.CountryCode,
       COUNT(*) AS MountainRanges
    FROM Countries AS c
    JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
WHERE c.CountryCode IN('US', 'RU', 'BG')
GROUP BY c.CountryCode