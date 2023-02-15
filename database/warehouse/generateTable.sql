-- Create Instructors Dimension Table
CREATE TABLE DimInstructors (
InstructorID INT PRIMARY KEY,
InstructorName VARCHAR(50),
Faculty VARCHAR(50),
Rank VARCHAR(50),
University VARCHAR(50)
);

-- Create Students Dimension Table
CREATE TABLE DimStudents (
StudentID INT PRIMARY KEY,
StudentName VARCHAR(50),
Major VARCHAR(50),
Gender VARCHAR(10)
);

-- Create Courses Dimension Table
CREATE TABLE DimCourses (
CourseID INT PRIMARY KEY,
Department VARCHAR(50),
Faculty VARCHAR(50),
University VARCHAR(50)
);

-- Create Date Dimension Table
CREATE TABLE DimDate (
DateID INT PRIMARY KEY,
Semester VARCHAR(10),
Year INT
);

-- Create Fact Table
CREATE TABLE FactCourses (
CourseID INT,
InstructorID INT,
StudentID INT,
DateID INT,
TotalCourses INT,
FOREIGN KEY (CourseID) REFERENCES DimCourses (CourseID),
FOREIGN KEY (InstructorID) REFERENCES DimInstructors (InstructorID),
FOREIGN KEY (StudentID) REFERENCES DimStudents (StudentID),
FOREIGN KEY (DateID) REFERENCES DimDate (DateID)
);

-- Create clustered index on Fact table for better performance
CREATE CLUSTERED INDEX cx_FactCourses ON FactCourses (DateID, InstructorID, StudentID, CourseID);

Select * from DimCourses
Select * from DimInstructors
Select * from DimDate
Select * from DimStudents
Select * from FactCourses