USE [tricera_db]
GO

/****** Object:  View [dbo].[vw_Everything]    Script Date: 6/11/2019 6:49:29 PM ******/
DROP VIEW [dbo].[vw_Everything]
GO

/****** Object:  View [dbo].[vw_Everything]    Script Date: 6/11/2019 6:49:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_Everything]
	WITH SCHEMABINDING
AS


	SELECT 
		'LSN-' + CONVERT(varchar(10),ll_ref_no) as Ref, 
		'Problem: ' + problem_descr + 
		'Solution: ' + solution_descr 
		AS Results FROM dbo.LESSON_LEARNT
	UNION ALL
	SELECT 'DOC-' + CONVERT(varchar(10), doc_ref) as Ref, 
		'Title: ' + title 
		AS Results FROM dbo.DOCUMENTS
	UNION ALL
	SELECT 'CCC-' + CONVERT(varchar(10), ccc_ref_no) as Ref, 
		'Concern: ' + concern_descr + 
		'Cause: ' + cause_descr + 
		'Countermeasure: ' + countermeasure_descr 
		AS Results FROM dbo.CONCERN_CAUSE_COUNTERMEASURE
GO


