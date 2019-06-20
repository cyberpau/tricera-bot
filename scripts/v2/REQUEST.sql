USE [TriceraDB]
GO

/****** Object:  Table [dbo].[REQUEST]    Script Date: 6/18/2019 6:32:30 PM ******/
DROP TABLE [dbo].[REQUEST]
GO

/****** Object:  Table [dbo].[REQUEST]    Script Date: 6/18/2019 6:32:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[REQUEST](
	[reqid] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
	[init_display] [varchar](max) NULL,
	[stored_proc] [varchar](255) NULL,
	[response_type] [smallint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


