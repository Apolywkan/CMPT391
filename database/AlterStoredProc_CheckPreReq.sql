USE [391database]
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckPreReq]    Script Date: 2023-01-31 6:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_CheckPreReq] 
    @SID INT, 
    @CourseID VARCHAR(10)
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

	IF ( @necessaryCourses = @countTakenCourses)

	BEGIN
		RETURN 1
	END
	ELSE 
	BEGIN 
		RETURN 0
	END
