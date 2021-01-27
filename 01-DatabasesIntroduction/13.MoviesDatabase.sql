CREATE TABLE Directors
(
    Id INT IDENTITY PRIMARY KEY ,
    DirectorName NVARCHAR(50) NOT NULL,
    Notes NVARCHAR(MAX)
)

CREATE TABLE Genres
(
    Id INT IDENTITY PRIMARY KEY,
    GenreName NVARCHAR(50) NOT NULL,
    Notes NVARCHAR(MAX)
)

CREATE TABLE Categories
(
    Id INT IDENTITY PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL,
    Notes NVARCHAR(MAX)
)

CREATE TABLE  Movies
(
    Id INT IDENTITY PRIMARY KEY,
    Title  NVARCHAR(50) NOT NULL,
    DirectorId INT,
    CONSTRAINT FK_Movies_Directors
        FOREIGN KEY (DirectorId)
            REFERENCES Directors(Id),
    CopyrightYear INT NOT NULL,
    Length INT NOT NULL,
    GenreId INT,
    CONSTRAINT FK_Movies_Genres
        FOREIGN KEY (GenreId)
            REFERENCES Genres(Id),
    CategoryId INT,
    CONSTRAINT FK_Movies_Categories
        FOREIGN KEY (CategoryId)
            REFERENCES Categories(Id),
    Rating DECIMAL(3,2) NOT NULL,
    Notes NVARCHAR(Max)
)

INSERT INTO Directors (DirectorName, Notes)
VALUES ('Francis Ford Coppola', 'He was born in 1939 in Detroit.'),
       ('Christopher Nolan', 'He was born on July 30, 1970 in London, England.'),
       ('Tony Kaye', 'Tony Kaye was born in London, United Kingdom.'),
       ('Ridley Scott', 'He was born on November 30, 1937 in South Shields.'),
       ('Brian De Palma', 'He was born in 1940.')

INSERT  INTO Genres(GenreName, Notes)
VALUES ('Action', 'Cool genre.'),
       ('Comedy', 'Very funny'),
       ('Historical', 'A story for real person or event.'),
       ('Science fiction', 'Cool genre.'),
       ('Fantasy', NULL)

INSERT INTO Categories (CategoryName, Notes)
VALUES ('Great', 'The greatest'),
       ('Very good', 'very good film'),
       ('Good', 'Good film'),
       ('Poor', 'Very poor film'),
       ('Awful', 'Just AWFUL')

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES ('The Godfather', 1, 1972, 175, 1, 1, 9.2, 'The best film ever.'),
       ('The Dark Knight', 2, 2008, 152, 4, 1, 9, 'Other the best film ever.'),
       ('American History X', 3, 1998, 119, 3, 2, 8.5, 'Very very good film'),
       ('Gladiator', 4, 2000, 155, 3, 2, 8.5, 'Very very good film'),
       ('Scarface', 5, 1983, 170, 1, 1, 8.3, 'Very very good film')