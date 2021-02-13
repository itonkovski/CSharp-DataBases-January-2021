CREATE FUNCTION udf_AllUserCommits(@Username VARCHAR(30))
RETURNS INT AS
BEGIN
    DECLARE @Result INT;

    SELECT @Result =  COUNT(c.Id) FROM Users AS u
    JOIN Commits AS c ON c.ContributorId = u.Id
    WHERE u.Username = @Username

    RETURN @Result
END

/*SELECT dbo.udf_AllUserCommits('UnderSinduxrein')*/