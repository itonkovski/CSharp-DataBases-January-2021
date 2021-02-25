SELECT COUNT(*) AS Count
    FROM Countries AS c
    LEFT JOIN MountainsCountries AS mc on c.CountryCode = mc.CountryCode
WHERE mc.MountainId IS NULL
GROUP BY mc.MountainId


