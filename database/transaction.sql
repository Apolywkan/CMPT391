Create Procedure spRegisterClass (@CourseID AS VARCHAR(10), @SID AS INT) 
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

			SET @capacity = (SELECT capacity FROM Section WHERE CourseID = @CourseID);
			SET @enrollment = (SELECT enrollment FROM Section WHERE CourseID = @CourseID);
			SET @CourseSec = (SELECT sec_id from Section where CourseID = @CourseID);


			/*execute @checkEnrollment = sp_CheckEnrollment @courseID, @SID;
			execute @checkPreReq = sp_CheckPreReq @courseID, @SID;*/

			IF NOT EXISTS (select * from Section as S, Takes as T where S.sec_id = T.sec_id and T.SID = @SID and S.time_slot_id = @courseSec)
			
			BEGIN 
				SET @fitSchedule = 1;
			END

			IF (@enrollment < @capacity and @fitSchedule = 1 /*and @checkEnrollment = -1 and @checkPreReq = -1*/) 
			BEGIN				
				UPDATE Section
				SET section.enrollment = enrollment + 1
				WHERE CourseID = @CourseID;
			END
		
		Commit Transaction
	End Try
	Begin Catch
		Rollback Transaction
	End Catch
End
