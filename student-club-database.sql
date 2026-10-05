CREATE TABLE STUDENT (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    GradYear INT,
    Major VARCHAR(50),
    Email VARCHAR(100)
);
CREATE TABLE CLUB (
    ClubID INT PRIMARY KEY,
    ClubName VARCHAR(50),
    MeetingTime VARCHAR(50),
    NumCurrentMembers INT
);
CREATE TABLE PositionInClub (
    StudentID INT,
    ClubID INT,
    PositionTitle VARCHAR(50),
    PRIMARY KEY (StudentID, ClubID),
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
    FOREIGN KEY (ClubID) REFERENCES CLUB(ClubID)
);
INSERT INTO STUDENT
    (StudentID, FirstName, LastName, GradYear, Major, Email)
VALUES
    (001, 'Alice', 'Smith', 2028, 'Accounting', 'alice.smith@school.edu'),
    (002, 'Ben', 'Jones', 2028, 'Finance', 'ben.jones@school.edu'),
    (003, 'Mary', 'Adams', 2027, 'Accounting', 'mary.adams@school.edu'),
    (004, 'Jenny', 'Li', 2029, 'Marketing', 'jenny.li@school.edu'),
    (005, 'Juan', 'Martinez', 2027, 'BAIT', 'juan.martinez@school.edu'),
    (006, 'Isha', 'Gandhi', 2028, 'Supply Chain', 'isha.gandhi@school.edu'),
    (007, 'Eliza', 'Cooper', 2029, 'BAIT', 'eliza.cooper@school.edu');
INSERT INTO CLUB
    (ClubID, ClubName, MeetingTime, NumCurrentMembers)
VALUES
    (1, 'Women in Business', 'Wed @ 8pm', 150),
    (2, 'Student Assembly', 'Tues @ 9pm', 750),
    (3, 'Beta Alpha Psi', 'Tues/Thurs @ 12pm', 300),
    (4, 'School Paper', 'Thurs @ 7pm', 75),
    (5, 'Asian Culture Club', 'Wed @ 8pm', 100);
INSERT INTO PositionInClub
VALUES
    (001, 1, 'Vice President'),
    (001, 4, 'Member'),
    (002, 3, 'Member'),
    (003, 3, 'Treasurer'),
    (003, 4, 'Member'),
    (004, 5, 'President'),
    (004, 1, 'Member'),
    (004, 3, 'Member'),
    (006, 5, 'Member'),
    (006, 1, 'Secretary'),
    (006, 4, 'Member'),
    (007, 2, 'Member');
SELECT * FROM STUDENT;
SELECT * FROM CLUB;
SELECT * FROM PositionInClub;
SELECT
    CLUB.ClubName,
    COUNT(PositionInClub.StudentID) AS NumberOfStudents
FROM CLUB
LEFT JOIN PositionInClub
    ON CLUB.ClubID = PositionInClub.ClubID
GROUP BY CLUB.ClubID, CLUB.ClubName;
SELECT
    CLUB.ClubName,
    STUDENT.Major,
    COUNT(STUDENT.StudentID) AS NumberOfStudents
FROM CLUB
INNER JOIN PositionInClub
    ON CLUB.ClubID = PositionInClub.ClubID
INNER JOIN STUDENT
    ON PositionInClub.StudentID = STUDENT.StudentID
GROUP BY CLUB.ClubName, STUDENT.Major
ORDER BY CLUB.ClubName;
SELECT
    STUDENT.FirstName,
    STUDENT.LastName,
    CLUB.ClubName,
    PositionInClub.PositionTitle
FROM STUDENT
INNER JOIN PositionInClub
    ON STUDENT.StudentID = PositionInClub.StudentID
INNER JOIN CLUB
    ON PositionInClub.ClubID = CLUB.ClubID
ORDER BY STUDENT.LastName, STUDENT.FirstName;
