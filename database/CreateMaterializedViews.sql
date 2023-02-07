Create view vWFullCourses
With SchemaBinding
as
SELECT T.SID, S.CourseID, S.sec_id, S.semester, S.year, T.grades, TS.day, TS.start_time, TS.endtime, S.building, S.room_number, S.capacity, S.enrollment from Takes as T, Section as S, Time_slot as TS where T.sec_id = S.sec_id and S.time_slot_id = TS.time_slot_id

Create Unique Clustered Index UIX_vWMFullCourses_joined
on vWFullCourses(sec_id)