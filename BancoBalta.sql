CREATE DATABASE [Balta]
GO  
USE [Balta]
GO

CREATE TABLE [Student](
    -- abaixo temos o UNIQUEIDENTIFIER que é muito maix complexo que o int, mas ocupa muito mais memoria
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Name] NVARCHAR(120) NOT NULL,
    [Email] NVARCHAR(180) NOT NULL,
    [Document] NVARCHAR(20) NULL,
    [Phone] NVARCHAR(20) NULL,
    [Birthdate] DATETIME NULL,
    [Createdate] DATETIME NOT NULL,
    CONSTRAINT [PK_Student] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [Author](
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Name] NVARCHAR(80) NOT NULL,
    [Title] NVARCHAR(80) NOT NULL,
    [Image] NVARCHAR(1024) NOT NULL,
    [Bio] NVARCHAR(2000) NOT NULL,
    [Url] NVARCHAR(450) NULL,
    [Email] NVARCHAR(160) NOT NULL,
    -- Abaixo temos o tipo do autor e o tinyint que vai de 0 á 255
    [Type] TINYINT NOT NULL,
    CONSTRAINT [PK_Author] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [Career](
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [Summary] NVARCHAR(2000) NOT NULL,
    [Url] NVARCHAR(1024) NOT NULL,
    [DuractionInMinutes] INT NOT NULL,
    [Active] BIT NOT NULL,
    [Featured] BIT NOT NULL,
    [Tags] NVARCHAR(160) NOT NULL,
    CONSTRAINT [PK_Career] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [Category](
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [Url] NVARCHAR(1024) NOT NULL,
    [Summary] NVARCHAR(2000) NOT NULL,
    [Order] INT NOT NULL,
    [Description] TEXT NOT NULL,
    [Featured] BIT NOT NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY ([Id])
);
GO
CREATE TABLE [Course](
    [Id] UNIQUEIDENTIFIER NOT NULL,
    [Tag] NVARCHAR(20) NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [Summary] NVARCHAR(2000) NOT NULL,
    [Url] NVARCHAR(1024) NOT NULL,
    [Level] TINYINT NOT NULL,
    [DuractionInMinutes] INT NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [LastUpdateDate] DATETIME NOT NULL,
    [Active] BIT NOT NULL,
    [Free] BIT NOT NULL,
    [Featured] BIT NOT NULL,
    [AuthorId] UNIQUEIDENTIFIER NOT NULL,
    [CategoryId] UNIQUEIDENTIFIER NOT NULL,
    [Tags] NVARCHAR(160) NOT NULL,
    CONSTRAINT [PK_Course] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Course_Author_Author_Id] FOREIGN KEY ([AuthorId]) REFERENCES [Author] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Course_Category_Category_Id] FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [CareerItem](
    [CareerId] UNIQUEIDENTIFIER NOT NULL,
    [CourseId] UNIQUEIDENTIFIER NOT NULL,
    [Title] NVARCHAR(160) NOT NULL,
    [Description] TEXT NOT NULL,
    [Order] TINYINT NOT NULL,
    CONSTRAINT [PK_CareerItem] PRIMARY KEY ([CourseId],[CareerId]),
    CONSTRAINT [FK_CareerItem_Career_CareerId] FOREIGN KEY (CareerId) REFERENCES [Career] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_CareerItem_Course_CourseId] FOREIGN KEY (CourseId) REFERENCES [Course] ([Id]) ON DELETE NO ACTION
);
GO
CREATE TABLE [StudentCourse](
    [CourseId] UNIQUEIDENTIFIER NOT NULL,
    [StudentId] UNIQUEIDENTIFIER NOT NULL,
    [Progress] TINYINT NOT NULL,
    [Favorite] BIT NOT NULL,
    [StartDate] DATETIME NOT NULL,
    [LastUpdateDate] BIT NOT NULL,
    CONSTRAINT [PK_StudentCourse] PRIMARY KEY ([CourseId], [StudentId]),
    CONSTRAINT [FK_StudentCourse_Course_CourseId] FOREIGN KEY (CourseId) REFERENCES [Course] ([Id]),
    CONSTRAINT [FK_StudentCourse_Student_StudentId] FOREIGN KEY (StudentId) REFERENCES [Student] ([Id])
);
GO
