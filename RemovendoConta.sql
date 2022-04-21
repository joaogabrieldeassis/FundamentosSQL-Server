CREATE OR ALTER PROCEDURE ProgressoDoStudent(
    @ProgressoDoStudent UNIQUEIDENTIFIER
)
AS
SELECT 

[Course].[Title] AS [Course],
[Student].[Name] As [Student],
[StudentCourse].[Progress],
[StudentCourse].LastUpdateDate

FROM

[Course]
LEFT JOIN [StudentCourse] ON [StudentCourse].[CourseId]=[Course].[Id]
LEFT JOIN [Student] ON [StudentCourse].[StudentId]=[Student].[Id]
-- Id do estudante 20bb5b0a-dba4-4e97-9717-34a342b59278