CREATE TABLE Users
(
    Id INT PRIMARY KEY IDENTITY,
    Username VARCHAR(30) NOT NULL,
    [Password] VARCHAR(30) NOT NULL,
    Email VARCHAR(50) NOT NULL
)

CREATE TABLE Repositories
(
    Id INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(50) NOT NULL
)

CREATE TABLE RepositoriesContributors
(
    RepositoryId INT NOT NULL,
    CONSTRAINT FK_RepConts_Reps
        FOREIGN KEY (RepositoryId)
            REFERENCES Repositories(Id),
    ContributorId INT NOT NULL,
    CONSTRAINT FK_RepConts_Users FOREIGN KEY (ContributorId) REFERENCES Users(Id),
    CONSTRAINT PK_RepositoriesContributors PRIMARY KEY (RepositoryId, ContributorId)
)

CREATE TABLE Issues
(
    Id INT PRIMARY KEY IDENTITY,
    Title VARCHAR(255) NOT NULL,
    IssueStatus VARCHAR(6) NOT NULL,
    RepositoryId INT NOT NULL,
    CONSTRAINT FK_Issues_Repositories
        FOREIGN KEY (RepositoryId)
            REFERENCES Repositories(Id),
    AssigneeId INT NOT NULL,
    CONSTRAINT FK_Issues_Users FOREIGN KEY (AssigneeId) REFERENCES Users(Id)
)

CREATE TABLE Commits
(
    Id INT PRIMARY KEY IDENTITY,
    [Message] VARCHAR(255) NOT NULL,
    IssueId INT,
    CONSTRAINT FK_Commits_Issues
        FOREIGN KEY (IssueId)
            REFERENCES Issues(Id),
    RepositoryId INT NOT NULL,
    CONSTRAINT FK_Commits_Repositories
        FOREIGN KEY (RepositoryId)
            REFERENCES Repositories(Id),
    ContributorId INT NOT NULL,
    CONSTRAINT FK_Commits_Users
        FOREIGN KEY (ContributorId)
            REFERENCES Users(Id)
)

CREATE TABLE Files
(
    Id INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(100) NOT NULL,
    Size DECIMAL(10,2) NOT NULL,
    ParentId INT REFERENCES Files(Id),
    CommitId INT NOT NULL,
    CONSTRAINT FK_Files_Commits
        FOREIGN KEY (CommitId)
            REFERENCES Commits(Id)
)