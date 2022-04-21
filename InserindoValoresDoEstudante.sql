SELECT * FROM [Course]
SELECT * FROM [Student]
SELECT * FROM [StudentCourse]
SELECT NEWID()
INSERT INTO 
[Student] 
VALUES(
    '20bb5b0a-dba4-4e97-9717-34a342b59278',
    'João Developer',
    'Joao@gmail.com',
    '123464345',
    '1224334',
    NULL,
    GETDATE()
 )
 INSERT INTO
    [StudentCourse]
VALUES (
    '5f5a33f8-4ff3-7e10-cc6e-3fa000000000',
    '20bb5b0a-dba4-4e97-9717-34a342b59278',
    50,
    0,
    GETDATE(),
    GETDATE()
)