USE [TriceraDB]
GO
DELETE FROM [dbo].[SAMPLE_LESSONLEARNT]
GO
SET IDENTITY_INSERT [dbo].[SAMPLE_LESSONLEARNT] ON 

INSERT [dbo].[SAMPLE_LESSONLEARNT] ([id], [problem], [solution], [upload_dt]) VALUES (1, N'Unable to print to network printer', N'Removed and reconnect printer. Re-renter g07 credentials', CAST(N'2019-06-26 14:36:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[SAMPLE_LESSONLEARNT] OFF
