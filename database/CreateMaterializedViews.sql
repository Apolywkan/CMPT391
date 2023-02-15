Create view vWTimeSection
With Schemabinding
as
SELECT S.sec_id, S.time_slot_id, S.CourseID, TS.day, TS.start_time, TS.endtime, S.building, S.room_number, S.semester, S.capacity, S.enrollment FROM dbo.Time_slot as TS, dbo.Section as S WHERE TS.time_slot_id = S.time_slot_id

Create Unique Clustered Index UIX_vWTimeSection_joined
on vWTimeSection(sec_id)