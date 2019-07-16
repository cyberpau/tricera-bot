USE [AIDE]
GO

-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Paulo Mataac
-- Create date: 7/15/2019
-- Description: @type = {
--						 'LL' for Lesson Learn,
--						 'C' for Concern / Cause / Countermeasure,
--						 'DOC' for Reference Documents
--						}
--				@isNew = 0, get LAST reference number
--				@isNew = 1, get NEW reference number
-- =============================================
-- DROP FUNCTION dbo.fn_getNewRefNo
CREATE FUNCTION dbo.fn_getNewRefNo
(
	@type varchar(5),
	@isNew int = 0 

)
RETURNS varchar(20)
AS
BEGIN
	DECLARE @refno varchar(20)

	IF (@type = 'LL')
		SELECT @refno = 'LL'+ CAST(COUNT(1) + @isNew as varchar) + '-' + CONVERT(varchar, getdate(), 1)
		FROM LESSON_LEARNT
	ELSE IF (@type = 'C')
		SELECT @refno = 'C' + CAST(count(1) + @isNew as varchar) + '-' + CONVERT(varchar, getdate(), 1)
		FROM CONCERN_CAUSE_COUNTERMEASURE
		WHERE DATE_RAISED = GETDATE()
	ELSE IF (@type = 'DOC')
		SELECT @refno = 'DOC' + CAST(count(1) + @isNew as varchar)  + '-' + CONVERT(varchar, getdate(), 1)
		FROM DOCUMENTS
		WHERE upload_dt = GETDATE()
	ELSE IF (@type = 'SEQ')
		SELECT @refno = (count(1) + 10)*-1 FROM RESPONSE WHERE parent_reqid = 10

	-- Return the result of the function
	RETURN @refno

END
GO

