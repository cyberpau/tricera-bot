USE [TriceraDB]
GO
/****** Object:  Trigger [tr_parseDocToSummary]    Script Date: 6/26/2019 1:14:53 PM ******/
DROP TRIGGER [dbo].[tr_parseDocToSummary]
GO
/****** Object:  Table [dbo].[DOCUMENTS]    Script Date: 6/26/2019 1:14:53 PM ******/
DROP TABLE [dbo].[DOCUMENTS]
GO
/****** Object:  Table [dbo].[DOCUMENTS]    Script Date: 6/26/2019 1:14:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DOCUMENTS](
	[refid] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[bulk_content] [varchar](max) NULL,
	[upload_dt] [smalldatetime] NULL,
	[uploader_id] [int] NULL,
	[file_location] [nvarchar](100) NULL,
 CONSTRAINT [PK_DOCUMENTS] PRIMARY KEY CLUSTERED 
(
	[refid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [dbo].[tr_parseDocToSummary]    Script Date: 6/26/2019 1:14:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_parseDocToSummary]
ON [dbo].[DOCUMENTS]
AFTER INSERT, UPDATE
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM deleted)
	BEGIN
		DECLARE @newLine varchar(2) = CHAR(13)+CHAR(10)
		INSERT INTO SUMMARY_CI (ref_id, title, [description], category, location)
		SELECT CAST((refid + 1000000) as VARCHAR(10)), title, 
		'Title: ' + title + @newLine + @newLine + 
		'Content:' + @newLine + bulk_content, 1, 
		file_location FROM inserted i
	END
END
GO
