CREATE TABLE Cities
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(20) NOT NULL,
    CountryCode NVARCHAR(2) NOT NULL
)

CREATE TABLE  Hotels
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(30) NOT NULL,
    CityId INT NOT NULL,
    CONSTRAINT FK_Hotels_Cities
        FOREIGN KEY (CityId)
            REFERENCES Cities(Id),
    EmployeeCount INT NOT NULL,
    BaseRate DECIMAL(15,2)
)

CREATE TABLE Rooms
(
    Id INT PRIMARY KEY IDENTITY,
    Price DECIMAL(15,2) NOT NULL,
    Type NVARCHAR(20) NOT NULL,
    Beds INT NOT NULL,
    HotelId INT NOT NULL,
    CONSTRAINT FK_Rooms_Hotels
        FOREIGN KEY (HotelId)
            REFERENCES Hotels(Id)
)

CREATE TABLE Trips
(
    Id INT PRIMARY KEY IDENTITY,
    RoomId INT NOT NULL,
    CONSTRAINT FK_Trips_Rooms
        FOREIGN KEY (RoomId)
            REFERENCES Rooms(Id),
    BookDate DATE NOT NULL,
    ArrivalDate DATE NOT NULL,
    ReturnDate DATE NOT NULL,
    CancelDate DATE,
    CHECK (BookDate < ArrivalDate),
    CHECK (ArrivalDate < ReturnDate)
)

CREATE TABLE Accounts
(
    Id INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(50) NOT NULL,
    MiddleName NVARCHAR(20),
    LastName NVARCHAR(50) NOT NULL,
    CityId INT NOT NULL,
    CONSTRAINT FK_Accounts_Cities
        FOREIGN KEY (CityId)
            REFERENCES Cities(Id),
    BirthDate DATE NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE AccountsTrips
(
    AccountId INT NOT NULL,
    CONSTRAINT FK_AccountsTrips_Accounts
        FOREIGN KEY (AccountId)
            REFERENCES Accounts(Id),
    TripId INT NOT NULL,
    CONSTRAINT FK_AccountsTrips_Trips
        FOREIGN KEY (TripId)
            REFERENCES Trips(Id),
    Luggage INT CHECK(Luggage >= 0) NOT NULL,
    CONSTRAINT PK_AccountsTrips PRIMARY KEY (AccountId, TripId)
)
