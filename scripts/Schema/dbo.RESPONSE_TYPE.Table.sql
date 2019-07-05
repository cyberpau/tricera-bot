USE [TriceraDB]
GO
/****** Object:  Table [dbo].[RESPONSE_TYPE]    Script Date: 7/5/2019 3:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESPONSE_TYPE]') AND type in (N'U'))
DROP TABLE [dbo].[RESPONSE_TYPE]
GO
/****** Object:  Table [dbo].[RESPONSE_TYPE]    Script Date: 7/5/2019 3:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESPONSE_TYPE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RESPONSE_TYPE](
	[response_type] [smallint] NOT NULL,
	[description] [nchar](30) NOT NULL,
 CONSTRAINT [PK_RESPONSE_TYPE] PRIMARY KEY CLUSTERED 
(
	[response_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
