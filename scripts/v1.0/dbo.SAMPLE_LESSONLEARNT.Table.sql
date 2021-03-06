USE [TriceraDB]
GO
/****** Object:  Trigger [tr_parseLessonToSummary]    Script Date: 6/26/2019 1:14:53 PM ******/
DROP TRIGGER [dbo].[tr_parseLessonToSummary]
GO
ALTER TABLE [dbo].[SAMPLE_LESSONLEARNT] DROP CONSTRAINT [DF__SAMPLE_LE__uploa__15502E78]
GO
/****** Object:  Table [dbo].[SAMPLE_LESSONLEARNT]    Script Date: 6/26/2019 1:14:53 PM ******/
DROP TABLE [dbo].[SAMPLE_LESSONLEARNT]
GO
/****** Object:  Table [dbo].[SAMPLE_LESSONLEARNT]    Script Date: 6/26/2019 1:14:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAMPLE_LESSONLEARNT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[problem] [varchar](100) NULL,
	[solution] [varchar](max) NULL,
	[upload_dt] [smalldatetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[SAMPLE_LESSONLEARNT] ADD  DEFAULT (getdate()) FOR [upload_dt]
GO
/****** Object:  Trigger [dbo].[tr_parseLessonToSummary]    Script Date: 6/26/2019 1:14:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_parseLessonToSummary]
ON [dbo].[SAMPLE_LESSONLEARNT]
AFTER INSERT, UPDATE
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM deleted)
	BEGIN
		DECLARE @newLine varchar(2) = CHAR(13)+CHAR(10)
		INSERT INTO SUMMARY_CI (ref_id, title, [description], category, location)
		SELECT CAST((id + 3000000) as VARCHAR(10)), problem, 
		'Problem: ' + @newLine + problem
		+ @newLine + @newLine +
		'Solution' + @newLine + solution
		, 3, NULL FROM inserted i
	END
END

GO
