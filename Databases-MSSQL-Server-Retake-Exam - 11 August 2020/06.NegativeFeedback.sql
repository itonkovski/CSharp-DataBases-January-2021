SELECT ProductId, Rate, Description, CustomerId, c.Age, c.Gender
    FROM Feedbacks AS f
    JOIN Customers AS c on c.Id = f.CustomerId
WHERE f.Rate < 5.0
ORDER BY f.ProductId DESC, f.Rate
