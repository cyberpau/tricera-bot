USE [TriceraDB]
GO
/****** Object:  Table [dbo].[REQUEST]    Script Date: 7/5/2019 3:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REQUEST]') AND type in (N'U'))
DROP TABLE [dbo].[REQUEST]
GO
/****** Object:  Table [dbo].[REQUEST]    Script Date: 7/5/2019 3:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REQUEST]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[REQUEST](
	[reqid] [int] NOT NULL,
	[seq] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
	[init_display] [varchar](max) NULL,
	[stored_proc] [varchar](255) NULL,
	[response_type] [smallint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
