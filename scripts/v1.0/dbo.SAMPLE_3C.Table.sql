USE [TriceraDB]
GO
/****** Object:  Trigger [tr_parse3CToSummary]    Script Date: 6/26/2019 1:14:53 PM ******/
DROP TRIGGER [dbo].[tr_parse3CToSummary]
GO
ALTER TABLE [dbo].[SAMPLE_3C] DROP CONSTRAINT [DF__SAMPLE_3C__uploa__173876EA]
GO
/****** Object:  Table [dbo].[SAMPLE_3C]    Script Date: 6/26/2019 1:14:53 PM ******/
DROP TABLE [dbo].[SAMPLE_3C]
GO
/****** Object:  Table [dbo].[SAMPLE_3C]    Script Date: 6/26/2019 1:14:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAMPLE_3C](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[concern] [varchar](100) NULL,
	[cause] [varchar](100) NULL,
	[countermeasure] [varchar](100) NULL,
	[upload_dt] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[SAMPLE_3C] ADD  DEFAULT (getdate()) FOR [upload_dt]
GO
/****** Object:  Trigger [dbo].[tr_parse3CToSummary]    Script Date: 6/26/2019 1:14:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_parse3CToSummary]
ON [dbo].[SAMPLE_3C]
AFTER INSERT, UPDATE
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM deleted)
	BEGIN
		DECLARE @newLine varchar(2) = CHAR(13)+CHAR(10)
		INSERT INTO SUMMARY_CI (ref_id, title, [description], category, location)
		SELECT CAST((id + 2000000) as VARCHAR(10)), concern, 
		'Uploaded Date: ' + CAST(upload_dt as varchar) + @newLine +
		'Concern: ' + @newLine + concern
		+ @newLine + @newLine +
		'Cause' + @newLine + cause
		+ @newLine + @newLine +
		'Countermeasure' + @newLine + countermeasure
		, 2, NULL FROM inserted i
	END
END
GO
