SELECT TOP(5) k.Country, [Highest Peak Name], [Highest Peak Elevation], Mountain
FROM(
    SELECT c.CountryName AS Country,
           ISNULL(p.PeakName, '(no highest peak)') AS [Highest Peak Name],
           ISNULL(MAX(p.Elevation), 0) AS [Highest Peak Elevation],
           ISNULL(m.MountainRange, '(no mountain)') AS Mountain,
           DENSE_RANK() OVER (PARTITION BY c.CountryName ORDER BY MAX(p.Elevation)DESC) AS Ranked

    FROM Countries AS c
             LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
             LEFT JOIN Mountains AS m ON mc.MountainId = m.Id
             LEFT JOIN Peaks AS p ON mc.MountainId = p.MountainId
    GROUP BY c.CountryName, p.PeakName, m.MountainRange) AS k
WHERE Ranked = 1
ORDER BY Country, [Highest Peak Name]

/*SELECT TOP 5
    c.CountryName,
    ISNULL(p.PeakName, '(no highest peak)') AS [Highest Peak Name],
    ISNULL(P.Elevation, 0) AS [Highest Peak Elevation],
    ISNULL(m.MountainRange, '(no mountain)') AS [Mountain]
FROM Countries c
         LEFT JOIN MountainsCountries mc
                   ON mc.CountryCode = c.CountryCode
         LEFT JOIN Mountains m
                   ON m.Id = mc.MountainId
         LEFT JOIN Peaks p
                   ON p.MountainId = mc.MountainId
ORDER BY c.CountryName,
         P.PeakName*/