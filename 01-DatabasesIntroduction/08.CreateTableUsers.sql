CREATE TABLE Users
(
    Id BIGINT PRIMARY KEY IDENTITY,
    UserName VARCHAR(30) NOT NULL,
    [Password] VARCHAR(26) NOT NULL,
    ProfilePicture VARCHAR(MAX),
    LastLoginTime DATETIME,
    IsDeleted BIT
)
INSERT INTO Users (Username, [Password], ProfilePicture, LastLoginTime, IsDeleted)
VALUES
('ivotonk', 'strongpass123', 'https://github.com/rothin.pmg', '01/12/2021', 0),
('ivotonk1', 'strongpass123@', 'https://github.com/rothin.pmg', '02/12/2021', 0),
('ivotonk2', 'strongpass123.', 'https://github.com/rothin.pmg', '03/12/2021', 1),
('ivotonk3', 'strongpass123!', 'https://github.com/rothin.pmg', '04/12/2021', 0),
('ivotonk4', 'strongpass123?', 'https://github.com/rothin.pmg', '05/12/2021', 1)