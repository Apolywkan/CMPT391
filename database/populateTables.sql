--Populate Classroom table------------------------------------------
declare @bldgNum int
declare @classNum int

select @bldgNum = 5
select @classNum = 100


--Populate Department table-----------------------------------------
INSERT INTO Department VALUES('Computer Science', 5, 95000.00),
('Business', 6, 85000.00), ('Mathematics', 7, 65000.00)

--Populate Instructor table--------------------------------------------
INSERT INTO Instructor VALUES(1, 'Joey Bologne', 100000.00, 'Computer Science'),
(2, 'Johnny Salami', 95000.00, 'Computer Science'),
(3, 'Cam Ham', 65000.00, 'Business'),
(4, 'Chief Beef', 115000.00, 'Business'),
(5, 'Timmy Tuna', 75000.00, 'Mathematics'),
(6, 'Thom Porke', 80000.00, 'Mathematics')

--Populate Student table---------------------------------------------
declare @studentIndex int
select @studentIndex = 1

while @studentIndex <= 1000
begin
	INSERT INTO Student VALUES(@studentIndex, 'JohnDoe' + convert(varchar(5), @studentIndex), 90, 'Computer Science', 1)
	select @studentIndex = @studentIndex + 1
end

--Populate Course table---------------------------------------------------
declare @courseIndex int
select @courseIndex = 100

while @courseIndex >= 100 and @courseIndex <= 500
begin
	INSERT INTO Course VALUES('CMPT' + convert(varchar(5), @courseIndex), 'CS', 3, 'Computer Science')
	select @courseIndex = @courseIndex + 5
end

select @courseIndex = 100

while @courseIndex >= 100 and @courseIndex <= 500
begin
	INSERT INTO Course VALUES('BUSN' + convert(varchar(5), @courseIndex), 'busn', 3, 'Business')
	select @courseIndex = @courseIndex + 5
end

select @courseIndex = 100

while @courseIndex >= 100 and @courseIndex <= 500
begin
	INSERT INTO Course VALUES('MATH' + convert(varchar(5), @courseIndex), 'math', 3, 'Mathematics')
	select @courseIndex = @courseIndex + 5
end

--Populate Time_slot----------------------------------------------------------
INSERT INTO Time_slot VALUES(1, 'MWF', '08:00', '09:00'), (2, 'MWF', '09:00', '10:00'), (3, 'MWF', '10:00', '11:00'),
(4, 'MWF', '12:00', '13:00'), (5, 'MWF', '13:00', '14:00'), (6, 'T/TH', '08:30', '10:00'),
(7, 'T/TH', '10:00', '11:30'), (8, 'T/TH', '11:30', '13:00'), (9, 'T/TH', '13:00', '14:30'),
(10, 'MWF', '08:00', '11:00'), (11, 'T/TH', '10:00', '13:00')

--Populate Logins table---------------------------------------------------
declare @loginIndex int
select @loginIndex = 1

while @loginIndex <= 1000
begin
	INSERT INTO Logins VALUES(@loginIndex, 'username' + convert(varchar(5), @loginIndex), 'password' + convert(varchar(5), @loginIndex))
	select @loginIndex = @loginIndex + 1
end

--Populate Section table-----------------------------------------------------------
DECLARE @secID int
DECLARE @sectionIndex int
DECLARE @cNum int
SELECT @secID = 1
SELECT @sectionIndex = 1
SELECT @cNum = 100

WHILE @sectionIndex >= 1 AND @sectionIndex <= 9
BEGIN
	INSERT INTO Section 
    VALUES (@secID, 'CMPT' + CONVERT(varchar(5), @cNum), 'winter', 2023, @sectionIndex, 
            FLOOR(RAND()*(3-1+1)+5), 
            CASE FLOOR(RAND()*(9-1+1)+1) 
              WHEN 1 THEN '101' 
              WHEN 2 THEN '102' 
              WHEN 3 THEN '103' 
              WHEN 4 THEN '201' 
              WHEN 5 THEN '202' 
              WHEN 6 THEN '203' 
              WHEN 7 THEN '301' 
              WHEN 8 THEN '302' 
              WHEN 9 THEN '303' 
			  ELSE '101'
            END, 
            40, 0)
	SELECT @cNum = @cNum + 30
	SELECT @sectionIndex = @sectionIndex + 1
	SELECT @secID = @secID + 1
