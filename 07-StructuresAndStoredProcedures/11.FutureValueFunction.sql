CREATE FUNCTION ufn_CalculateFutureValue
    (@Sum DECIMAL(15,2), @YearlyInterestRate FLOAT, @NumberOfYears INT)
RETURNS DECIMAL(15, 4)
BEGIN
    DECLARE @Result DECIMAL(15,4)
    SET @Result = (@Sum * POWER((1 + @YearlyInterestRate), @NumberOfYears))
    RETURN @Result
END

/*SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 5)*/