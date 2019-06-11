USE [tricera_db]
GO

/****** Object:  Table [dbo].[LESSON_LEARNT]    Script Date: 5/24/2019 10:56:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[LESSON_LEARNT](
	[ll_ref_no] int IDENTITY(1,1) NOT NULL,
	[problem_descr] [varchar](max) NOT NULL,
	[solution_descr] [varchar](max) NOT NULL,
	[owner] [int] NULL,
	[raised_dt] smalldatetime NOT NULL,
	[action_no] int NULL,
	[helpfullness] int NULL,
PRIMARY KEY CLUSTERED 
(
	[ll_ref_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


