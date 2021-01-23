CREATE TABLE Students
(
    StudentID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(20)
)

CREATE TABLE Exams
(
    ExamID INT PRIMARY KEY IDENTITY(101, 1),
    Name NVARCHAR(20)
)

CREATE TABLE StudentsExams
(
    StudentID INT ,
    CONSTRAINT PK_Students_Exams PRIMARY KEY (StudentID, ExamID),
    CONSTRAINT FK_StudentsExams_Students
        FOREIGN KEY (StudentID)
            REFERENCES Students(StudentID),
    ExamID INT,
    CONSTRAINT FK_StudentsExams_Exams
        FOREIGN KEY (ExamID)
            REFERENCES Exams(ExamID)
)

INSERT INTO Students(Name)
VALUES ('Mila'),
       ('Toni'),
       ('Ron')

INSERT INTO Exams(Name)
VALUES ('SpringMVC'),
       ('Neo4j'),
       ('Oracle 11g')

INSERT INTO StudentsExams(StudentID, ExamID)
VALUES (1, 101),
       (1, 102),
       (2, 101),
       (3, 103),
       (2, 102),
       (2, 103)