-- Returns -1 if the student has not taken the course yet,
-- else, it returns 1

USE [391database];
GO

ALTER PROCEDURE sp_CheckEnrollment (@CourseID AS INT, @SID AS INT, @Sec_ID AS INT)

AS BEGIN
	--To see if the student has taken the specific course
	IF EXISTS (SELECT Takes.CourseID
				FROM Takes, Section
				WHERE Takes.sec_id = Section.sec_id
				AND Takes.SID = @SID
				AND Takes.CourseID = @CourseID
				AND Takes.sec_id = @Sec_ID)
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
EXECUTE @returnCount = sp_CheckEnrollment @CourseID=1, @SID=1, @Sec_ID=4

SELECT @returnCount AS countNumber
