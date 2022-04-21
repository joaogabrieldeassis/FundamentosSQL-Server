CREATE OR ALTER VIEW vwContagemDosCursos AS
SELECT TOP 100
[Categoria].[ID],
[Categoria].[NAME],
COUNT([Curso].[CATEGORIAID]) AS [Cursos]

FROM [Categoria]

INNER JOIN[Curso] ON [Curso].[CATEGORIAID] = [Categoria].[ID]
GROUP BY 
[Categoria].[ID],
[Categoria].[NAME],
[Curso].[CATEGORIAID]
HAVING
COUNT([Curso].[CATEGORIAID]) > 1

