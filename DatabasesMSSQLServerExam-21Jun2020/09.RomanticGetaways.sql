SELECT a.Id,
       a.Email,
       C.Name AS City,
       COUNT(t.Id) AS Trips
    FROM Accounts AS a
    JOIN AccountsTrips AS at ON a.Id = at.AccountId
    JOIN Trips AS t ON at.TripId = t.Id
    JOIN Rooms AS r ON t.RoomId = r.Id
    JOIN Hotels AS h ON r.HotelId = h.Id
    JOIN Cities AS c ON a.CityId = c.Id AND h.CityId = c.Id
GROUP BY a.Id, a.Email, C.Name
ORDER BY Trips DESC,
         a.Id