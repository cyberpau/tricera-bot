USE [TriceraDB]
GO
/****** Object:  Table [dbo].[RESPONSE_TYPE]    Script Date: 6/26/2019 1:14:53 PM ******/
DROP TABLE [dbo].[RESPONSE_TYPE]
GO
/****** Object:  Table [dbo].[RESPONSE_TYPE]    Script Date: 6/26/2019 1:14:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESPONSE_TYPE](
	[response_type] [smallint] NOT NULL,
	[description] [nchar](30) NOT NULL,
 CONSTRAINT [PK_RESPONSE_TYPE] PRIMARY KEY CLUSTERED 
(
	[response_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (0, N'SINGLE_STRING                 ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (1, N'STRING_COL1                   ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (2, N'STRING_COL2                   ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (3, N'STRING_COL3                   ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (4, N'STRING_COL4                   ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (5, N'STRING_COL5                   ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (7, N'PIE_COL2                      ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (8, N'DONUT_COL2                    ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (9, N'LINE_COL2                     ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (12, N'VBAR_COL2                     ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (13, N'VBAR_COL3                     ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (14, N'VBAR_COL4                     ')
