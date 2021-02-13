CREATE PROCEDURE usp_SearchForFiles(@FileExtension VARCHAR(100))
AS
BEGIN
    SELECT Id, [Name], CONVERT(VARCHAR, Size) + 'KB' AS Size FROM Files AS f
    WHERE f.[Name] LIKE '%'+ @FileExtension
    ORDER BY Id, [Name], f.Size DESC
END

/*EXEC usp_SearchForFiles 'txt'*/