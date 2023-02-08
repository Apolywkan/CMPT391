-- Returns theCount to 1 if the student meets the prequisite of a course,
-- else, it returns -1

USE [391database];

GO
CREATE PROCEDURE sp_CheckPreReq 
    @SID INT, 
    @CourseID INT
AS

	--declare variables
	DECLARE @necessaryCourses AS INT
		   --COUNT on how many Courses @CourseID depends
		   --COUNT on how many Courses the Student has taken
		   ,@countTakenCourses AS INT

	SET @necessaryCourses = (SELECT count(*) FROM Prereq WHERE CourseID = @CourseID);


	SET @countTakenCourses = (
		SELECT count(*)
		FROM Prereq p
		--JOIN with Student take history to check if the student has visited the necessary course
		JOIN Takes t on p.preCourseID = t.CourseID 
		WHERE p.CourseID = @CourseID AND t.SID = @SID
	)

	IF @necessaryCourses = @countTakenCourses  
	BEGIN
		RETURN 1
	END
	ELSE 
	BEGIN 
		RETURN -1
	END

DECLARE @preReqCount AS INT
EXECUTE @preReqCount = sp_CheckPreReq @SID=1, @CourseID=3;