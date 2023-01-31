-- Returns theCount to 1 if the student has not taken the course yet,
-- else, it returns -1

USE [391database];
GO
ALTER PROCEDURE sp_CheckEnrollment (@CourseID AS INT, @SID AS INT)

AS BEGIN
	DECLARE @student INT
			,@theCount INT
	IF EXISTS (SELECT Takes.CourseID
				FROM Takes
				WHERE Takes.SID = @SID
				AND   Takes.CourseID = @CourseID)
	BEGIN
		RETURN -1
	END
ELSE
	BEGIN
		RETURN 1
	END

END
GO

DECLARE @returnCount AS INT
EXECUTE @returnCount = sp_CheckEnrollment @CourseID=2, @SID=1

-- These print statements are there to see what the return value for @returnCount is
IF (@returnCount = 1)
BEGIN
	print 'The student has already taken the course'
END
ELSE
BEGIN
	print 'The student has not taken the course yet'
END

SELECT @returnCount AS countNumber