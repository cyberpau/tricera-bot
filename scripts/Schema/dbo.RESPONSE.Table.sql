USE [AIDE]
GO
/****** Object:  Table [dbo].[RESPONSE]    Script Date: 7/5/2019 3:44:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESPONSE]') AND type in (N'U'))
DROP TABLE [dbo].[RESPONSE]
GO
/****** Object:  Table [dbo].[RESPONSE]    Script Date: 7/5/2019 3:44:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESPONSE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RESPONSE](
	[parent_reqid] [int] NOT NULL,
	[seq] [int] NOT NULL,
	[display] [varchar](50) NULL,
	[description] [varchar](255) NULL,
	[next_reqid] [int] NULL,
	[response_display] [varchar](max) NULL,
	[stored_proc] [varchar](255) NULL,
	[response_type] [smallint] NULL,
	[continue_loop] [smallint] NULL,
	[param_value] [varchar](255) NULL,
	[param_name] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
