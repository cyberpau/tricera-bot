USE [TriceraDB]
GO

/****** Object:  Table [dbo].[RESPONSE]    Script Date: 6/18/2019 6:29:28 PM ******/
DROP TABLE [dbo].[RESPONSE]
GO

/****** Object:  Table [dbo].[RESPONSE]    Script Date: 6/18/2019 6:29:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RESPONSE](
	[parent_reqid] [int] NOT NULL,
	[seq] [int] NOT NULL,
	[display] [varchar](50) NULL,
	[description] [varchar](255) NULL,
	[next_reqid] [int] NULL,
	[response_display] [varchar](max) NULL,
	[stored_proc] [varchar](255) NULL,
	[response_type] [smallint] NULL,
	[continue_loop] [smallint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


