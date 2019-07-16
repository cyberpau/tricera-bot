USE [AIDE]
GO
/****** Object:  Trigger [dbo].[tr_parseDocToSummary]    Script Date: 7/16/2019 1:21:47 PM ******/
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
