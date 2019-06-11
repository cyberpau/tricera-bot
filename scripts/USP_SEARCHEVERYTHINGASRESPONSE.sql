USE [tricera_db]
GO

/****** Object:  StoredProcedure [dbo].[usp_searchEverythingAsResponse]    Script Date: 6/11/2019 6:48:12 PM ******/
DROP PROCEDURE [dbo].[usp_searchEverythingAsResponse]
GO

/****** Object:  StoredProcedure [dbo].[usp_searchEverythingAsResponse]    Script Date: 6/11/2019 6:48:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_searchEverythingAsResponse]
	@request	varchar(30),
	@sequence	smallint

AS
BEGIN
	SELECT 'Hello' as Response FROM (
		SELECT ROW_NUMBER() OVER (ORDER BY RANK DESC) AS rn, * 
		FROM freetexttable(dbo.LESSON_LEARNT , (problem_descr, solution_descr), @request , 5) as T
			inner join dbo.LESSON_LEARNT as LL on T.[KEY] = LL.ll_ref_no 
		) AS RESULTS
	WHERE rn = @sequence
END
GO


