USE [AIDE]
GO

CREATE TRIGGER [dbo].[tr_parse3CToSummary]
ON [dbo].[CONCERN_CAUSE_COUNTERMEASURE]
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
