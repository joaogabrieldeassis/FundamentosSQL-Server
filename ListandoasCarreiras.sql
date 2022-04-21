CREATE OR ALTER VIEW ListandoCarreiras AS
SELECT 
    [Id],
    [Title],
    [Url],
    (SELECT COUNT([CareerId])FROM [CareerItem] WHERE [CareerId]=[Id]) AS [Courses]
FROM 
[Career] 
