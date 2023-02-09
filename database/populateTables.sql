--Populate Classroom table------------------------------------------
declare @bldgNum int
declare @classNum int

select @bldgNum = 5
select @classNum = 100

while @bldgNum >= 5 and @bldgNum <= 7
begin
	while @classNum >= 100 and @classNum <= 300
	begin
		INSERT INTO Classroom VALUES(@bldgNum, @classNum, 40)
		select @classNum = @classNum + 1
	end
	select @bldgNum = @bldgNum + 1
	select @classNum = 100
end

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
INSERT INTO Time_slot VALUES(1, 'MWF', '9:00', '10:00'), (2, 'MWF', '10:00', '11:00'), (3, 'MWF', '11:00', '12:00'),
(4, 'MWF', '1:00', '2:00'), (5, 'MWF', '2:00', '3:00'), (6, 'T/TH', '9:30', '11:00'),
(7, 'T/TH', '11:00', '12:30'), (8, 'T/TH', '12:30', '2:00'), (9, 'T/TH', '2:00', '3:30')

--Populate Logins table---------------------------------------------------
declare @loginIndex int
select @loginIndex = 1

while @loginIndex <= 1000
begin
	INSERT INTO Logins VALUES(@loginIndex, 'username' + convert(varchar(5), @loginIndex), 'password' + convert(varchar(5), @loginIndex))
	select @loginIndex = @loginIndex + 1
end

--Populate Section table-----------------------------------------------------------
declare @secID int
declare @sectionIndex int
declare @cNum int
select @secID = 1
select @sectionIndex = 1
select @cNum = 100

while @sectionIndex >= 1 and @sectionIndex <= 9
begin
	INSERT INTO Section VALUES (@secID, 'CMPT' + convert(varchar(5), @cNum), 'winter', 2023, @sectionIndex, 5, 313, 40, 0)
	select @cNum = @cNum + 30
	select @sectionIndex = @sectionIndex + 1
	select @secID = @secID + 1
end

select @cNum = 100
select @sectionIndex = 1

while @sectionIndex >= 1 and @sectionIndex <= 9
begin
	INSERT INTO Section VALUES(@secID, 'BUSN' + convert(varchar(5), @cNum), 'winter', 2023, @sectionIndex, 5, 313, 40, 0)
	select @cNum = @cNum + 30
	select @sectionIndex = @sectionIndex + 1
	select @secID = @secID + 1
end

select @cNum = 100
select @sectionIndex = 1

while @sectionIndex >= 1 and @sectionIndex <= 9
begin
	INSERT INTO Section VALUES(@secID, 'MATH' + convert(varchar(5), @cNum), 'winter', 2023, @sectionIndex, 5, 313, 40, 0)
	select @cNum = @cNum + 30
	select @sectionIndex = @sectionIndex + 1
	select @secID = @secID + 1
end

--Populate Teaches------------------------------------------------------
INSERT INTO Teaches VALUES (1, 'CMPT100', 1, 'winter', 2023), (1, 'CMPT220', 5, 'winter', 2023),
(2, 'CMPT280', 7, 'winter', 2023), (2, 'CMPT340', 9, 'winter', 2023),
(3, 'BUSN130', 11, 'winter', 2023), (3, 'BUSN160', 12, 'winter', 2023),
(4, 'BUSN250', 15, 'winter', 2023), (4, 'BUSN310', 17, 'winter', 2023),
(5, 'MATH100', 19, 'winter', 2023), (5, 'MATH190', 22, 'winter', 2023),
(6, 'MATH250', 24, 'winter', 2023), (6, 'MATH280', 25, 'winter', 2023)


--Populate Prereq table--------------------------------------------------

delete from Prereq where CourseID != ''


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
