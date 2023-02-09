USE [391database]
GO
/****** Object:  StoredProcedure [dbo].[spRegisterClass]    Script Date: 2023-01-31 6:24:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter Procedure [dbo].[spRegisterClass] (@CourseID AS VARCHAR(10), 
										 @SID AS INT, 
										 @sec_id AS INT, 
										 @year as int, 
										 @semester as varchar(30), 
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
					@timeslot AS INT,
					@CourseSec AS INT;
					
			SET @success = 0;
			SET @capacity = (SELECT capacity FROM Section WHERE CourseID = @CourseID); /*amount of total space in class*/
			SET @enrollment = (SELECT enrollment FROM Section WHERE CourseID = @CourseID);/*amount of students already enrolled in class*/
			SET @timeslot = (SELECT time_slot_id FROM Section WHERE CourseID = @CourseID);
			/*SET @CourseSec = (SELECT sec_id from Section where CourseID = @CourseID); */
		

			execute @checkEnrollment = sp_CheckEnrollment @CourseID = @CourseID , @SID= @SID, @Sec_ID = @sec_id;
			execute @checkPreReq = sp_CheckPreReq @SID= @SID ,@CourseID= @CourseID ;
		
			/*check if the class timeslot is not already filled on their sched.*/
			IF NOT EXISTS (select * from Section as S, Takes as T where T.SID = @SID and S.sec_id = T.sec_id and S.time_slot_id = @timeslot) 
			BEGIN 
				SET @fitSchedule = 1;	
			END
		
			IF (@enrollment < @capacity and @fitSchedule = 1 and @checkPreReq = 1 and @checkEnrollment = 1) /*if student meets requirments ^ above*/
			BEGIN
				/*update enrollment/capacity values*/
				UPDATE Section
				SET enrollment = enrollment + 1
				WHERE CourseID = @CourseID;
				
				

				

				set @success = 1;
			END
		
		Commit Transaction
	End Try
	Begin Catch
		Rollback Transaction
	End Catch

	INSERT INTO Takes(SID, CourseID, sec_id, semester, year, grades)
	VALUES (@SID, @CourseID, @sec_id, @semester, @year, null);

	return @success;
End

