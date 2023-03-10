USE [391database]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CheckPreReq]
@SID INT,
@CourseID VARCHAR(10)
AS
BEGIN
SET NOCOUNT ON;
  BEGIN TRY
    BEGIN TRANSACTION
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
      COMMIT TRANSACTION
      RETURN 1
    END
    ELSE 
    BEGIN 
      COMMIT TRANSACTION
      RETURN 0
    END
  END TRY
BEGIN CATCH
ROLLBACK TRANSACTION
--error handling code here
END CATCH
END