CREATE TABLE Passports
(
    PassportID INT PRIMARY KEY IDENTITY(101,1),
    PassportNumber CHAR(8)
)

CREATE TABLE Persons
(
    PersonID INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(20),
    Salary Decimal(10,2),
    PassportID INT UNIQUE FOREIGN KEY REFERENCES Passports(PassportID)
)

INSERT INTO Passports
VALUES ('N34FG21B'),
       ('K65LO4R7'),
       ('ZE657QP2')

INSERT INTO Persons
VALUES ('Ivan', 43300.00, 102),
       ('Asen', 56100.00, 103),
       ('Dragan', 60200.00, 101)