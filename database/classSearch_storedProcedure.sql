
create procedure ClassSearch @CourseID varchar(10), @year int, @semester varchar(30) as
select * from Section S, Time_slot T
where  S.time_slot_id = T.time_slot_id
and S.year = @year
and S.semester = @semester
and S.CourseID like @CourseID


--exec ClassSearch @CourseID = 'cmpt%', @year = 2023, @semester = 'winter'






