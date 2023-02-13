USE [391database]
GO
/****** Object:  StoredProcedure [dbo].[spRegisterClass]    Script Date: 2023-02-12 1:10:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spRegisterClass] (@CourseID AS VARCHAR(10), 
										 @SID AS INT, 
										 @sec_id AS INT, 
										 @year int, 
										 @semester varchar(30), 
										 @success as int OUTPUT) 
as
Begin
	Begin Try
		Begin Transaction
			--declare variables
			DECLARE @capacity AS INT,
					@enrollment AS INT,
					@checkEnrollment AS INT,
					@checkPreReq AS INT,
					@fitSchedule AS INT = -1,
					@CourseSec AS INT;
					
			SET @success = 0;
			SET @capacity = (SELECT capacity FROM Section WHERE CourseID = @CourseID); /*amount of total space in class*/
			SET @enrollment = (SELECT enrollment FROM Section WHERE CourseID = @CourseID);/*amount of students already enrolled in class*/
			/*SET @CourseSec = (SELECT sec_id from Section where CourseID = @CourseID); */
		
			execute @checkEnrollment = sp_CheckEnrollment @CourseID = @CourseID , @SID= @SID, @Sec_ID = @sec_id;
			execute @checkPreReq = sp_CheckPreReq @SID= @SID ,@CourseID= @CourseID ;
		
			/*check if the class timeslot is not already filled on their sched.*/
			/*IF NOT EXISTS (SELECT 1 FROM Takes T INNER JOIN Section S ON T.sec_id = S.sec_id
               WHERE T.SID = @SID AND S.time_slot_id = (SELECT time_slot_id FROM Section WHERE sec_id = @sec_id))*/
			IF NOT EXISTS (select * from vWTimeSection as S, Takes as T where S.sec_id = T.sec_id and T.SID = @SID and S.day = (SELECT day FROM vWTimeSection WHERE sec_id = 24) and S.start_time < (SELECT endtime FROM vWTimeSection WHERE sec_id = @SID) and S.endtime > (SELECT start_time FROM vWTimeSection WHERE sec_id = @SID))
			BEGIN
				SET @fitSchedule = 1;
			END

		
			IF (@enrollment < @capacity and @fitSchedule = 1 and @checkPreReq = 1 and @checkEnrollment = 1) /*if student meets requirments ^ above*/
			BEGIN
				/*update enrollment/capacity values*/
				UPDATE Section
				SET section.enrollment = enrollment + 1
				WHERE CourseID = @CourseID;


				INSERT INTO Takes(SID, CourseID, sec_id, semester, year, grades)
				VALUES (@SID, @CourseID, @sec_id, @semester, @year, null);

				set @success = 1;
			END
		
		Commit Transaction
	End Try
	Begin Catch
		Rollback Transaction
	End Catch

	return @success;
End

