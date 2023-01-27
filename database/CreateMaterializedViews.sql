Create view vWMathCourses
With SchemaBinding
as
SELECT dbo.Course.CourseID from dbo.Course WHERE dbo.Course.CourseID like 'MATH' + '%'

Create Unique Clustered Index UIX_vWMathCourses_CourseID
on dbo.vWMathCourses(CourseID)

Create view vWBusinessCourses
With SchemaBinding
as
SELECT dbo.Course.CourseID from dbo.Course WHERE dbo.Course.CourseID like 'BUSN' + '%'

Create Unique Clustered Index UIX_vWBusinessCourses_CourseID
on dbo.vWBusinessCourses(CourseID)

Create view vWComputerCourses
With SchemaBinding
as
SELECT dbo.Course.CourseID from dbo.Course WHERE dbo.Course.CourseID like 'CMPT' + '%'

Create Unique Clustered Index UIX_vWComputerCourses_CourseID
on dbo.vWComputerCourses(CourseID)