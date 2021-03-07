CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan(@Amount MONEY)
AS
SELECT ah.FirstName, ah.LastName
    FROM AccountHolders AS ah
    JOIN Accounts AS a ON ah.Id = a.AccountHolderId
GROUP BY ah.FirstName, ah.LastName
    HAVING SUM(Balance) > @Amount
ORDER BY ah.FirstName, ah.LastName

/*EXECUTE usp_GetHoldersWithBalanceHigherThan 50000*/
