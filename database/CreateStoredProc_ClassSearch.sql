CREATE PROCEDURE ClassSearch
	@CourseID VARCHAR(10),
	@year INT,
	@semester VARCHAR(30)
AS
BEGIN TRY
	BEGIN TRANSACTION
	SELECT *
	FROM Section S, Time_slot T
	WHERE S.time_slot_id = T.time_slot_id
	AND S.year = @year
	AND S.semester = @semester
	AND S.CourseID LIKE @CourseID
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN
	ROLLBACK TRANSACTION
END
END CATCH


--exec ClassSearch @CourseID = 'cmpt%', @year = 2023, @semester = 'winter'






