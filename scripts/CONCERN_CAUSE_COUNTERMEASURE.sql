USE [tricera_db]
GO

/****** Object:  Table [dbo].[CONCERN_CAUSE_COUNTERMEASURE]    Script Date: 5/24/2019 11:00:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CONCERN_CAUSE_COUNTERMEASURE](
	[ccc_ref_no] [int] IDENTITY(1,1) NOT NULL,
	[concern_descr] [varchar](max) NOT NULL,
	[cause_descr] [varchar](max) NOT NULL,
	[countermeasure_descr] [varchar](max) NOT NULL,
	[owner] [varchar](10) NULL,
	[due_dt] smalldatetime NULL,
	[status] [int] NOT NULL,
	[helpfulness] [int] NOT NULL,
 CONSTRAINT [PK__CONCERN___C30DEE1C9090033F] PRIMARY KEY CLUSTERED 
(
	[ccc_ref_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
