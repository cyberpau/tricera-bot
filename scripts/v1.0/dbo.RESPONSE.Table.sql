USE [TriceraDB]
GO
/****** Object:  Table [dbo].[RESPONSE]    Script Date: 6/26/2019 1:14:53 PM ******/
DROP TABLE [dbo].[RESPONSE]
GO
/****** Object:  Table [dbo].[RESPONSE]    Script Date: 6/26/2019 1:14:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[continue_loop] [smallint] NULL,
	[param_value] [varchar](255) NULL,
	[param_name] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (1, -1, NULL, N'Get username', 2, N'what can I do for you?', N'', 1, NULL, NULL, N'@username')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (2, 1, N'Help me with my Concern', N'Search for anything in all records', 200, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (4, 1, N'Add 3C', N'Add 3C', 400, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (4, 2, N'Add Lesson Learn', N'Add Lesson Learn', 300, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (200, -1, NULL, N'Textbox for Search', 201, N'Check this out!', N'select description from freetexttable(SUMMARY_CI, [description], @input, 5) T
	inner join SUMMARY_CI S on T.[key] = S.ref_id', 0, NULL, NULL, N'input')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (300, -1, NULL, N'get value of problem', 301, NULL, NULL, NULL, NULL, NULL, N'problem')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (301, -1, NULL, N'get value of solution', 900, N'Thank you for sharing your knowledge. I will share these to others as well.', N' insert into SAMPLE_LESSONLEARNT(problem, solution) values (@problem, @solution); ', NULL, NULL, NULL, N'solution')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (900, 1, N'OK', NULL, 2, N'Is there anything else I can do for you?', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (4, 3, N'Upload a Document', N'Add 3C', 500, N'You can drag and drop the files on the fields below.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (500, -2, NULL, NULL, 900, N'Awesome! Did you know that uploading a document drastically increases my knowledge? ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (3, 1, N'Fujitsu Prime Members', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (0, 0, N'It''s OK, no worries', NULL, 2, N'For the meantime, please choose another option. ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (2, 2, N'I want to Contribute', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (201, 1, N'Yes, it helped. Thanks!', NULL, 900, N'Great! I''m glad I could be of assistance.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (3, 2, N'Reports', NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (400, -1, NULL, N'Textbox for Concern input', 401, NULL, NULL, NULL, NULL, NULL, N'concern')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (401, -1, NULL, N'Textbox for Cause', 402, NULL, NULL, NULL, NULL, NULL, N'cause')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (402, -1, NULL, N'Textbox for Countermeasure', 900, N'Thank you for raising your concerns. It might be a small thing to you, but it can be a big help to others.', N'INSERT INTO [dbo].[SAMPLE_3C] ([concern] ,[cause] ,[countermeasure]) VALUES (@concern ,@cause ,@countermeasure);', NULL, NULL, NULL, N'countermeasure')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (201, 2, N'Yes, but I want to improve it', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (201, 3, N'No, continue searching', NULL, 202, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (202, 1, N'Yes, it helped. Thanks!', NULL, 2, N'Is there anything else I can do for you?', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (202, 2, N'Yes, but I''ll add something', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (202, 3, N'No, continue searching', NULL, 202, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (2, 4, N'Others', N'Display new features here', 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (2, 3, N'Create new report', N'Create new report', 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (5, -1, NULL, N'Get report name', 50, N'', NULL, NULL, NULL, NULL, N'reportName')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (51, -1, NULL, N'Get sql query', 52, N'', NULL, NULL, NULL, NULL, N'query')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (52, -1, NULL, N'Get repsonse type', 900, N'Report successfully created! Try it now!', N'INSERT INTO RESPONSE (parent_reqid, seq, display, [description], next_reqid, stored_proc, response_type) VALUES (10, -3, @reportName, @description, 900, @query, @responseType);', NULL, NULL, NULL, N'responseType')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (50, -1, NULL, N'Get description', 51, N'', NULL, NULL, NULL, NULL, N'description')
