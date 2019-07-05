USE [TriceraDB]
GO
DELETE FROM [dbo].[SAMPLE_PROJECT]
GO
INSERT [dbo].[SAMPLE_PROJECT] ([id], [project_name], [billability]) VALUES (1, N'Savers', CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[SAMPLE_PROJECT] ([id], [project_name], [billability]) VALUES (2, N'Big Y', CAST(46 AS Decimal(18, 0)))
INSERT [dbo].[SAMPLE_PROJECT] ([id], [project_name], [billability]) VALUES (3, N'Sick Leave', CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[SAMPLE_PROJECT] ([id], [project_name], [billability]) VALUES (4, N'Vacation Leave', CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[SAMPLE_PROJECT] ([id], [project_name], [billability]) VALUES (5, N'Chicos', CAST(30 AS Decimal(18, 0)))
INSERT [dbo].[SAMPLE_PROJECT] ([id], [project_name], [billability]) VALUES (6, N'Netcost', CAST(16 AS Decimal(18, 0)))