END

SELECT @cNum = 100
SELECT @sectionIndex = 1

WHILE @sectionIndex >= 1 AND @sectionIndex <= 9
BEGIN
	INSERT INTO Section 
    VALUES(@secID, 'BUSN' + CONVERT(varchar(5), @cNum), 'winter', 2023, @sectionIndex, 
           FLOOR(RAND()*(3-1+1)+5), 
           CASE FLOOR(RAND()*(9-1+1)+1) 
              WHEN 1 THEN '101' 
              WHEN 2 THEN '102' 
              WHEN 3 THEN '103' 
              WHEN 4 THEN '201' 
              WHEN 5 THEN '202' 
              WHEN 6 THEN '203' 
              WHEN 7 THEN '301' 
              WHEN 8 THEN '302' 
              WHEN 9 THEN '303' 
			  ELSE '101'
           END, 
           40, 0)
	SELECT @cNum = @cNum + 30
	SELECT @sectionIndex = @sectionIndex + 1
	SELECT @secID = @secID + 1
END

SELECT @cNum = 100
SELECT @sectionIndex = 1

WHILE @sectionIndex >= 1 AND @sectionIndex <= 9
BEGIN
	INSERT INTO Section 
    VALUES(@secID, 'MATH' + CONVERT(varchar(5), @cNum), 'winter', 2023, @sectionIndex, 
           FLOOR(RAND()*(3-1+1)+5), 
           CASE FLOOR(RAND()*(9-1+1)+1) 
              WHEN 1 THEN '101' 
              WHEN 2 THEN '102' 
              WHEN 3 THEN '103' 
              WHEN 4 THEN '201' 
              WHEN 5 THEN '202' 
              WHEN 6 THEN '203' 
              WHEN 7 THEN '301' 
              WHEN 8 THEN '302' 
              WHEN 9 THEN '303' 
			  ELSE '101'
           END, 
           40, 0)
	SELECT @cNum = @cNum + 30
	SELECT @sectionIndex = @sectionIndex + 1
	SELECT @secID = @secID + 1
END

--Populate Teaches------------------------------------------------------
INSERT INTO Teaches VALUES (1, 'CMPT100', 1, 'winter', 2023), (1, 'CMPT220', 5, 'winter', 2023),
(2, 'CMPT280', 7, 'winter', 2023), (2, 'CMPT340', 9, 'winter', 2023),
(3, 'BUSN130', 11, 'winter', 2023), (3, 'BUSN160', 12, 'winter', 2023),
(4, 'BUSN250', 15, 'winter', 2023), (4, 'BUSN310', 17, 'winter', 2023),
(5, 'MATH100', 19, 'winter', 2023), (5, 'MATH190', 22, 'winter', 2023),
(6, 'MATH250', 24, 'winter', 2023), (6, 'MATH280', 25, 'winter', 2023)



--Populate Prereq table--------------------------------------------------

INSERT INTO Prereq VALUES 
('BUSN340', 'BUSN100'),
('BUSN340', 'BUSN160'),
('BUSN340', 'BUSN280'),
('CMPT310','CMPT130'),
('CMPT310','CMPT100'),
('CMPT310','CMPT250'),
('CMPT340','CMPT100'),
('CMPT250','CMPT100'),
('MATH340','MATH310'),
('MATH340','MATH280'),
('MATH340','MATH100')


--Populate special--------------------------------------------------------
INSERT INTO Course VALUES ('CHEM100', 'chem', 3, 'Science'), ('CHEM200', 'chem', 3, 'Science')
INSERT INTO Section VALUES (28, 'CHEM100', 'winter', 2023, 10, 5, 313, 40, 0), (29, 'CHEM200', 'winter', 2023, 11, 5, 313, 40, 0)