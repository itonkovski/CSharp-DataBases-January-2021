CREATE TABLE Categories
(
    Id INT IDENTITY  PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL,
    DailyRate DECIMAL(10,2),
    WeeklyRate DECIMAL(10,2),
    MonthlyRate DECIMAL(10,2),
    WeekendRate DECIMAL(10,2)
)

CREATE TABLE Cars
(
    Id INT IDENTITY PRIMARY KEY,
    PlateNumber NVARCHAR(10) NOT NULL,
    Manufacturer NVARCHAR(50) NOT NULL,
    Model NVARCHAR(50) NOT NULL,
    CarYear INT NOT NULL,
    CategoryId INT,
    CONSTRAINT FK_Cars_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
    Doors INT NOT NULL,
    Picture VARBINARY(MAX),
    Condition NVARCHAR(MAX),
    Available BIT NOT NULL
)

CREATE TABLE Employees
(
    Id INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    Notes NVARCHAR(MAX)
)


CREATE TABLE Customers
(
    Id INT IDENTITY PRIMARY KEY,
    DriverLicenceNumber INT NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(200) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    ZIPCode INT NOT NULL,
    Notes NVARCHAR(MAX)
)


CREATE TABLE RentalOrders
(
    Id INT IDENTITY PRIMARY KEY,
    EmployeeId INT,
    CONSTRAINT FK_RentalOrders_Employees FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
    CustomerId INT,
    CONSTRAINT FK_RentalOrders_Customers FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
    CarId INT,
    CONSTRAINT FK_RentalOrders_Cars FOREIGN KEY (CarId) REFERENCES Cars(Id),
    TankLevel INT NOT NULL,
    KilometrageStart INT NOT NULL,
    KilometrageEnd INT NOT NULL,
    TotalKilometrage AS KilometrageEnd - KilometrageStart,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalDays AS DATEDIFF(DAY, StartDate, EndDate),
    RateApplied DECIMAL(6,2),
    TaxRate DECIMAL(6,2),
    OrderStatus NVARCHAR(50),
    Notes NVARCHAR(MAX)
)

INSERT INTO Categories (CategoryName, DailyRate, WeekLyRate, MonthlyRate, WeekendRate)
VALUES ('Car', 20, 120, 500, 42.50),
       ('Bus', 250, 1600, 6000, 489.99),
       ('Truck', 500, 3000, 11900, 949.90)

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
VALUES ('123456ABCD', 'Mazda', 'CX-5', 2016, 1, 5, 123456, 'Perfect', 1),
       ('asdafof145', 'Mercedes', 'Tourismo', 2017, 2, 3, 99999, 'Perfect', 1),
       ('asdp230456', 'MAN', 'TGX', 2016, 3, 2, 123456, 'Perfect', 1)

INSERT INTO Employees (FirstName, LastName, Title, Notes)
VALUES ('Ivan', 'Ivanov', 'Seller', 'I am Ivan'),
       ('Georgi', 'Georgiev', 'Seller', 'I am Gosho'),
       ('Mitko', 'Mitkov', 'Manager', 'I am Mitko')

INSERT INTO Customers (DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
VALUES (123456789, 'Gogo Gogov', 'óë. Ïèðîòñêà 5', 'Ñîôèÿ', 1233, 'Good driver'),
       (347645231, 'Mara Mareva', 'óë. Èâàí Äðàñîâ 14', 'Âàðíà', 5678, 'Bad driver'),
       (123574322, 'Strahil Strahilov', 'óë. Êåñòåí 4', 'Äóïíèöà', 5689, 'Good driver')

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, StartDate, EndDate)
VALUES (1, 1, 1, 54, 2189, 2456, '2017-11-05', '2017-11-08'),
       (2, 2, 2, 22, 13565, 14258, '2017-11-06', '2017-11-11'),
       (3, 3, 3, 180, 1202, 1964, '2017-11-09', '2017-11-12')