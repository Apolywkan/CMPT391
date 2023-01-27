-- Returns theCount to 1 if the student has not taken the course yet,
-- else, it returns -1

USE [391database];
EXECUTE sp_rename 'CheckEnrollment', 'sp_CheckEnrollment'
GO
ALTER PROCEDURE sp_CheckEnrollment (@CourseID AS INT, @SID AS VARCHAR) AS 

DECLARE @student INT
		,@theCount INT
IF EXISTS (SELECT Takes.CourseID
            FROM Takes
            WHERE Takes.SID = @SID
            AND   Takes.CourseID = @CourseID)
	BEGIN
		SET @theCount = -1
	END
ELSE
	BEGIN
		SET @theCount = 1
	END

	SELECT @theCount AS theCount

EXECUTE sp_CheckEnrollment @CourseID=2, @SID=1