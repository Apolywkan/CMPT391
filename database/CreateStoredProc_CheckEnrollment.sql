USE [391database]
GO
/****** Object: StoredProcedure [dbo].[sp_CheckEnrollment] Script Date: 2023-01-31 6:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CheckEnrollment] (@CourseID AS VARCHAR(10), @SID AS INT, @Sec_ID AS INT)
AS
BEGIN
	BEGIN TRY
	--To see if the student has taken the specific course
	IF EXISTS (SELECT Takes.CourseID
		FROM Takes, Section
		WHERE Takes.sec_id = Section.sec_id
		AND Takes.SID = @SID
		AND Takes.CourseID = @CourseID
		AND Takes.sec_id = @Sec_ID)
		BEGIN
		RETURN 0
		END
	ELSE
		BEGIN
		RETURN 1
		END
	END TRY
	BEGIN CATCH
	ROLLBACK TRANSACTION
	RETURN -1
	END CATCH
END