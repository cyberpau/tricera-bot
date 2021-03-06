USE [TriceraDB]
GO
/****** Object:  FullTextIndex     Script Date: 6/26/2019 1:14:53 PM ******/
DROP FULLTEXT INDEX ON [dbo].[SUMMARY_CI]

GO
/****** Object:  Table [dbo].[SUMMARY_CI]    Script Date: 6/26/2019 1:14:53 PM ******/
DROP TABLE [dbo].[SUMMARY_CI]
GO
/****** Object:  Table [dbo].[SUMMARY_CI]    Script Date: 6/26/2019 1:14:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUMMARY_CI](
	[ref_id] [varchar](10) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[category] [int] NOT NULL,
	[location] [varchar](100) NULL,
 CONSTRAINT [PK__SUMMARY] PRIMARY KEY CLUSTERED 
(
	[ref_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  FullTextIndex     Script Date: 6/26/2019 1:14:53 PM ******/
CREATE FULLTEXT INDEX ON [dbo].[SUMMARY_CI](
[description] LANGUAGE 'English', 
[title] LANGUAGE 'English')
KEY INDEX [PK__SUMMARY]ON ([TRICERA_SEARCH], FILEGROUP [PRIMARY])
WITH (CHANGE_TRACKING = AUTO, STOPLIST = SYSTEM)


GO
