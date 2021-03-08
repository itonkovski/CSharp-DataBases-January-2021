CREATE FUNCTION ufn_CashInUsersGames(@GameName VARCHAR(100))
RETURNS TABLE
AS
RETURN  (SELECT SUM(k.TotalCash) AS TotalCash
    FROM(SELECT Cash AS TotalCash,
                ROW_NUMBER() OVER (ORDER BY CASH DESC) AS RowNumber
         FROM Games AS g
                  JOIN UsersGames AS ug ON g.Id = ug.GameId
         WHERE g.Name = @GameName) AS k
        WHERE k.RowNumber % 2 = 1)

/*SELECT * FROM ufn_CashInUsersGames('Love in a mist')*/