SELECT f.Id,
       f.[Name],
       CONVERT(Varchar, f.Size) +'KB' AS Size
    FROM Files AS f
    LEFT JOIN Files AS ff ON ff.ParentId = f.Id
    WHERE ff.ParentId IS NULL
ORDER BY f.Id, f.[Name], f.Size DESC