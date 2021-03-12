SELECT c2.CurrencyCode,
       c2.Description AS Currency,
       COUNT(c.CountryName) AS NumberOfCountries
    FROM Currencies AS c2
    LEFT JOIN Countries AS c ON c2.CurrencyCode = c.CurrencyCode
GROUP BY c2.CurrencyCode, c2.Description
ORDER BY NumberOfCountries DESC,
         c2.Description