CREATE PROCEDURE usp_SwitchRoom(@TripId INT, @TargetRoomId INT)
AS
    DECLARE @TripHotelId INT = (SELECT r.HotelId
                                FROM Trips AS t
                                         JOIN Rooms AS r ON r.Id = t.RoomId
                                WHERE t.Id = @TripId);

    DECLARE @TargetRoomHotelId INT = (SELECT r.HotelId
                                      FROM Rooms AS r
                                      WHERE r.Id = @TargetRoomId);

    IF(@TripHotelId != @TargetRoomHotelId)
        THROW 50001, 'Target room is in another hotel!', 1

    DECLARE @TargetRoomBeds INT = (SELECT r.Beds
                                        FROM Rooms AS r
                                        WHERE r.Id = @TargetRoomId);

    DECLARE @TripAccounts INT = (SELECT COUNT(*)
                                        FROM AccountsTrips AS at
                                        WHERE at.TripId = @TripId);

    IF(@TripAccounts > @TargetRoomBeds)
        THROW 50002, 'Not enough beds in target room!', 1

    UPDATE Trips SET RoomId = @TargetRoomId WHERE Id = @TripId;

GO

/*EXEC usp_SwitchRoom 10, 11
SELECT RoomId FROM Trips WHERE Id = 10*/

/*EXEC usp_SwitchRoom 10, 7*/

/*EXEC usp_SwitchRoom 10, 8*/