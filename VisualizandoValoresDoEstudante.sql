DECLARE @StudentId UNIQUEIDENTIFIER= '20bb5b0a-dba4-4e97-9717-34a342b59278'

SELECT 

[Student].[Name] AS [Student],
[Course].[Title] As [Course],
[StudentCourse].[Progress],
[StudentCourse].LastUpdateDate

FROM

[StudentCourse]
INNER JOIN [Student] ON [StudentCourse].[StudentId]=[Student].[Id]
INNER JOIN [Course] ON [StudentCourse].[CourseId]=[Course].[Id]

WHERE 
[StudentCourse].[StudentId] = @StudentId
    AND 
[StudentCourse].[Progress] <100
    AND
    [StudentCourse].[Progress] >0
    ORDER BY
    [StudentCourse].[LastUpdateDate] ASC