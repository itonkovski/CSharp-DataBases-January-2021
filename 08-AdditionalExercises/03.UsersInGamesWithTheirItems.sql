SELECT u.Username,
       g.Name AS [Game],
       COUNT(i.Id) AS [Items Count],
       SUM(i.Price) AS [Items Price]
    FROM Games AS g
    JOIN UsersGames AS ug ON g.Id = ug.GameId
    JOIN Users AS u ON ug.UserId = u.Id
    JOIN UserGameItems AS ugi ON ug.Id = ugi.UserGameId
    JOIN Items AS i ON i.Id = ugi.ItemId
    GROUP BY u.Username,
             g.Name
    HAVING COUNT(i.Id) >= 10
    ORDER BY [Items Count] DESC,
             [Items Price] DESC,
             u.Username