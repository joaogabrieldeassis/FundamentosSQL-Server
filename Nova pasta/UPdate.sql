SELECT * FROM [Categoria]

BEGIN TRANSACTION

UPDATE 
    [Categoria]
SET 
    [NAME] = 'Full Stack'
WHERE 
    [ID] = 2
COMMIT