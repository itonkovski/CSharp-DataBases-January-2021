CREATE PROCEDURE usp_GetTownsStartingWith
    (@Letter NVARCHAR(20))
AS
BEGIN
    SELECT t.Name AS Town
        FROM Towns AS t
        WHERE LEFT(t.Name, LEN(@Letter)) = @Letter
END
