-- Returns -1 if the student has not taken the course yet,
-- else, it returns 1

GO
CREATE PROCEDURE sp_CheckEnrollment (@CourseID INT, @SID INT, @Sec_ID INT)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            --To see if the student has taken the specific course
            IF EXISTS (SELECT Takes.CourseID
                        FROM Takes, Section
                        WHERE Takes.sec_id = Section.sec_id
                        AND Takes.SID = @SID
                        AND Takes.CourseID = @CourseID
                        AND Takes.sec_id = @Sec_ID)
            BEGIN
                COMMIT TRANSACTION
                RETURN -1
            END
        ELSE
            BEGIN
                COMMIT TRANSACTION
                RETURN 1
            END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        PRINT 'ERROR: An error has occurred while executing the sp_CheckEnrollment procedure'
    END CATCH
END


GO
DECLARE @returnCount INT
EXECUTE @returnCount = sp_CheckEnrollment @CourseID=1, @SID=1, @Sec_ID=4
SELECT @returnCount AS countNumber