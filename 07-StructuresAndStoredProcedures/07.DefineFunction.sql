--SELECT dbo.ufn_IsWordComprised('oistmiahf', 'Sofia')

CREATE FUNCTION ufn_IsWordComprised(@SetOfLetters VARCHAR(MAX), @Word VARCHAR(MAX))
RETURNS BIT

BEGIN
DECLARE @Count INT = 1;

WHILE(@Count <= LEN(@Word))
BEGIN
    DECLARE @CurrentLetter CHAR(1) = SUBSTRING(@Word, @Count, 1)
    IF(CHARINDEX(@CurrentLetter, @SetOfLetters) = 0)
        RETURN 0

    SET @Count += 1;
END
    RETURN 1
END



