USE [TriceraDB]
GO
/****** Object:  Table [dbo].[REQUEST]    Script Date: 6/26/2019 1:14:53 PM ******/
DROP TABLE [dbo].[REQUEST]
GO
/****** Object:  Table [dbo].[REQUEST]    Script Date: 6/26/2019 1:14:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REQUEST](
	[reqid] [int] NOT NULL,
	[seq] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
	[init_display] [varchar](max) NULL,
	[stored_proc] [varchar](255) NULL,
	[response_type] [smallint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (1, 0, N'Welcome', N'Hello Human!, my name is Tri-C.E.R.A. and I''m an awesome chatbot. ', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (1, 1, N'Ask username', N'What''s your name?', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (2, 0, N'Initial', NULL, NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (200, 0, N'Get search input', N'Sure! Give me some keywords so I can check it in my 3C database.', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (201, 0, N'Display search results', NULL, NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (300, 0, N'Describe problem', N'What problem did you encountered?', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (301, 0, N'Describe solution', N'What solution did you used to resolve the issue?', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (900, 0, N'Completed submitting a Lesson Learn', NULL, NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (500, 0, N'Upload reference document', NULL, NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (0, 0, N'Error Handler', N'Ooops... There was an error in my algorithm. Please give me time to learn new things and functionalities. ', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (202, 0, N'Choices', N'How about this?', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (3, 0, N'Others', N'Here are some new features added by other developers', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (4, 0, N'Add new files / lesson learnt / 3C', N'Great! Your contributions will become the building blocks of my brain. Please choose your desired action.', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (400, 0, N'Get value of concern', N'What was your concern?', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (401, 0, N'Get value of cause', N'What is the root cause of the problem?', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (402, 0, N'Get value of countermeasure', N'What countermeasure would others do to prevent it?', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (10, 0, N'This contains the custom reports', N'Pick a report you want to display', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (5, 0, N'Create new Report', N'Input the name of the report', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (50, 0, N'Get report description', N'Describe the report (for audit purposes)', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (51, 0, N'Get report script', N'Input the T-SQL query you want to execute', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (52, 0, N'Get response type', N'Input the response type. Currently I don''t know these so please ask your admin.', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (53, 0, N'', N'', NULL, NULL)
