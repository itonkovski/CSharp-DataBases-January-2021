CREATE TABLE People 
(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(200) NOT NULL,
    Picture VARBINARY(MAX),
    Height DECIMAL(3, 2),
    [Weight] DECIMAL(5,2),
    Gender CHAR NOT NULL CHECK (Gender IN ('m', 'f')),
    Birthdate  DATETIME NOT NULL,
    Biography NVARCHAR(MAX)
)
INSERT INTO People([Name], Picture, Height, [Weight], Gender, BirthDate, Biography)
VALUES
('Ivan', 1000, 1.866, 90.2244, 'm', '02/02/1988', 'I am a human'),
('July', NULL, 1.987, 70.2224, 'f', '02/02/1990', 'I am a human'),
('Pesho', 1234, 1.654, 75.22777, 'm', '02/02/1987', 'I am a human'),
('Misho', NULL, 1.765, 60.2234, 'm', '02/02/1999', 'I am a human'),
('Rosi', 1253, 1.634, 77.2234, 'f', '02/02/1998', 'I am a human')