CREATE TABLE Countries
(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(50) UNIQUE
)

CREATE TABLE Customers
(
    Id INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(25),
    LastName NVARCHAR(25),
    Gender CHAR(1) NOT NULL CHECK (Gender IN ('M', 'F')), -- Check here
    Age VARCHAR,
    PhoneNumber VARCHAR(10),
    CountryId INT,
    CONSTRAINT FK_Customers_Countries
        FOREIGN KEY (CountryId)
            REFERENCES Countries(Id)
)

CREATE TABLE Products
(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(25) UNIQUE,
    Description NVARCHAR(25),
    Recipe NVARCHAR(MAX),
    Price DECIMAL(10,2) NOT NULL -- Non positive nums not allowed
)

CREATE TABLE Feedbacks
(
    Id INT PRIMARY KEY IDENTITY,
    Description NVARCHAR(255),
    Rate DECIMAL(10,2),
    ProductId INT,
    CONSTRAINT FK_Feedbacks_Products
        FOREIGN KEY (Productid)
            REFERENCES Products(Id),
    CustomerId INT,
    CONSTRAINT FK_Feedbacks_Customers
        FOREIGN KEY (CustomerId)
            REFERENCES Customers(Id)
)

CREATE TABLE Distributors
(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(25) UNIQUE,
    AddressText NVARCHAR(30),
    Summary NVARCHAR(200),
    CountryId INT,
    CONSTRAINT FK_Distributors_Countries
        FOREIGN KEY (CountryId)
            REFERENCES Countries(Id)
)

CREATE TABLE Ingredients
(
    Id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(30),
    Description NVARCHAR(200),
    OriginCountryId INT,
    CONSTRAINT FK_Ingredients_Countries
        FOREIGN KEY (OriginCountryId)
            REFERENCES Countries(Id),
    DistributorId INT,
    CONSTRAINT FK_Ingredients_Distributors
        FOREIGN KEY (DistributorId)
            REFERENCES Distributors(Id)
)

CREATE TABLE ProductsIngredients
(
    ProductId INT,
    CONSTRAINT PK_ProductsIngredients
        PRIMARY KEY (ProductId,IngredientId),
    CONSTRAINT FK_ProductsIngredients
        FOREIGN KEY (ProductId)
            REFERENCES Products(Id),
    IngredientId INT,
    CONSTRAINT FK_ProductsIngredients_Ingredients
        FOREIGN KEY (IngredientId)
            REFERENCES Ingredients(Id)
)