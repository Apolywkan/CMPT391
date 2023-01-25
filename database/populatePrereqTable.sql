--Populate Prereq table---------------------------------------------------
ALTER TABLE Prereq
ALTER COLUMN CourseID varchar(30)
ALTER TABLE Prereq
ALTER COLUMN preCourseID varchar(30)

INSERT INTO Prereq VALUES 
('BUSN475', 'BUSN100'),
('BUSN475', 'BUSN265'),
('BUSN475', 'BUSN335'),
('CMPT410','CMPT340'),
('CMPT410','CMPT100'),
('CMPT410','CMPT245'),
('CMPT340','CMPT100'),
('CMPT245','CMPT100'),
('MATH500','MATH445'),
('MATH500','MATH425'),
('MATH500','MATH410')
