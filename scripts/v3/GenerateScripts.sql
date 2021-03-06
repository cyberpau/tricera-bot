USE [master]
GO
/****** Object:  Database [TriceraDB]    Script Date: 6/24/2019 1:35:00 AM ******/
CREATE DATABASE [TriceraDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TriceraDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TriceraDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TriceraDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TriceraDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TriceraDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TriceraDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TriceraDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TriceraDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TriceraDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TriceraDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TriceraDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TriceraDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TriceraDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TriceraDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TriceraDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TriceraDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TriceraDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TriceraDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TriceraDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TriceraDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TriceraDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TriceraDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TriceraDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TriceraDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TriceraDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TriceraDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TriceraDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TriceraDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TriceraDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TriceraDB] SET  MULTI_USER 
GO
ALTER DATABASE [TriceraDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TriceraDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TriceraDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TriceraDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TriceraDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TriceraDB]
GO
/****** Object:  Table [dbo].[DOCUMENTS]    Script Date: 6/24/2019 1:35:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DOCUMENTS](
	[refid] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[bulk_content] [varchar](max) NULL,
	[upload_dt] [smalldatetime] NULL,
	[uploader_id] [int] NULL,
	[file_location] [nvarchar](100) NULL,
 CONSTRAINT [PK_DOCUMENTS] PRIMARY KEY CLUSTERED 
(
	[refid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REQUEST]    Script Date: 6/24/2019 1:35:00 AM ******/
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
/****** Object:  Table [dbo].[RESPONSE]    Script Date: 6/24/2019 1:35:00 AM ******/
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
/****** Object:  Table [dbo].[RESPONSE_TYPE]    Script Date: 6/24/2019 1:35:00 AM ******/
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
/****** Object:  Table [dbo].[SAMPLE_LESSONLEARNT]    Script Date: 6/24/2019 1:35:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAMPLE_LESSONLEARNT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[problem] [varchar](100) NULL,
	[solution] [varchar](max) NULL,
	[upload_dt] [smalldatetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DOCUMENTS] ON 

INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (1, N'Overtime Authorization Guide', N'GUIDELINES			
			
1	All overtime requests will be through the accomplishment of the Overtime Authorization Form (OTA)		
2	All overtime requests shall be Planned and Approved prior to rendering the overtime work		
3	Indicate whether the Planned OT  hours is billable or non-billable		
4	Indicate the OT Code corresponding to actual rendered overtime based on the table indicated in the OT Form.   		
5	Employee must signed the form.		
6	Designated approvers for both planned and actual overtime requests as follows :		
			
	Type of Projects	Approvers	
	Billable Projects	Line of Service (LoS)  Head or Designated Approvers	
	Non-billable Projects	Operations Manager/LoS Head and GDC Head	
	Functional Work	Functional Head and GDC Head	
			
7	"Requesting employee should submit the OTA Form (hard copy) to Manager for approval and its excel format to Manager, Billing Advise Coordinator and fpi.bpo@ph.fujitsu.com 

"		
8	Manager routes approved billable OT  to BPO for billing verification		
			
	Coverage	Submission to BPO	
	1st day to the last day of the month	5th day of the following month	
			
	Only completely approved,  finance verified OTA forms and with affixed employee signature will be processed at the end of the following month payroll.		
			
9	Any OTA submitted after the prescribed cut-off period must be accompanied by an approved memo from the Line of Service Head/ GDC Head of the circumstances behind the submission of OTA form 		
			
', CAST(N'2019-06-20 00:00:00' AS SmallDateTime), 1, NULL)
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (2, N'TEST DOCUMENT', N'This is the content', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DOCUMENTS] OFF
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (1, 0, N'Welcome', N'Hello Human!, my name is Tri-C.E.R.A. and I''m an awesome chatbot. ', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (1, 1, N'Ask username', N'What''s your name?', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (2, 0, N'Initial', NULL, NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (200, 0, N'Get search input', N'Sure! Give me some keywords so I can check it in my 3C database.', NULL, NULL)
INSERT [dbo].[REQUEST] ([reqid], [seq], [description], [init_display], [stored_proc], [response_type]) VALUES (201, 0, N'Display search results', N'Check this out!', NULL, NULL)
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
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (1, -1, NULL, N'Get username', 2, N'what can I do for you?', N'', 1, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (2, 1, N'Help me with my Concern', N'Search for anything in all records', 200, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (4, 2, N'Add 3C', N'Add 3C', 400, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (4, 3, N'Add Lesson Learn', N'Add Lesson Learn', 300, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (200, -1, NULL, N'Textbox for Search', 201, NULL, N'SELECT title, bulk_content FROM DOCUMENTS', 2, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (300, -1, NULL, NULL, 301, NULL, NULL, NULL, NULL, NULL, N'problem')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (301, -1, NULL, NULL, 900, N'Thank you for sharing your knowledge. I will share these to others as well.', N' insert into SAMPLE_LESSONLEARNT(problem, solution) values (@problem, @solution); ', NULL, NULL, NULL, N'solution')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (900, 1, N'OK', NULL, 2, N'Is there anything else I can do for you?', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (4, 4, N'Upload a Document', N'Add 3C', 500, N'Great! Uploading a document will drastically increase my knowledge. You can drag and drop the files on the fields below.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (500, -2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (3, 1, N'Fujitsu Prime Members', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (0, 0, N'It''s OK, no worries', NULL, 2, N'For the meantime, please choose another option. ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (2, 2, N'I want to Contribute', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (201, 1, N'Yes, it helped. Thanks!', NULL, 900, N'Great! I''m glad I could be of assistance.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (3, 2, N'Reports', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (400, -1, NULL, N'Textbox for Concern input', 401, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (401, -1, NULL, N'Textbox for Cause', 402, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (402, -1, NULL, N'Textbox for Countermeasure', 900, N'Thank you for raising your concerns.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (201, 2, N'Yes, but I want to improve it', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (201, 3, N'No, continue searching', NULL, 202, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (202, 1, N'Yes, it helped. Thanks!', NULL, 2, N'Is there anything else I can do for you?', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (202, 2, N'Yes, but I''ll add something', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (202, 3, N'No, continue searching', NULL, 202, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (2, 1, N'Others', N'Display new features here', 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (1, N'STRING_COL1                   ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (2, N'STRING_COL2                   ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (3, N'STRING_COL3                   ')
ALTER TABLE [dbo].[SAMPLE_LESSONLEARNT] ADD  DEFAULT (getdate()) FOR [upload_dt]
GO
USE [master]
GO
ALTER DATABASE [TriceraDB] SET  READ_WRITE 
GO
