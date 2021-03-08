CREATE PROCEDURE usp_CalculateFutureValueForAccount
    (@AccountId INT, @InterestRate FLOAT)
AS
BEGIN
SELECT a.Id,
       ah.FirstName,
       ah.LastName,
       a.Balance,
       dbo.ufn_CalculateFutureValue(a.Balance, @InterestRate, 5)
    FROM AccountHolders AS ah
    JOIN Accounts AS a ON ah.Id = a.AccountHolderId
    WHERE a.Id = @AccountId
END

/*EXECUTE usp_CalculateFutureValueForAccount 1, 0.1*/