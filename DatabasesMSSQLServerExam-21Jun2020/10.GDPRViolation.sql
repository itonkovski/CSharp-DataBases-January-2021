SELECT t.Id,
       a.FirstName + ' ' + ISNULL(a.MiddleName + ' ', '') + a.LastName AS [Full Name],
       ac.Name AS [FROM],
       hc.Name AS [To],
       CASE
           WHEN CancelDate IS NULL THEN CONVERT(NVARCHAR, DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate)) + ' days'
            ELSE 'Canceled' END
            AS Duration
    FROM AccountsTrips AS at
         JOIN Accounts AS a ON a.Id = at.AccountId
         JOIN Cities AS ac ON a.CityId = ac.Id
         JOIN Trips AS t ON at.TripId = t.Id
         JOIN Rooms AS r ON t.RoomId = r.Id
         JOIN Hotels AS h ON r.HotelId = h.Id
         JOIN Cities AS hc ON h.CityId = hc.Id
ORDER BY [Full Name], t.Id