USE [TriceraDB]
GO
/****** Object:  FullTextCatalog [TRICERA_SEARCH]    Script Date: 7/5/2019 3:44:13 PM ******/
GO
IF  EXISTS (SELECT * FROM sysfulltextcatalogs ftc WHERE ftc.name = N'TRICERA_SEARCH')
DROP FULLTEXT CATALOG [TRICERA_SEARCH]
GO
/****** Object:  FullTextCatalog [TRICERA_SEARCH]    Script Date: 7/5/2019 3:44:13 PM ******/
IF NOT EXISTS (SELECT * FROM sysfulltextcatalogs ftc WHERE ftc.name = N'TRICERA_SEARCH')
CREATE FULLTEXT CATALOG [TRICERA_SEARCH]WITH ACCENT_SENSITIVITY = ON

GO
