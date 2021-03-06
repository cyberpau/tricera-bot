USE [master]
GO
/****** Object:  Database [TriceraDB]    Script Date: 6/25/2019 10:45:31 AM ******/
CREATE DATABASE [TriceraDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TriceraDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TriceraDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TriceraDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TriceraDB_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[DOCUMENTS]    Script Date: 6/25/2019 10:45:32 AM ******/
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
/****** Object:  Table [dbo].[REQUEST]    Script Date: 6/25/2019 10:45:32 AM ******/
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
/****** Object:  Table [dbo].[RESPONSE]    Script Date: 6/25/2019 10:45:32 AM ******/
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
/****** Object:  Table [dbo].[RESPONSE_TYPE]    Script Date: 6/25/2019 10:45:32 AM ******/
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
/****** Object:  Table [dbo].[SAMPLE_3C]    Script Date: 6/25/2019 10:45:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAMPLE_3C](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[concern] [varchar](100) NULL,
	[cause] [varchar](100) NULL,
	[countermeasure] [varchar](100) NULL,
	[upload_dt] [smalldatetime] NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SAMPLE_LESSONLEARNT]    Script Date: 6/25/2019 10:45:32 AM ******/
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
	[upload_dt] [smalldatetime] NULL DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SUMMARY_CI]    Script Date: 6/25/2019 10:45:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUMMARY_CI](
	[ref_id] [int] NOT NULL,
	[title] [varchar](100) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[category] [int] NOT NULL,
	[location] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ref_id] ASC,
	[category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (3, N'CCSProgrammersGuide.txt', N' 
Fujitsu America, Inc.
Corema Context Server (CCS)
CCS Programmer?s Guild
Version 0.1



Copyright ? Fujitsu America, Inc. 2010
All Rights Reserved
This publication is protected by federal copyright law. No part of this publication may be copied or distributed, 
stored in a retrieval system, or translated into any human or computer language in any form or by any means, 
electronic, mechanical, magnetic, manual or otherwise, or disclosed to third parties without the express 
written permission of Fujitsu.
Fujitsu makes no representation or warranty with respect to the contents hereof and specifically disclaims any 
implied warranties of merchantability or fitness for a particular purpose. Further, Fujitsu reserves the right to 
revise this publication and to make changes from time to time in the contents hereof without obligation of 
Fujitsu to notify any person or organization of such revision or changes.
Fujitsu has prepared this manual for use by Fujitsu personnel and authorized third parties as a guide to the 
proper installation, operation and/or maintenance of Fujitsu equipment and software. The drawings and 
specifications contained herein are the property of Fujitsu.
Trademarked names may appear throughout this document. Rather than list the names and entities that own 
the trademarks or insert a trademark symbol with each mention of the trademarked name, the names are 
used only for editorial purposes and to the benefit of the trademark owner with no intention of infringing upon 
that trademark.
Address comments and corrections to:
Fujitsu America, Inc.
1250 East Arques Avenue, M/S 363
P.O. Box 3470
Sunnyvale, CA 94085-3470




REVISION HISTORY

VERSION
DATE
CHANGE DESCRIPTION
NAME
0.1
07/16/2010
Initial Version
Judd Smith







TABLE OF CONTENTS
1.	OVERVIEW	8
2.	ARCHITECTURAL OVERVIEW	11
2.1	SYSTEM ARCHITECTURE	11
2.2	CCS ARCHITECTURE	14
3.	DEVELOPMENT ENVIRONMENT	17
3.1	SYSTEM PREREQUISITES	17
3.2	CCS SOURCE FILE STRUCTURE	17
3.2.1	Pre-2010 Style	17
3.2.2	2010 Style	18
3.3	CCS RUN-TIME STRUCTURE	21
3.3.1	Structure	21
3.3.2	Setup	22
3.4	CONFIGURATION FILES	23
3.4.1	setEnv.cmd	23
3.5	DATABASE	26
3.6	DEVELOPMENT METHODOLOGY	27
3.6.1	Standard Maintenance	27
3.6.2	XSD Maintenance	27
3.6.3	Java Software Maintenance	27
3.6.4	Testing	27
4.	CCS JAVA PACKAGE STRUCTURE	31
5.	SERVLET LISTENERS	36
5.1	GENERIC CLIENT SERVLET	36
5.2	RETURNCENTER GLOBALSTORE SERVLET	36
5.3	SERVLET CLASS FILE STRUCTURE	38
5.4	ADDING A NEW SERVLET	38
6.	REQUEST PROCESSING FLOW	41
7.	CCS DATABASE TABLES	43
7.1	CUSTOMER DATA TABLES	43
7.2	TRANSACTIONDATA TABLES	45
7.2.1	Customer Analytics Based Tables	45
7.2.2	ReturnCENTER Based Tables	46
7.2.3	Transaction Summary Tables	46
7.3	RETURNCENTER DATA TABLES	47
7.4	MISCELLANEOUS DATA TABLES	47
7.5	NEXT ID TABLES	48
7.6	EXTRACT TABLES	48
7.6.1	Accumulative Tables	48
7.6.2	Daily Tables	49
7.7	CONFIGURATION TABLES	49
7.8	MISCELLANEOUS TABLES	52
8.	ADDING / CHANGING A DATABASE TABLE	53
8.1	ADDING A DATABASE TABLE	53
8.1.1	The Complete Database SQL Files	53
8.1.2	The Release Update SQL File	54
8.1.3	The Entity Bean	54
8.2	CHANGING A TABLE WITH ASSOCIATED ENTITY BEAN	55
8.3	CHANGING THE CUSTOMERSEARCH TABLES	56
9.	WINDOWS DATABASE AUTHENTICATION	58
10.	ADDING A CUSTOMER DATA ELEMENT	60
10.1	JAVA FILE ADDITIONS	60
10.2	TABLE ADDITIONS	61
10.3	WHEN THE ELEMENT IS A SECONDARY ID	61
11.	ADDING A REQUEST / RESPONSE PAIR	63
11.1	THE XML SCHEMA	63
11.2	MESSAGETYPELOOKUP TABLE	63
11.3	RESPONSEATTRIBUTES AND MDATTRIBUTES TABLES	63
11.4	TEST CASES	64
11.5	REQUESTHANDLER	64
11.6	RESPONSEBUILDER	64
12.	ADDING AN AUTO GENERATED ID	65
13.	ADDING AN ERROR CODE	66
14.	CCSEXCEPTION PROCESSING	68
15.	SQL STATEMENTS GENERATION	73
16.	CCS BATCH JOBS	74
16.1	BATCH JOB FRAMEWORK	74
16.2	JOB_CONFIG.XML FILE	76
16.3	BATCH FOLDER STRUCTURE	77
16.4	BATCH LOGGING SCHEME	77
16.5	FTP STRUCTURE	78
16.6	TESTING BATCH JOBS	78
17.	CCS DATA EXTRACTION	79
17.1	GENERAL EXTRACTION SCHEME	79
17.2	STANDARD CUSTOMER EXTRACTION	79
17.2.1	Current Customer Extractions	80
17.2.2	Adding A Customer Extraction	81
18.	THE RM / LM INTERFACE	83
18.1	REQUEST PROCESSING	83
18.2	THE INTERFACE SCHEME	83
18.2.1	Updates	83
18.2.2	Read Only	84
18.2.3	Blocked Interface	85
19.	SYSTEM MAINTAINER SCHEME	87
20.	RETURNCENTER TRANSACTION EXTRACT PROCESSING	88
21.	CCS CONFIGURATION	91
22.	CCS LOGGING	92
22.1	REQUEST / RESPONSE LOGGING	92
22.2	TRACE LOGGING	92
22.3	CCS / LM LOGGING	93
22.4	GCS LOGGING	93
22.5	RCGSS LOGGING	93
23.	INTERNATIONALIZATION	94
24.	JAVA CODING CONVENTIONS	96
25.	JUNIT TESTING INTEGRATION	98
25.1	JUNIT TEST CLASS FILES STRUCTURE	98
25.2	JUNIT TEST FILES STRUCTURE	100
25.3	RUNNING JUNIT TESTS	100
26.	APPENDIX A ? ECLIPSE	102
26.1	ECLIPSE SETTINGS	102
26.1.1	Error/Warnings	103
26.1.2	Javadoc	108
26.1.3	Code Style / Code Templates	109
26.1.4	Eclipse Project Setup	111
27.	APPENDIX B ? DEBUG SETUP	113
28.	APPENDIX C ? CCS DOCUMENTS	115
29.	APPENDIX D ? USEFUL BATCH / COMMAND FILES	117
29.1	DOMAIN FILES	117
29.1.1	startSplitCCS	117
29.1.2	stopCCS	118
29.2	PERSONAL FILES	119
29.2.1	CCSV4	119
29.2.2	Build91	123
29.2.3	Test91	123
29.2.4	Server91	123
30.	APPENDIX E ? CUSTOMER IDS	124
31.	APPENDIX F ? CCS IDIOSYNCRASIES	125
31.1	XML PARSING	125
31.2	STARTUP PROBLEM	125
31.3	PROBLEM AFTER RESTART	125
32.	APPENDIX G ? TLOG FILE PROCESSING	126
33.	APPENDIX H ? BUILDING CCS	127
33.1	THE CCS FORMAL BUILD	127
33.2	THE CCS INFORMAL BUILD	127
34.	APPENDIX I ?CONFIGURATION FOR STORECENTER	129
35.	APPENDIX J ? GLOBALSTORE CONFIGURATIONS	130
35.1	GLOBALSTORE / CCS CONFIGURATION	130
35.1.1	Relationship Manager Interface	130
35.1.2	ReturnCENTER  Interface	130
35.2	GLOBALSTORE / CSA CONFIGURATION	131
35.3	GLOBALSTORE / LOYALTY MANAGER CONFIGURATION	131
36.	APPENDIX K ? REDESIGN OPPORTUNITIES	133
36.1	RETURNCENTER SETRESERVE REQUEST	133
36.2	BASE / APPLICATION DIVISION	133
36.2.1	CustomerElement Files	133
36.2.2	SQL Statement Files	134
36.3	CCSEXCEPTION	134
36.4	JUNIT TEST FILES	134
36.5	CLONING CUSTOMERELEMENT OBJECTS	134
36.6	TRANSACTION OBJECTS	135



1.	OVERVIEW
The Corema Context Server (CCS) is a J2EE application that provides two major functional responsibilities 
within the Fujitsu Retail Suite (FRS):
1.	As the engine of the CustomerCENTER Relationship Manager product, it does the following:
a.	It encapsulates a retailer?s customer database and supports customer based requests from various 
client applications (e.g., GlobalSTORE, CSA, web sites).  
b.	It provides a real-time interface with CustomerCENTER Loyalty Manager and a batch interface with 
CustomerCENTER Analytics Manager.
c.	It provides a comprehensive set of batch jobs.
2.	As the engine of ReturnCENTER:
a.	It encapsulates a retailer?s transaction database and supports transaction based requests from 
GlobalSTORE.
b.	It provides a comprehensive set of batch jobs, including the import of GlobalSTORE TLog files.
This document provides the information required to maintain the base CCS and all its customer versions.  
This document does not include any discussion of the Customer Service Application (CSA), the web based 
component of CustomerCENTER Relationship Manager and ReturnCENTER.
The table below describes the organization of this document and provides a direct link to the various sections 
of the document.

Section #
Section Title
Section Description
2
Architectural Overview
This section describes the technical aspects of the CCS 
functionality.
3
Development Environment
This section describes the developer?s required 
environment and its setup.
4
CCS Java Package Structure
This section describes the package organization of the 
CCS Java files.
5
Servlet Listeners
This section describes the Servlet listeners.
6
Request Processing Flow
This section describes the request processing flow.
7
CCS Database Tables
This section describes how CCS uses its database tables 
to provide its functionality.
8
Adding / Changing A Database 
Table
This section describes adding a database table.
9
Windows Database 
Authentication
This section describes Windows Authentication.
10
Adding A Customer Data 
Element
This section describes adding a customer data element.
11
Adding A Request / Response 
Pair
This section describes adding a request / response pair.
12
Adding An Auto Generated ID
This section describes adding an auto generated ID.
13
Adding An Error Code
This section describes adding an error code.
14
CCSException Processing
This section describes the use of the CCSException 
object.
15
SQL Statements Generation
This section describes how the SQL statements 
generation is done.
16
CCS Batch Jobs
This section describes how the batch jobs work.
17
CCS Data Extraction
This section describes how the extracts work.
18
The RM / LM Interface
This section describes the RM / LM interface.
19
System Maintainer Scheme
This section describes how the system maintainers work.
20
ReturnCENTER Transaction 
Extract Processing
This section describes how the rctransaction extracts 
work.
21
CCS Configuration
This section describes CCS configuration.
22
CCS Logging
This section describes the CCS logging.
23
Internationalization
This section describes the internationalization facilities.
24
Java Coding Conventions
This section describes the CCS coding conventions.
25
JUnit Testing Integration
This section describes the integration of JUnit testing.
26
Appendix A ? Eclipse 
This section describes the Eclipse settings and setups.
27
Appendix B ? Debug Setup

This section describes how to set up CCS real time 
debugging.
28
Appendix C ? CCS Documents
This section lists all the document files that may need 
updating whenever a change is made to CCS.
29
Appendix D ? Useful Batch / 
Command Files
This section contains some useful batch / command files 
that are not published as part of CCS.
30
Appendix E ? Customer IDs
This section describes the various CCS customer IDs.
31
Appendix F ? CCS 
Idiosyncrasies
This section describes CCS Idiosyncrasies.
32
Appendix G ? TLog File 
Processing
This section describes the TLog files that CCS processes.
33
Appendix H ? Building CCS
This section describes the building CCS processes.
34
Appendix I ?Configuration For 
StoreCENTER
This section describes the configuration required for 
Store CENTER.
35
Appendix J ? GlobalSTORE 
Configurations
This section describes how to configure GlobalSTORE to 
interface with CCS.
36
Appendix K ? Redesign 
Opportunities
This section describes the known design flaws and 
suggestions for redesign.








2.	ARCHITECTURAL OVERVIEW
This section describes the CCS role in the enterprise system architecture and the detailed CCS architecture.
2.1	System Architecture
CCS is the major component in the CustomerCENTER Relationship Manager and the ReturnCENTER 
products shown in this diagram.
 
Figure 1: System Architecture

In this diagram, CCS, as the main component of CustomerCENTER Relationship Manager, is shown doing 
the following:
1.	Servicing client applications (POS and CSA) in real time:
a.	Real-time customer lookups ? providing customer profile data to the client application.
b.	Real-time transaction lookups ? providing customer based transaction data to the client application.
c.	Real-time customer updates ? providing the client application the ability to update a customer?s profile 
data.
2.	Servicing an interface with Loyalty Manager:
a.	Real-time customer updates ? all customer updates are communicated to Loyalty Manager.  This 
may include segment changes and offer progress adjustments.
3.	Servicing a batch interface with StoreCENTER:
a.	Transaction importing ? GlobalSTORE TLog files are imported into CCS by a batch job.  The TLog 
files are moved into the CCS domain by StoreCENTER.
In this diagram, CCS, as the main component of ReturnCENTER, is shown doing the following:
1.	Servicing the POS client application in real time:
a.	Real-time transaction lookups ? providing original transaction data to POS during a return transaction.
b.	Real-time transaction updates ? providing the client application the ability to update original 
transaction data with the results of a return transaction.  Note:  the original transaction data is not 
changed; instead, transaction adjustment data is added.  Subsequently, the original transaction data 
is combined with the adjustment data to form the current view of the transaction.
2.	Servicing a batch interface with StoreCENTER:
a.	Transaction importing ? GlobalSTORE TLog files are imported into CCS by a batch job.  The TLog 
files are moved into the CCS domain by StoreCENTER.
Note that there can be many variations on how these components are packaged physically.  CCS does not 
restrict its packaging, it can reside on any number of servers in a production environment ? the retailer will be 
responsible for front ending them with a load-balancer type appliance.  Normally, but it?s not mandatory, only 
one server is used for batch jobs.  Whether that server is also used for real-time processing is the retailer?s 
choice.


2.2	CCS Architecture
CCS is a J2EE application that operates on and with the following platform components:
1.	Windows Server ? it runs on Windows Server 2003, 2008 and 2008 R2.  Those are the production server 
systems.  It can run on any Windows system starting with Windows XP and anything later than that.
2.	J2EE 5.  This includes the Sun Application Server ? aka Glassfish (any version).  We currently use the 
J2EE 5 version of Glassfish, V2.1.1.
3.	SQL Server ? it is compatible with SQL Server 2000, 2005 and 2008.  
4.	Microsoft JDBC driver ? it is compatible with versions 1.2 and 2.0.
CCS can be thought of as having two separate components:
1.	The CCS engine ? this is considered a domain running within the Glassfish application server (the 
domain name is CCSV4).  
2.	The CCS batch jobs ? these are either stand-alone jobs or client applications to the CCS engine.
When we talk about CCS, we are normally talking about the CCS engine component.  


Here?s a representation of the CCS engine component breakdown.
 
Figure 2: CCS Architecture
Starting from the left in the diagram, we have the following components:
1.	Client Applications ? these are not part of CCS, but actual clients like POS, CSA and batch jobs.
2.	HTTP Listeners ? this is the start of CCS.  Client applications access CCS through one of two HTTP 
listeners:
a.	RCGSS (ReturnCenterGlobalStoreServlet) ? this listener services ReturnCENTER requests.  
b.	GCS (GenericClientServlet) ? this listener services Relationship Manager requests.  
3.	CCS Session Bean ? all requests come through this entry point.  This component fulfills the J2EE 
requirements for a session bean.
4.	CCS POJO?s (Plain Old Java Objects) ? this is the business object layer of the CCS.
5.	CCS Entity Beans ? this is the Java Data Objects layer of the software providing a non-JDBC link to the 
database.  Early on, most accesses to the database used this methodology, but it has grown out of favor 
and more and more the CCS uses direct JDBC approach to the database.
6.	CCS Session Beans ? there are two session beans that are used by the CCS session bean and no other 
software:
a.	CCSNextIDs ? this session bean encapsulates the automatic generation of IDs used in the 
processing of customer data (e.g., Loyalty ID).
b.	CCSMetrics ? this session bean encapsulates the recording of system metrics.
7.	Database ? this is not a part of CCS but is a standard data repository.  








3.	DEVELOPMENT ENVIRONMENT
3.1	System Prerequisites
The following system components are required:
1.	Windows XP or later.
2.	SQL Server 2005 or 2008 (2008 recommended).
3.	Microsoft JDBC driver ? version 2.
4.	Java 5 or later.
5.	J2EE 5 containing Sun Application Server (Glassfish) Version 2.1.1.
6.	Eclipse Version 3.2.1 or later.
7.	CustomerCENTER Loyalty Manager (latest version).
The installation of these components changes regularly and is outside the scope of this document.  However, 
the following principles apply:
1.	Install Java in the \Programs\Java folder on the d drive if the d drive is available.
2.	Install the Sun Application Server in the \Programs\Sun\AppServers_91 folder on the d drive if the d drive 
is available.
3.	After installation of Eclipse, check here ? Section 26.1, Eclipse Settings ? for the settings that should be 
applied.
3.2	CCS Source File Structure
The project files are organized in two different ways:
1.	Pre-2010 style.
2.	2010 and later style.
3.2.1	Pre-2010 Style
The original structure style was used before FRS 4.1 and is now considered the legacy structure.  It included 
the following customers:
1.	Danier.
2.	Godiva.
3.	Dressbarn / Maurices.
4.	Radio Shack.
5.	Payless.
6.	David?s Bridal.
The source files are downloaded from PVCS into the \Projects as follows:
1.	CCSV4 for the base software.
2.	CCSV4-xxx (where xxx is the customer designation) for the customer software.
Note:  the customer software is the base software plus the customer variants.  Therefore, to populate a 
customer structure, first the base software is downloaded from PVCS into the CCSV4-xxx structure, then the 
customer version is downloaded into that same structure. 
The PVCS structure is identical to the software on the development computer.  The download is done as 
follows:
1.	The base software is downloaded from the RelationshipMgrLegacy database, the CCS / CCSV4 folder.
2.	The customer software is downloaded from the CustomersLegacy database, the xxx / CCS / CCSV4-xxx 
folder, where xxx is the customer designation.
One additional file is required.  Get the client.jar file for the version of Loyalty Manager on the system and 
then move it to \Projects\CCSV4-xxx\Server\lib\common folder and rename it to CoremaLoyaltyClient.jar.
3.2.2	2010 Style
We changed to a different structure in 2010, starting with FRS 4.1.  It includes the following customers:
1.	Shopko.
2.	All future customers.
The source files are downloaded from PVCS into \Projects as follows:
1.	CCSV4-2010 for the base software.
2.	CCSV4-xxx (where xxx is the customer designation) for the customer software.
Note:  the customer software is the base software plus the customer variants.  Therefore, to populate a 
customer structure, first the base software is downloaded from PVCS, then the customer version. 
The PVCS structure is no longer identical to the software on the development computer.  There are now four 
PVCS databases storing the various components of CCS and CSA.  These databases are organized based 
on build requirements.  The databases are the following:
1.	CoreContextServer ? this database is used to build the following packages:
a.	Batch ? the python based batch control system.
b.	CCSV4 EAR ? the CCS application.
c.	CSAV4 EAR ? the CSA application.
2.	BaseContextServer ? this database contains all the common files for the Relationship Manager / 
ReturnCENTER combination.
a.	Batch ? the CCS batch package.
b.	Database ? the Database package.
c.	Server ? the Server package.
d.	Screens ? the CSA and RCCSA screens package.
e.	RCReports ? the ReturnCENTER reports package.
3.	RelationshipManager46 ? this database contains all the files that make a Relationship Manager only 
product.
a.	Batch ? the CCS batch package.
b.	Database ? the Database package.
c.	Server ? the Server package.
d.	Screens ? the CSA screens package.
4.	ReturnCenter20 ? this database contains all the files that make a ReturnCENTER only product.
a.	Batch ? the CCS batch package.
b.	Database ? the Database package.
c.	Server ? the Server package.
d.	Screens ? the RCCSA screens package.
e.	RCReports ? the ReturnCENTER reports package.
The download is done as follows:
1.	Download the base software:
a.	Download from the CoreContextServer database:
i.	Download from Source / CCSV4 to \Projects\CCSV4-xxx where xxx is the customer designation 
(or 2010 for the base only version).
b.	Download from the BaseContextServer database:
i.	Download from Source / CCSV4 / to \Projects\CCSV4-xxx where xxx is the customer designation 
(or 2010 for the base only version).
ii.	Download from Source / Database to \Projects\CCSV4-xxx\Database where xxx is the customer 
designation (or 2010 for the base only version).  Note:  the \Projects\CCSV4-xxx\Database folder 
may have to be created manually.
iii.	Download from Source / Server to \Projects\CCSV4-xxx\Server where xxx is the customer 
designation (or 2010 for the base only version).
c.	Only if it is a Relationship Manager only customer, download from the RelationshipManager46 
database:
i.	Download from Source / CCSV4 / all folders to \Projects\CCSV4-xxx where xxx is the customer 
designation (or 2010 for the base only version).
ii.	Download from Source / Database to \Projects\CCSV4-xxx where xxx is the customer 
designation (or 2010 for the base only version).
iii.	Download from Source / Server / all folders and files to \Projects\CCSV4-xxx/Server where xxx is 
the customer designation (or 2010 for the base only version).
d.	Only if it is a ReturnCENTER only customer, download from the ReturnCenter20 database:
i.	Download from Source / CCSV4 / all folders to \Projects\CCSV4-xxx where xxx is the customer 
designation (or 2010 for the base only version).
ii.	Download from Source / Database to \Projects\CCSV4-xxx where xxx is the customer 
designation (or 2010 for the base only version).
iii.	Download from Source / Server / all folders and files to \Projects\CCSV4-xxx/Server where xxx is 
the customer designation (or 2010 for the base only version).
2.	The customer software is downloaded from the Customer database in the same manner as the base 
software and to the same location (overriding or adding to the files from the base software) ? except that 
the files are organized in folders under the customer database instead of separate databases:
a.	CoreContextServer folder has the same structure as the base software CoreContextServer database.
b.	BaseContextServer folder has the same structure as the base software BaseContextServer 
database.
c.	RelationshipManager46 folder has the same structure as the base software RelationshipManager46 
database.
d.	ReturnCenter20 folder has the same structure as the base software ReturnCenter20 database.
One additional file is required.  Get the client.jar file for the version of Loyalty Manager on the system and 
then move it to \Projects\CCSV4-xxx\Server\lib\common folder and rename it to CoremaLoyaltyClient.jar.
3.3	CCS Run-Time Structure
This section discusses the structure and setup of the run-time structure for testing.  The structure discussed 
here supports the ability to test multiple versions on a single developer?s system without the requirement for 
VM?s.
3.3.1	Structure
The high-level structure is the same as in a production environment:
Programs
	AppServers_91
		Domains
Under that, there will be one domain for each version, e.g.:
			CCSV4-2010
			CCSV4-Shopko
One additional folder must be added under programs:
Programs
	jlib
Move the sqljdbc.jar file from the Microsoft JDBC driver ? version 2 installation (see section 3.1) into this jlib 
folder.
3.3.2	Setup
This section describes how to set up a domain.  For example purposes, we?ll use the CCSV4-2010 domain.  
These are the steps:
1.	Get the latest Server package for the type of domain.  For example, the CCSV4-2010 is a base domain, 
so get the latest base Server package.
2.	Unzip the package into a temporary folder.
3.	Modify the setEnv.cmd file in the CCSFiles folder.  Modify it based on the example in the next section 
(see the highlighted portions).
4.	Make sure there are no other CCS or CSA services running on the computer.  If any are running, stop 
them.
5.	Start a DOS session with the current directory set to the CCSFiles folder.
6.	Enter and run this command ? create-CCS-domain x where x is the drive letter that contains the run-time 
structure.
7.	Add the following files:
a.	Add the startSplitCCS.cmd file ? see section 29.1.1 to the domain root folder (e.g., CCSV4-2010).
b.	Add the stopCCS.cmd file ? see section 29.1.2 to the domain root folder (e.g., CCSV4-2010).
c.	Add the CoremaLoyaltyClient.jar file described in the last paragraph in section 3.2.2 to the lib folder 
(e.g., CCSV4-2010\lib).
d.	Add the sqljdbc.jar file from the Microsoft JDBC driver ? version 2 installation (see section 3.1) to the 
lib folder (e.g., CCSV4-2010\lib).
e.	The tests folder needs folders and files added to it.  These are unpublished.  For the first domain on a 
developer?s system, get the folders and files from a fellow developer.  For those domains after the 
first one, copy from another domain.
8.	Modify the CCS.properties file in the config folder ? but only for the CCSV4-2010 version.  For customer 
versions, this step does not have to be done.  Copy the contents of the CCSTest.properties (from 
\Projects\CCSV4-2010\Server\CCSFiles\config) file into the CCS.properties file.
9.	Modify the domain.xml file in the config folder:
a.	Add this line after all the other j2ee-application elements (near the top) under domain / applications 
<j2ee-application availability-enabled="false" directory-deployed="true" enabled="true" java-
web-start-enabled="true" location="X:/Projects/CCSV4-
xxx/Build/Sun81/CCSV4/SampleEAR/Build/CCSV4_ear" name="CCSV4" object-type="user"/> where X is 
the drive letter and xxx is the customer designation.
b.	Add this line after all the other application-ref elements (near the bottom under domain / servers / 
server 
<application-ref disable-timeout-in-minutes="30" enabled="true" lb-enabled="false" 
ref="CCSV4" virtual-servers="server"/>.
c.	Change the database name to the name specified in the setEnv.cmd file (set 
TEST_DATABASE=CCSV42010 in the example below)
<property name="DatabaseName" value="CCSV4ICC"/>.
10.	Add the following row to the AssociativeTables table ? (?TenderTypes?, ?2?, ?Check?, null, ?US?)
3.4	Configuration Files
This section describes the configuration files that must be modified as part of the creation of a new project.
3.4.1	setEnv.cmd
The setEnv.cmd file in the \Projects\CCSV4-xxx\Server\CCS\Sun81 folder and the 
\Programs\Appservers_91\Domains\CCSV4-xxx folder is used to specify all the variables for the various 
versions that exist on the developer?s system.  Here?s an annotated look at that file ? the highlighted portions 
are those values that change with each version.
@echo off
@rem *************************************************************************
@rem This script is used to set up your environment for development with 
@rem the Sun AppServer 9.1. 
@rem *************************************************************************

REM set drive letter
if "" == "%1" goto DEFAULT

set DRIVE=%1
goto CHECKPATH

:DEFAULT
if not "" == "%DRIVE%" goto CHECKPATH
set DRIVE=D

:CHECKPATH
if NOT "" == "%FJ_APP_PATH%" goto MAIN
set FJ_APP_PATH=%DRIVE%:\programs


:MAIN
@rem *************************************************************************
@rem  Set the following for your personal system
@rem *************************************************************************
set SUN_DRIVE=%DRIVE%
set CCSLIB_DRIVE=%DRIVE%
set CCS_DRIVE=%DRIVE%
set ANT_DRIVE=%DRIVE%
set SAGENT_DRIVE=%DRIVE%
set CCSV4_PROJECT_HOME_DRIVE=%DRIVE%
set MS_SQL_DRIVE=%DRIVE%

set MS_SQL_SERVER_HOST_NAME=localhost
set MS_SQL_SERVER_PORT_NUMBER=1433
set MS_SQL_SERVER_DATABASE_NAME=CCSV4 
set MS_SQL_SERVER_USER=ccs
set MS_SQL_SERVER_PASSWORD=ccs
set MS_SQL_SERVER_UNICODE=false

set TEST_DATABASE=CCSV42010 
set TEST_DATABASE_SERVER_NAME=%TEST_DATABASE%@localhost:1433
set TEST_DATABASE_USER_NAME=ccs
set TEST_DATABASE_PASSWORD=ccs

set SUN_HOME=%FJ_APP_PATH%\Sun\AppServer_91

set MS_SQL_HOME=%SUN_HOME%\lib
@rem *************************************************************************

set CCSV4_PROJECT_HOME=%CCSV4_PROJECT_HOME_DRIVE%:\Projects\CCSV4-2010
set TESTING_FOR_CCSV4_HOME=%CCSV4_PROJECT_HOME%\Testing
set JUNIT_TESTS_FOR_CCSV4_HOME=%TESTING_FOR_CCSV4_HOME%\JUnitTests

set CCSLIB=%FJ_APP_PATH%\jlib
set DOMAIN_DIR=%FJ_APP_PATH%\AppServers_91\Domains
set SERVER_NAME=CCSV4-2010
set SERVICE_NAME=%SERVER_NAME%
set SERVICE_DISPLAY_NAME=%SERVER_NAME%
set DOMAIN_NAME=%SERVER_NAME%
set CCS_HOME=%DOMAIN_DIR%\%DOMAIN_NAME%

REM set Sun variables in a Sun provided file
IF NOT EXIST %SUN_HOME%\config\asenv.bat goto BADSUNPATH

call %SUN_HOME%\config\asenv.bat

set ANT_HOME=%AS_ANT%
set ANT=%ANT_HOME%


REM set other Sun specific options
set APP_SERVER_TYPE=Sun81
set APP_SERVER_INITIAL=com.sun.enterprise.naming.SerialInitContextFactory
set APP_SERVER_DATABASE_SERVER=-DdatabaseServerName=%TEST_DATABASE_SERVER_NAME%
set APP_SERVER_DATABASE_USER=-DdatabaseUserName=%TEST_DATABASE_USER_NAME%
set APP_SERVER_DATABASE_PASSWORD=-DdatabasePassword=%TEST_DATABASE_PASSWORD%
set APP_SERVER_URL=iiop://localhost:1099
set APP_SERVER_CONTEXT1=-Djava.naming.factory.initial=%APP_SERVER_INITIAL% 
set APP_SERVER_CONTEXT2=-Djava.naming.provider.url=%APP_SERVER_URL% 
set APP_SERVER_CONTEXT3=-Djava.naming.security.principal=ccs 
set APP_SERVER_CONTEXT4=-Djava.naming.security.credentials=ccs
SET APP_SERVER_CONTEXT=%APP_SERVER_CONTEXT1% %APP_SERVER_CONTEXT2% %APP_SERVER_CONTEXT3% 
%APP_SERVER_CONTEXT4% %APP_SERVER_DATABASE_SERVER%

SET APP_SERVER_CONTEXT=%APP_SERVER_CONTEXT1% %APP_SERVER_CONTEXT2% %APP_SERVER_CONTEXT3% 
%APP_SERVER_CONTEXT4% 
SET APP_SERVER_CONTEXT=%APP_SERVER_CONTEXT% %APP_SERVER_DATABASE_SERVER% %APP_SERVER_DATABASE_USER% 
%APP_SERVER_DATABASE_PASSWORD%

set DATABASE_JARS=%CCSLIB%/msbase.jar;%CCSLIB%/mssqlserver.jar;%CCSLIB%/msutil.jar;%CCSLIB%/jtds-
1.2.jar;%CCSLIB%/sqljdbc.jar
set APP_SERVER_JARS=%AS_WEBSERVICES_LIB%/j2ee.jar;%AS_WEBSERVICES_LIB%/appserv-rt.jar;%DATABASE_JARS%

set PATH=%SUN_HOME%\bin;%PATH%
goto END

:BADSUNPATH
echo The Sun Application Server configuration file cannot be found at the following location:
echo %SUN_HOME%\config\asenv.bat
echo Please
 set the SUN_HOME environment variable to the path of the Sun\AppServer folder
echo (e.g. SUN_HOME=\programs\Sun\Appserver_91)
echo.
goto END

:END
3.5	Database
Follow these steps to set up a new database using SQL Server Management Studio:
1.	Create a database ? database name CCSV4xxx ? where xxx is the customer designation.
a.	Right click Databases, click New Database.
b.	Enter the database name and click OK.
2.	Add user ccs
a.	Expand Databases
b.	Expand the database just created
c.	Expand Security
d.	Right click Users and click New User
e.	Enter ccs for the user name and login name.
f.	In the Owned Schemas and Role Members panels, click these check boxes
i.	Data reader
ii.	Data writer
iii.	DDL admin
iv.	Owner
g.	Click OK.
3.	Create and populate the tables:
a.	Start a DOS session in the Database folder
b.	Enter one of the following commands, depending on what type of system is required:
i.	RMRCInstallTables SQL CCSV4xxx
ii.	RMInstallTables SQL CCSV4xxx
iii.	RCInstallTables SQL CCSV4xxx
c.	Check the abc.err.log files that are created in that folder.  They should be empty.  If not, there are 
problems that must be corrected.
3.6	Development Methodology
The environment structures having been put in place as described above, we can now concentrate on the 
methodology.  This section describes the methodology currently in use while making no claim that it is the 
best possible methodology.  This methodology supports maintaining all versions of CCS on the same 
computer as opposed to using VM?s for alternate versions.
The methodology has the following components:
1.	Standard maintenance.
2.	XSD maintenance.
3.	Java software maintenance.
4.	Testing
3.6.1	Standard Maintenance
Standard maintenance applies to all the non-Java, non-XSD files within CCS ? e.g., server files and database 
script files.  These files are edited with standard Microsoft editors Notepad and WordPad.
3.6.2	XSD Maintenance
XSD maintenance applies to all the XSD (XML schema) files within CCS (see section 28, Appendix C ? CCS 
Documents).  These files are currently edited with XMLSpy.  We only have one licensed copy of XMLSpy so 
the licensing situation will have to be worked out prior to additional personnel having the ability to edit these 
files.
3.6.3	Java Software Maintenance
All maintenance of the Java class files is done using Eclipse.  The setup and settings for Eclipse can be found 
in Appendix A ? Eclipse .
3.6.4	 Testing
JUnit is the testing tool for CCS.  Details of the integration of JUnit can be found in section 25, JUnit Testing 
Integration. The remainder of this section contains a description of the mechanics of the testing.
Three DOS sessions are required for testing:
1.	One session to start and stop CCS.
2.	One session to run the JUnit tests.
3.	One session to build and deploy CCS.
This scenario describes a typical testing session ? assuming all three DOS sessions have been established:
1.	In the CCS Start / Stop Session, run the Server91 command to set up the session (e.g., Server91 2010).
2.	In the Build / Deploy Session:
a.	Run the Build91 command to set up the session (e.g., Build91 2010).
b.	Optionally, run the CleanSunD command to delete all the CCS class files.  Normally, this is only 
required when something seems to have been wrong with a previous build.
c.	Run the BuildSunD command to build CCS.
3.	In the CCS Start / Stop Session, run the startSplitCCS command to start CCS.
4.	In the Build / Deploy Session, run the DeploySun command to deploy CCS.
5.	In the Test Session:
a.	Run the Test91 command to set up the session (e.g., Test91 2010).
b.	Run the ..\..\Testing\JUnitTests\JUnitTests (or, likely, a variant of this command, see section 25.3) 
command to test CCS.
6.	After examining the test results, perhaps changes are required.  These changes are made in the Eclipse 
environment.
7.	In the Build / Deploy Session, run the BuildSunD command to rebuild and redeploy CCS.
8.	Repeat steps 5 ? 7 until the tests are successful.
3.6.4.1	CCS Start / Stop Session
This session is used to start and stop CCS.  
After this session is established and whenever changing from one version of CCS to another (for example 
from CCSV4-2010 to CCSV4-Shopko), the bat file Server91 (for example, Server91 Shopko) is run.  See 
section 29.2.4 for a description of this bat file.  This bat file sets up the environment and the current directory 
for the use of the CCS server.
The file startSplitCCS (see section 29.1.1) is run to start CCS and the file stopCCS (see section 29.1.2) is run 
to undeploy and stop CCS.  The startSplitCCS file should only be run after a build (see below) has been 
successful.
3.6.4.2	Testing Session
This session is used to run the JUnit tests.  
After this session is established and whenever changing from one version of CCS to another (for example 
from CCSV4-2010 to CCSV4-Shopko), the bat file Test91 (for example, Test91 Shopko) is run.  See section 
29.2.3 for a description of this bat file.  This bat file sets up the environment and the current directory for the 
use of JUnit testing.
The entire set of JUnit tests can then be run with this command - ..\..\Testing\JUnitTests\JUnitTests.  See 
section 25.3 for details on running variations of the tests.
3.6.4.3	Build / Deploy Session
This session is used to build and deploy the CCS application.  
After this session is established and whenever changing from one version of CCS to another (for example 
from CCSV4-2010 to CCSV4-Shopko), the bat file Build91 (for example, Build91 Shopko) is run.  See section 
29.2.2 for a description of this bat file.  This bat file sets up the environment and the current directory for 
building and deploying CCS.
Three separate bat files are used in this session:
1.	CleanSunD ? run this file any time a complete rebuild of CCS is required.  The server must be stopped 
and JUnit must be stopped for this to run successfully.
2.	BuildSunD ? run this file to build CCS.  This is required any time one of the source files is changed.  This 
can be run while CCS is running and deployed.  CCS will be automatically redeployed after the build is 
complete.
3.	DeploySun ? run this file to deploy CCS.  This is used as part of the following sequence: 
a.	Run BuildSunD in this session.
b.	Run startSplitCCS (see above) in the CCS Start / Stop Session.
c.	Then run DeploySun.




4.	CCS JAVA PACKAGE STRUCTURE
The CCS architectural overview was presented in section 2.2, CCS Architecture, including a pictorial 
representation.  This section discusses the CCS Java package structure.
In Java, the folder structure maps the package structure.  Thus, the Windows Explorer screen shot below of 
the CCS folder structure provides the view of the CCS Java package structure.
 
Figure 3: CCS Java Package Structure
Following is a short description of each of the packages.  The highest level packages (down through ccs) do 
not hold any files, they are just package names based on convention.  The real structure starts with these 
packages:
1.	application ? this package encapsulates all the application packages.  The packages in this section are 
meant to be the packages that may have changes for various customers.  File changes and additions are 
normally made in the packages in this structure.
a.	clients ? this package encapsulates all the client related packages:
i.	intface ? this package contains the Java Servlet classes that provide the ?listener? interface 
between client applications and CCS.  This package also encapsulates the adapter pattern 
packages that support the ReturnCENTER request facility:
(1)	rcgs ? this package encapsulates all the various ReturnCENTER listener packages.  It also 
contains files common to all ReturnCENTER listener processing.
(a)	customer ? this package contains the files supporting ReturnCENTER customer 
requests.
(b)	ping ? this package contains the files supporting the ReturnCENTER ping request.
(c)	transaction ? this package contains the files supporting ReturnCENTER transaction 
requests.
(d)	transactionadjustment ? this package contains the files supporting ReturnCENTER 
transaction adjustment requests.
ii.	test ? this package contains CCS client test programs.
iii.	util ? this package contains utility type classes that pertain to client processing.
b.	ebeans ? this package contains all the application entity bean files.
c.	sbeans ? this package encapsulates all the CCS session bean packages and all the application 
business logic packages that support the CCS session bean:
i.	domain ? this package encapsulates all the application domain packages:
(1)	customer ? this package contains all the customer domain files.
(2)	loyalty ? this package contains all the loyalty domain files.
(3)	misc ? this package contains all the domain oriented miscellaneous files.
ii.	extract ? this package contains all the files that support the CCS extract facility.
(1)	rctransaction ? this package contains all the files used to support the ReturnCENTER 
transaction extract facility.
iii.	fa?ade ? this package contains the files that serve as the fa?ade for the three CCS session 
beans.
iv.	misc ? this package contains all the application miscellaneous files used in CCS processing
v.	requestresponse ? this package contains all the request and response files.  There is one request 
handler file and one response builder file for each request / response pair.
vi.	session ? this package contains all the session bean files mandated by the J2EE specification.
2.	base ? this package encapsulates all the base packages.  The packages in this section are meant to be 
the ?base? software that does not normally change for various customers.  This was the theory in the 
original packaging although it did not work out exactly that way.
a.	ebeans ? this package contains all the base entity bean files.
b.	mbeans ? this package encapsulates all the base message bean packages and contains the base 
message bean files that are used for message bean processing.  The message bean files service the 
interface between CCS and Loyalty Manager.  Originally, the CCS / LM interface was a JMS interface 
? see section 18.  Now it is a direct interface with the JMS interface used only when the direct 
interface is blocked.  However, the original package structure has been maintained.  These are the 
sub-packages:
i.	customer ? this package contains the customer based message bean files. 
ii.	loyalty ? this package contains the loyalty based message bean files.
c.	sbeans ? this package encapsulates all the base business logic packages that support the CCS 
session bean.  These are those packages:
i.	domain ? this package encapsulates all the base CCS domain packages:
(1)	customer ? this package contains all the customer domain files.
(2)	loyalty ? this package contains all the loyalty domain files.
(3)	misc ? this package contains all the domain oriented miscellaneous files.
(4)	transaction - this package contains all the transaction domain files.
(5)	transactionadjustment - this package contains all the transaction adjustment domain files.
(6)	velocity - this package contains all the velocity domain files.
ii.	misc ? this package contains the base miscellaneous files used in CCS processing.
iii.	requestresponse ? this package contains base files that support the request / response 
processing.
3.	batch ? this package encapsulates all the batch packages.  Additionally, this package contains Java files 
that serve as base files to files in the sub-packages and Java files that are used by the files in the sub-
packages.  The packages in this section represent specific batch jobs.
a.	exports ? this package contains all the export related Java files.
b.	Imports ? this package contains all the import related Java files.
c.	misc ? this package contains all the miscellaneous related Java files.
i.	systemmaintainers ? this package contains a file for each individual system maintainer.


5.	SERVLET LISTENERS
CCS supports HTTP requests with the use of Java Servlet listeners.  Currently the following listeners are 
used:
1.	Generic Client Servlet (GCS) ? a general purpose listener to support client applications that format CCS 
requests and use the HTTP request interface.
2.	ReturnCENTER GlobalSTORE Servlet ? a specialized listener to support client applications that format 
ReturnCENTER requests and use the HTTP request interface.
5.1	Generic Client Servlet
The Generic Client Servlet (GCS) acts as a CCS listener to support client application that format CCS 
requests and use the HTTP request interface.  This Servlet processes those HTTP requests and makes direct 
Java method calls to CCS.  I.e., it handles all the low level interface requirements, allowing the client 
application to use the HTTP protocol.
5.2	ReturnCENTER GlobalSTORE Servlet
The ReturnCENTER GlobalSTORE Servlet (RCGSS) acts as a CCS listener to support client applications 
that format ReturnCENTER requests and use the HTTP request interface.  This Servlet processes those 
HTTP requests, doing two things:
1.	It transforms the ReturnCENTER requests into CCS requests.
2.	It makes direct Java method calls to CCS.  I.e., it handles all the low level interface requirements, allowing 
the client application to use the HTTP protocol.
The ReturnCENTER GlobalSTORE Servlet transforms ReturnCENTER requests to CCS requests as shown 
in the table below.

RC Request
CCS Request
Comment
SetReserve (Fetch)
TransactionSearch
This request reserves the 
transaction and fetches the 
transaction details.  A design flaw 
caused the TransactionSearch 
request to be used instead of the 
TransactionFetch.  
Release (VoidTransaction)
TransactionUpdate
This request releases a reserved 
transaction.  This request releases 
reservations only if the store ID, 
register ID and user ID match.
SetSuspend
TransactionUpdate
This request changes the 
transaction?s reservation to a 
suspend reservation.
ReleaseSuspend
TransactionUpdate
This request releases a reserved 
and suspended transaction.  
ForceRelease
TransactionUpdate
This request releases a reserved 
transaction.  This request releases 
the transaction without any 
reservation checking.
Update
TransactionUpdate
This request adds entries to the 
adjustment tables and releases 
the reservation on the original 
transaction.
Search
TransactionSearch
This request returns a list of 
transaction ID data that matches 
passed criteria.
CreateID
CustomerUpdate
This request creates a customer 
with a ReturnCenter ID (driver?s 
license).
ChangeID
CustomerUpdate
This request changes a customer 
with a ReturnCenter ID (driver?s 
license).
CheckID
CustomerFetch
This request returns the 
customer?s profile data and returns 
the results of a velocity check.
UpdateIDVelocity
TransactionUpdate
This request updates the 
ReturnCENTER velocity tables.



5.3	Servlet Class File Structure
This section describes the structure of the various class files of which the Servlets are comprised.  These 
class files can be found in this package - com.fujitsu.ftxs.corema.ccs.application.clients.intface.
This is the hierarchy of those files:
1.	The base class for all the files is the abstract CCSClientServlet.java file.  This file extends the Java 
supplied HTTPServlet.java class and contains all the common variables and methods for its sub-classes.  
It requires all sub-classes to implement the doGet() method.
2.	The base class for all CCS HTTP listener classes is the abstract CCSClientBasicServlet.java file.  This file 
extends the CCSClientServlet.java class and implements the doGet() method.  It requires all sub-classes 
to implement the formatCCSRequest() and formatClientResponse() methods.  This supports the idea that 
some listeners, e.g., the ReturnCENTER GlobalSTORE listener (see section 5.2), must transform the 
client requests to CCS requests and / or the CCS responses to client responses.
3.	HTTP listener files ? these files are concrete implementations of the CCSClientBasicServlet.java file:
a.	GenericClientServlet.java. This file represents the implementation for the generic HTTP listener.  It 
implements the formatCCSRequest() and formatClientResponse() methods, but each of these is 
empty because there is no transformation requirement.  Thus, this is just a shell file, containing no 
functionality ? all the required functionality can be found in its base classes.
b.	RCGSServlet.java. This file represents the implementation for the ReturnCENTER HTTP listener.  It 
implements the formatCCSRequest() and formatClientResponse() methods, using these methods to 
transform the request and the response ? see section 5.2 for a description of this transformation 
requirement.
5.4	Adding A New Servlet
The following steps are required to add a new Client Servlet:
1.	Source files
a.	Add two new source files in com.fujitsu.ftxs.corema.ccs.application .clients.intface:
i.	Model one after the CCSClientBasicServlet.java file ? which is the base class for CCS HTTP 
listener classes ? see previous section.
ii.	Model the other after the RCGSServlet.java file ? see previous section.
Note:  if the only requirement is to transform the request, the response or both, then just create a 
RCGSServlet.java like file that extends CCSClientBasicServlet.java.
b.	Make any changes in the files in com.fujitsu.ftxs.corema.ccs.application clients.util to support the new 
file.
2.	Build Files
a.	Top level build
i.	BuildSun81.xml
(1)	Search for EAR1WebAppGCS
(a)	Add this line ? <property name="EAR1WebAppxxx" 
value="${EAR1Source}/xxxWebApp"/> where xxx is the prefix of the new Servlet
(2)	Search for GenericClientServlet.src
(a)	Add a line modeled after this one ? <property name="GenericClientServlet.src" value= 
"${ProjectSource}/${CCSPath}/application/clients/intface"/> swapping the new source file 
name for ?GenericClientServlet?
(b)	Similarly, add a line modeled after this one ? <property 
name="GenericClientServletUtil.src" 
value="${ProjectSource}/${CCSPath}/application/clients/util"/> swapping the new source 
file name for ?GenericClientServlet?
(3)	Search for GenericClientServletBuildPath.src
(a)	Add a line modeled after this one ? <property name="GenericClientServletBuildPath.src" 
value="${WARsBuildPath.src}/GCS/Sun"/> swapping the new source file name for 
?GenericClientServlet? and the new prefix for ?GCS?
(4)	Search for <!-- GenericClientServlet files -->
(a)	Add a new section here for the new Servlet that contains the 3 <copy> tasks.
ii.	BuildCCSV4-Sun.xml
(1)	Search for Package GenericClient.war
(a)	Create a similar target here for the new Servlet.
(b)	Then go back up to change the line <target name="jar-war" 
depends="war.GenericClient?/> to include the target from (a).
(2)	Search for compile.GCSWebApp
(a)	Create a similar target here for the new Servlet.  Its name must match the name in the 
depends clause of the new target created in (1) (a) above.
b.	Build\Application\EARs\Sample\Sun
i.	application.xml ? add a new <module> element for the new .war file using the GCSWebApp.war 
as the model
ii.	MANIFEST.MF ? add a new Name line for the new .war file using the GCSWebApp.war as the 
model
c.	Build\Application\WARs ? add a new folder and then a \Sun folder modeled after the GCS folder
3.	Test Files ? the standard JUnitTests should be constructed.
4.	Server files 
a.	Add a new .properties file in Server\config.  The name of this file is specified in the web.xml file in 
Build\Application\WARs\xxx where xxx is the prefix of the new Servlet.
b.	Add a line to the BrowserPing.html file test in the tests folder. The Servlet names that must be used in 
the new line of BrowserPing.html are found the web.xml file in Build\Application\WARs\xxx where xxx 
is the prefix of the new Servlet.
5.	The Servlet URL ? it has the following components:
a.	Server portion ? which is always http://localhost:10001/
b.	Root name ? which comes from the application.xml file, the module/web/context-root element value.
c.	Servlet name ? which comes from the web.xml file, the servlet-mapping/url-pattern element value



6.	REQUEST PROCESSING FLOW
The previous section described how Servlet listeners are used to provide an HTTP interface to client 
applications.  These listeners pick up HTTP requests and convert them to a Java call to the CCS session 
bean code.  This section describes what happens next ? once the CCS session bean code receives a call.
It may be a good time to go back to Figure 2 in section 2.2.  This figure shows the structure of the CCS code.  
In this section, we will be describing the CCS POJOs (Plain Old Java Objects).  These objects are organized 
into three general categories:
1.	Request management objects ? the objects that manage a request (request handler) and build the 
resultant response (response builders).
2.	Domain objects ? the objects that encapsulate a data domain, such as customer.
3.	Helper objects ? the rest.
The high level flow goes like this:
1.	Determine the request type.
2.	Call the appropriate request handler.
a.	The request handler does what it needs to do, calling on any appropriate domain objects and helper 
objects.
3.	Call the appropriate response builder
a.	The response builder formats an appropriate response.
Here is some detail about that flow:
1.	The CCS session bean entry point is the processRequest(String request) method in the CCS.java file in 
the com.fujitsu.ftxs.corema.ccs.application.sbeans.facade package.
2.	The processRequest method generates a CCSRequestDocument object from the passed request and 
calls processCCSRequest(CCSRequestDocument requestDocument) in the same file.
3.	The processCCSRequest method gets the specific request handler to process the request from the 
CCSApplicationRequestHandlerFactory class (the static getRequestHandler(CCSRequestDocument 
requestDocument) method).
4.	The specific request handler is called.  It will return the response and that response will be returned to the 
client application.
5.	The specific request handler manages all activity for a request and the activity varies considerably.  All 
request handlers are found in the com.fujitsu.ftxs.corema.ccs.application.sbeans.requestresponse 
package.  Each one extends the abstract class CCSApplicationRequestHandler.java that extends the 
abstract class CCSRequestHandler.java.  Each request handler must have the following methods ? 
based on the abstract files:
a.	processRequest(CCSRequestDocument requestDocument) ? to provide an entry point to manage the 
processing of the request.
b.	getRequestParameters() ? to extract request processing parameters from the request data.  Note that 
this is a rather strange implementation.  There is no need for the abstract files to have declared this 
method abstract because it is not called from the outside.  It was done to mandate the structure of the 
request handler files ? i.e., so they all get the parameters using the same method.
The request handler extracts parameters from the request (normally the attributes) and deals with the 
core of the request (normally the elements), calling the domain objects and helper objects as required.  
Ultimately, the request handler calls its peer response builder (no factory method required here, the 
response builder object is known) to build the response and then the response is returned to the caller.



7.	CCS DATABASE TABLES
This section describes the CCS database structure.  The database tables are organized as follows:
1.	Customer data tables.
2.	Transaction data tables.
3.	ReturnCENTER data tables.
4.	Miscellaneous data tables.
5.	Next ID tables.
6.	Extract tables.
7.	Configuration tables.
8.	Miscellaneous tables
7.1	Customer Data Tables
The customer data tables are used to store customer data.  The following tables fall into this category:
1.	CustomerID ? this table contains a row for each customer.  It contains the following data:
a.	activeCustomer ? Y for an active customer, N for an inactive customer.  This column is not currently 
used in the base software.
b.	completeCustomer ? Y for a customer with enough data to be considered complete, N for a customer 
whose data is not complete.  This column is not currently used in the base software.
c.	logicallyDeletedCustomer ? Y if this customer has been logically deleted, otherwise N.  Logically 
deleted occurs when two existing customers are merged together.  The ?merged from? customer is 
logically deleted after the merge is complete.  
d.	lastPurchaseDate ? the date of the customer?s most recent purchase.
2.	CustomerElements ? this table contains many rows for each customer, each row containing the data for a 
high level element of data (e.g., Name, Address).  Each row contains the following data:
a.	logicalRowID ? the ID for this data element
b.	sequenceNbr ? the count of physical rows for this logical row.  This supports the idea of the data 
column overflowing into another row.  The count begins at 0.
c.	elementID ? the element ID for this row.  Each data element has an assigned element ID in the 
ElementID table.  For example, the Name element is element ID 2.  The element IDs are specified in 
the MDCustomerElements table ? see section 7.7.
d.	customerID ? the CCS assigned customer ID for this customer.  
e.	parentID ? the logicalRowID value of the first row for a customer.
f.	lastSales ? the date of the customer?s most recent purchase.  This column is not used.
g.	data ? the XML data for this data element.  The element?s XML tag is not part of this data, but all the 
tags for all the sub-elements are part of the data.  For example, the Name element data looks like this 
- <Title></Title><First>John</First><MI></MI><Last>Smith</Last><Suffix></Suffix>.
3.	CustomerSearchP ? this table contains data for each customer.  The data is in two categories:
a.	Data on which a client application can search.
b.	Data the client application can display in the search results.
4.	CustomerSearchS ? this table contains data for each customer with a secondary address.  There will be 
one row for each secondary address for a customer.  The data is the same as the CustomerSearchP 
table except the address related data applies to a different address for the same customer.
5.	CustomerFetch ? this table contains the secondary ID data for a customer.  Each row contains the 
following data:
a.	elementID ? this column contains the secondary ID?s element ID.  The element IDs are specified in 
the ElementIDs table ? see section 7.7.  These are the element IDs currently in use:
i.	103 ? Member ID.
ii.	104 ? Employee ID.
iii.	105 ? Internal Customer ID.
iv.	106 ? Web ID.
v.	107 ? Loyalty ID.
b.	elementValue ? this column contains the secondary ID?s ID.
c.	customerID ? this column contains the CCS customer ID associated with the secondary ID.
d.	logicalRowID ? this column contains the logicalRowID value in the CustomerElements table of the 
element containing this secondary ID.
6.	CustomerDates ? this table contains dates associated with a customer.  Each row contains the following 
data:
a.	customerID ? this column contains the CCS customer ID.
b.	dateType ? this column contains the date type ? e.g., B for birth date.
c.	Date ? this column contains the date.
7.	POSCreatedSecondaryIDs ? this table is a cross-reference table for IDs created by GlobalSTORE in an 
offline mode.  Each row contains the GlobalSTORE created ID and the associated CCS customer ID.
7.2	TransactionData Tables
There are two types of transaction data tables in CCS:
1.	Customer Analytics based tables.
2.	ReturnCENTER based tables.
In addition, regardless of which type of table is used, there are two transaction summary tables:
1.	TransactionSummary.
2.	YTDSummary.
7.2.1	Customer Analytics Based Tables
The Customer Analytics based tables were originally developed based on the transaction data model used by 
Customer Analytics.  The following tables are used:
1.	TransactionHeader ? this table contains all the header related data for a transaction.
2.	TransactionLineItem ? this table contains all the line item related data for a transaction.
3.	TransactionTender ? this table contains all the tender related data for a transaction.
These tables are used in the REI application and the Danier application, in which case they are populated by 
data supplied by Customer Analytics.  These tables are also used in the Godiva applications, but in those 
applications, the tables are populated by GlobalSTORE created TLog files.
7.2.2	ReturnCENTER Based Tables
The ReturnCENTER based tables were originally developed as ReturnCENTER tables, used to store 
ReturnCENTER original transactions and return transactions (adjustments).  These tables are now used for 
Relationship Manager transaction displays as well as for ReturnCENTER.  The following tables are used:
1.	 TransactionRCGSHeader ? this table contains all the header related data for a transaction.
2.	TransactionRCGSLineItem ? this table contains all the line item related data for a transaction.
3.	TransactionRCGSLineItemLink ? this table contains all the line item link related data for a line item linked 
to another line item ? e.g., tax items.
4.	TransactionRCGSTender ? this table contains all the tender related data for a transaction.
The following tables contain all the adjustment data based on returns against an original transaction:
1.	TransactionAdjustmentRCGSHeader ? this table contains all the header related data for a return 
transaction.
2.	TransactionAdjustmentRCGSLineItem ? this table contains all the line item related data for a line item 
linked to a returned line item ? e.g., tax items.
3.	TransactionAdjustmentRCGSLineItemLink ? this table contains all the line item link related data for a 
returned item ? e.g., tax items.
4.	TransactionAdjustmentRCGSTender ? this table contains all the tender related data for a returned tender.
7.2.3	Transaction Summary Tables
Two transaction summary tables are used regardless of what type of transaction is used.
1.	TransactionSummary ? this table contains lifetime sales data.
2.	YTDSummary ? this table contains data related to calendar year.
7.3	ReturnCENTER Data Tables
The following tables support ReturnCENTER processing over and above the storage of the transaction data 
previously described:
1.	TransactionSearchRCGSCustomer ? this table is a transaction search table ? the search is based on a 
customer?s secondary ID and item code.
2.	TransactionSearchRCGSAccount ? this table is a transaction search table ? the search is based on an 
account number (hashed and masked version) and item code.
3.	RCVelocity ? this table contains data associated with a non-receipt return.  It is used to determine 
whether a non-receipt return will be allowed or not.
4.	Tables to support the importing of ReturnCENTER TLog files on multiple servers (this feature has been 
implemented but not qualified for use yet):
a.	RCDownServers ? this table contains a row for each ReturnCENTER batch server that is currently 
not operational.
b.	RCFileMetrics ? this table contains statistics for each of the ReturnCENTER batch servers.
c.	RCFileProcessing ? this table contains data related to TLog files currently being processed.
d.	RCSCFolderLock ? this table contains a row for each server currently holding a folder lock.
7.4	Miscellaneous Data Tables
CCS has the following miscellaneous data tables:
1.	AgeSegmentAssignment ? this table contains data associated with the assignment of customers to LM 
segments based on age.
2.	Audit ? this table contains audit data associated with customer updates.
3.	AuditTransacton ? this table contains audit data associated with transaction events.
4.	MatchKey ? this table contains a cross reference between Sagent software created match key value and 
the associated CCS customer ID.  This is only used when the Sagent address cleansing software is in 
use ? the REI and Danier applications used this software.
5.	Metrics ? this table contains statistics on CCS request processing.  Currently there is no use made of this 
table.
7.5	Next ID Tables
CCS has the following next ID tables:
1.	NextAuditID ? to provide the next Audit ID.
2.	NextCustomerExtractionID ? to provide the next ID for the standard customer extract scheme.
3.	NextCustomerID ? to provide the next CCS customer ID.
4.	NextCustomerIDRow ? to provide the next logicalRowID for the CustomerElements table.
5.	NextInternalCustomerID ? to provide the next Internal Customer ID when it is being generated by CCS.
6.	NextLoyaltyID ? to provide the next Loyalty ID when it is being generated by CCS.
7.	NextMemberID ? to provide the next Member ID when it is being generated by CCS.
7.6	Extract Tables
There are two types of extract tables:
1.	Accumulative tables ? these tables contain data that is not related to a calendar day.
2.	Daily tables ? these tables contain data for a calendar day.
7.6.1	Accumulative Tables
CCS has the following accumulative extraction tables:
1.	ExtractForJMSSave ? this table contains an entry for each customer update when the interface between 
RM and LM is blocked.  This table is normally empty.  It is populated when the interface is blocked.  Once 
the interface becomes unblocked, this table is emptied in the appropriate order and will eventually be 
empty again.
2.	ExtractForStandardCustomer ? this table contains an entry for each customer update done since the last 
StandardCustomerExtracter job was run.  When that job is run, all the data is saved to the 
ExtractForStandardCustomerSave table and copied to the ExtractForStandardCustomerExtract table for 
the current date.
3.	ExtractForStandardCustomerSave ? this table contains an entry for each customer update prior to the 
time the last StandardCustomerExtracter job was run.  It is maintained by the System Maintainer job so 
eventually entries are deleted.
7.6.2	Daily Tables
CCS has the following daily extraction tables:
1.	ExtractForStandardCustomerExtract_yyyymmdd ? this table contains all the customer updates for a day.  
Actually, this table will contain all the customer updates prior to the last run of the 
StandardCustomerExtracter job and after the StandardCustomerExtracter run prior to that.  In practice, 
with that job running every day after midnight, it will contain all of the updates done in the calendar day 
prior to the date on the table.
2.	ExtractForNewEmail_yyyymmdd ? this table contains all the customer creates for customers with an 
email address for a day.  Actually, this table will contain all the customer creates with email prior to the 
last run of the StandardCustomerExtracter job and after the StandardCustomerExtracter run prior to that.  
In practice, with that job running every day after midnight, it will contain all of the customer creates with 
email done in the calendar day prior to the date on the table.
3.	ExtractForNewRCTransaction_yyyymmdd ? this table contains all the ReturnCENTER transaction events 
for a calendar day.  In this case, all the entries in the table will be from the calendar day represented by 
the date on the table name.
7.7	Configuration Tables
CCS has the following daily configuration tables:
1.	AdCodes ? this table was used for REI only.  It contains a list of advertisement codes and their 
description.
2.	AddressActions ? this table is used in conjunction with Sagent address cleansing software.  It provides 
options related to action codes determined by Sagent software.
3.	AssociativeTables ? this table contains several sub-tables each providing an ID / description.
4.	ElementID ? this table contains a row containing element ID, XML request name and description for the 
following system elements:
a.	CCS data elements ? e.g., Name (CCSMessage/Customer/Name).
b.	CCS secondary ID elements ? e.g., Loyalty ID (CCSMessage/Customer/Loyalty/LoyaltyID).
c.	CustomerFetch secondary ID elements ? e.g., Loyalty ID 
(CCSMessage/CustomerFetchData/Loyalty/LoyaltyID).
5.	ErrorCode ? this table contains a row for each CCS error code.  It contains the code and the description.
6.	MDAttributes ? this table contains a row for each request attribute in the system.  The data associated 
with an attribute is the following:
a.	attributeID ? the ID of the attribute.
b.	attributeName ? the name of the attribute.
c.	attributeValType ? the type of value to be used for this attribute when constructing the response:
i.	0 ? the response value is fixed, it can be found in the attributeValFixed column.
ii.	1 ? the response value is the response type related to the request type in the request.
iii.	2 ? the response value is the response name related to the request name in the request.
iv.	3 ? the response value is found in the request attribute whose attribute ID is in the 
attributeValSource column.
d.	attributeValFixed ? when the attributeValeType is 0, the response value is taken from this column.
e.	attributeValSource ? when the attributeValeType is 3, the response value is taken from this attribute 
ID in the request.
7.	MDCustomerElements ? this table contains a row for each customer data high level element ? e.g., 
Name.  Each row contains the following data:
a.	customerElementID ? the ID of the element.
b.	ownerID ? 0 for the CustomerID entry; the customerElementID of the CustomerID entry for all the 
others.
c.	elementID ? the value of the elementID in the ElementID table.
d.	multiInstanceFlag ? this column specifies whether the element is a multi-instance element (Y) or not 
(N).
e.	forceCase ? this column specifies whether the data for this element should be change to all upper 
case (1) or not (0).
8.	MDFetch ? this table contains an entry for each fetchable secondary ID.  Each entry contains the 
following data:
a.	fetchID ? this column contains the CustomerFetch secondary ID element ID value for this element in 
the ElementID table.
b.	elementID ? this column contains the secondary ID elementID value for this element in the ElementID 
table.
c.	tableName ? this column contains the fetch table name (CustomerFetch).
9.	MDMatchKey ? this table contains an entry for each of the Sagent customer matching match key items.  
This table must be populated based on recommendations from the supplier.
10.	MDView ? this table contains a set of rows for each type of CustomerFetch that is to be supported.  For a 
given viewID, CCS will return a fetch response containing each element specified for that viewID in the 
order specified.  This table contains these columns:
a.	viewID ? the view ID ? e.g., NameAddress.
b.	sequenceNbr ? the sequence number of this element in the response.  Numbering starts with 0.
c.	elementID ? the element ID to be returned.  That?s the value of the elementID in the ElementID table.
11.	MessageTypeLookup ? this table contains a row for each request / response pair:
a.	requestID ? the request ID (the Type attribute value in the request).
b.	requestName ? the request name (the Name attribute value in the request).
c.	requestHandler ? the class name of the Java class that is used to process the request.
d.	responseID ? the response ID (the Type attribute value in the response).
e.	responseName ? the response name (the Name attribute value in the response).
f.	responseBuilder ? the class name of the Java class that is used to build the response.
12.	ResponseAttributes ? this table specifies the attributes that are required for a CCS response.  The table 
contains the following data:
a.	responseID ? matches the responseID from the MessageTypeLookup table.
b.	attributeID ? matches the attributeID from the MDAttributes table.
13.	SecondaryIDXRef ? this table contains cross reference data relating to secondary IDs:
a.	elementID ? the elementID from the secondary ID section of the ElementID table.
b.	custSecondaryIDTypeID ? the single letter designation of the secondary ID type.
c.	CustomerType ? the related customer type.
d.	tranSecondaryIDType ? the single letter designation of the transaction ID type.
14.	SkuXRef ? this table contains cross reference data relating to transaction line item data for CAS related 
transactions.  It relates the surrogate key value on the TransactionLineItem table to the actual item code 
value.
7.8	Miscellaneous Tables
The following tables don?t fall into any of the previous categories:
1.	BatchRestart ? this table supports restarting batch jobs.  If a batch job is so inclined, it can populate this 
table appropriately and then access it on a subsequent run to find out if and where it should pick up.  The 
table has the following columns:
a.	jobClassName ? this column contains the class name of the job.
b.	lotID ? this column contains the lotID of the job.
c.	lastProcessed ? this column contains data related to the job?s processing such that the job can pick 
up where it left off on a subsequent run.
2.	CSAGroup ? this table contains a table for each CSA group.
3.	CSAUser ? this table contains a row for each CSA user.
4.	dual ? this table is not used.
5.	GroupEntity ? this table is not used.
6.	Parameters ? this table contains CSA parameters.
7.	UserEntity ? this table is not used.
8.	Versions ? this table contains the database version numbers.

 
 


8.	ADDING / CHANGING A DATABASE TABLE
This section describes the following:
1.	Adding a database table.
2.	Changing a database table that has an associated entity bean.
3.	Changing the customer search tables.
8.1	Adding A Database Table
Any time a table is added to the database, the following items must be addressed:
1.	One of the .sql files for the complete database (CreateBaseTables.sql and CreateApplicationTables.sql) 
must be modified.
2.	The .sql file for the update must be modified.
3.	An entity bean may need to be created.
8.1.1	The Complete Database SQL Files
There are three SQL files that are maintained that can be used to create a new database:
1.	CreateBaseTables.sql ? for base level tables.
2.	CreateApplicationTables.sql ? for application level tables.
3.	CreatePopulateXXXTables.sql ? for customer specific tables (XXX is the customer designation).
Use the tables already created in these files as a template.  For each table, the following process is used:
1.	Drop any foreign key relationships
2.	Drop and create the table
3.	Drop and create the table?s index
4.	Drop and create any secondary indexes
5.	Create any foreign key relationships
Note:  the .sql file must be re-executable.  I.e., it has to drop everything it creates so it can be run again.
8.1.2	The Release Update SQL File
When a table is added as part of an upgrade release (as opposed to before the initial release), an upgrade 
SQL file must also be modified.  The process is the same as above ? and the file must be re-executable as 
described above.
8.1.3	The Entity Bean
In CCS, a table is sometimes represented by an entity bean.  
8.1.3.1	The Bean Files
Entity bean files are added to the ?ebeans? folder under either base or application.  An entity bean consists of 
the following 6 files:
1.	Beanname.java ? this file contains the remote interface (callable methods) for the entity bean.
2.	BeannameLocal.java ? this file contains the local interface (callable methods) for the entity bean.  
3.	BeannameHome.java ? this file contains the remote home interface (for instantiation) for the entity bean.
4.	BeannameLocalHome.java ? this file contains the local home interface (for instantiation) for the entity 
bean.
5.	BeannamePK.java ? this file contains the primary key object for the entity bean.
6.	BeannameBean.java ? this file is an abstract class defining the implementation for the entity bean.  The 
actual implementation is generated by the Application Server compiler.
Although we only use the local versions of the entity beans, all the files are created.
To create these files, use any of the current set as a template.
8.1.3.2	The Reference File
One additional file is modified to account for the entity bean, either CCSBaseBeanReferences.java or 
CCSApplicationBeanReferences.java.
8.1.3.3	The Definition File
One additional file is modified to provide constants defining the table name and all its column names, either 
CCSBaseSchema.java or CCSApplicationSchema.java.


8.1.3.4	The XML Descriptors
There are also XML descriptor files to be generated for an entity bean.  These files need to be added to 
EntityBeans\Descriptors folder under either Build\Base or Build\Application.  The following files are required:
1.	ejb-jar ? this file defines the bean, providing path information, the field names and any SQL for custom 
methods.
2.	sun-cmp-mappings.xml ? this file maps the bean field names to the table column names.
3.	sun-ejb-jar.xml ? this file defines some characteristics of the bean.
4.	Beanname.dbSchema ? this file defines some characteristics of the bean.
To create these files, use any of the current set as a template ? with the exception of the 
Beanname.dbSchema file.  To generate this file, run the GenSchemaSun.cmd file.
8.1.3.5	The Build Files
The build file (build.xml) found in the Build folder must be modified to add the new entity bean.  A new 
complete build must then be done.
8.1.3.6	The EAR Build
The XML files starting with ?application? in the Build\Application\EARs\Sample folder need to be modified to 
add the new entity bean.
8.1.3.7	The Session Bean Logic
Finally, changes must be made to the session bean files needed to utilize the new table.
8.2	Changing A Table With Associated Entity Bean
Some of the tables used by CCS are accessed via entity beans.  When one of these tables changes ? e.g., 
add a column ? several things must be done to support that.  
The following steps must be done when changing a table associated with an entity bean:
1.	Modify the appropriate SQL script file for a new installation.
2.	Add the changes to the update SQL script file for the next release.
3.	Run the update SQL against the local database to get an up-to-date database.
4.	Modify the dbschema file for the modified table:
a.	Check out the file from Build/Application or Base/EntityBeans/ Descriptors.Sun/TableName/META-
INF ? that?s the file whose type is dbschema.
b.	Run the build job GenSchemaSun ? this will generate all the dbschema files in the build directory.
c.	Move the dbschema file for the changed table to its spot (from Build/Application or 
Base/EntityBeans/Descriptors.Sun/TableName/ META-INF).  Delete all the other dbschema files.
d.	Check the file back in.
5.	Modify the ejb-jar.xml file for the modified table ? if columns are added or removed:
a.	Check out the file from Build/Application or Base/EntityBeans/ Descriptors.Sun/TableName/META-
INF.
b.	Make the appropriate changes ? adding or removing columns.
c.	Check the file back in.
6.	Modify the sun-cmp-mappings.xml file for the modified table ? if columns are added or removed:
a.	Check out the file from Build/Application or Base/EntityBeans/ Descriptors.Sun/TableName/META-
INF.
b.	Make the appropriate changes ? adding or removing columns.
c.	Check the file back in.
7.	Modify the entity bean files:
a.	Check out the files from Java Application or Base ebeans folder.
b.	Change the files appropriately.  The ?PK? file only changes if there is a primary key change.  The 
changes are all obvious, if tedious.
c.	Check the files back in.
8.	Make the appropriate coding changes to utilize the changes to the table.
8.3	Changing The CustomerSearch Tables
Two tables, CustomerSearchP and CustomerSearchS, are designated as the search tables.  These tables 
are used to search for customers.  These tables must contain columns representing the criteria to be used in 
the search process and / or the data to be returned in the search results.  
When additional criteria are required or additional data is required in the search results, columns must be 
added to both CustomerSearchP and CustomerSearchS as follows:
1.	Follow the directions in the previous section ? for these tables are associated with entity beans.
2.	Add the new column names to the CCSApplicationSchema.java file in the CustomerSearchP and 
CustomerSearchS class definitions.
3.	Change the CustomerSearch.java file:
a.	Use one of the current variables as a model.  Everywhere this variable is found, add a new one 
representing the new column.
b.	This includes:
i.	Defining the variable.
ii.	Initializing it in the constructor.
iii.	Setting its value in one of the populate methods.
iv.	Adding it to a number of call argument lists.
v.	Adding it to a number of method parameter lists, including the comments at the beginning of the 
method.
vi.	Adding it to the toString() method.
4.	If there is a change to the criteria, change the CustomerSearcherCriteria.java file:
a.	Add the variable representing the criteria that is added.
b.	Change the method that extracts the request data.  E.g., when CustomerStatus was added, the 
method addStatusWhereClause() was changed.
c.	Change the method that creates the where clause from the data.  E.g., when CustomerStatus was 
added, the method getStatusData() was changed.
5.	If there is a change to the search results, change the CustomerSearcherIdentity.java file:
a.	Change the method that includs the data being added.  E.g., when CustomerStatus was added, the 
method customerIdentityStatus() was changed.




9.	WINDOWS DATABASE AUTHENTICATION
The natural authentication mode for CCS access to its database is SQL Server Authentication.  However, it 
can be made to work with Windows Authentication.  
The following steps must be executed for Windows Authentication to the database to work:
1.	When the SQL Server instance is installed, set server authentication to Window Authentication mode 
(instead of SQL Server Authentication mode and Window Authentication mode).
2.	Do the following for specific drivers:
a.	Microsoft SQL Server driver version 1.2 ? In addition to moving the jar file (sqljdbc.jar) to 
\Programs\Sun\AppServer_91\lib, also move the appropriate version of sqljdbc_auth.dll to that same 
folder.  (Alternatively, this file can be moved to \Programs\AppServers_91\Domains\CCSV4\lib.)  This 
file can be found in these 3 folders in the driver installation structure:
i.	sqljdbc_1.2\enu\auth\x86 ? 32 bit systems.
ii.	sqljdbc_1.2\enu\auth\x64 ? for 64 bit systems, non-Itanium.
iii.	sqljdbc_1.2\enu\auth\IA64 ? for 64 bit Itanium systems.
b.	Microsoft SQL Server driver version 2.0 ? In addition to moving the jar file (sqljdbc.jar) to 
\Programs\Sun\AppServer_91\lib, also move the appropriate version of sqljdbc_auth.dll to that same 
folder.  (Alternatively, this file can be moved to \Programs\AppServers_91\Domains\CCSV4\lib.)  This 
file can be found in these 3 folders in the driver installation structure:
i.	sqljdbc_2.0\enu\auth\x86 ? 32 bit systems.
ii.	sqljdbc_2.0\enu\auth\x64 ? for 64 bit systems, non-Itanium.
iii.	sqljdbc_2.0\enu\auth\IA64 ? for 64 bit Itanium systems.
c.	Microsoft SQL Server driver version 3.0 ? In addition to moving the jar file (sqljdbc.jar) to 
\Programs\Sun\AppServer_91\lib, also move the appropriate version of sqljdbc_auth.dll to that same 
folder.  (Alternatively, this file can be moved to \Programs\AppServers_91\Domains\CCSV4\lib.)  This 
file can be found in these 3 folders in the driver installation structure:
i.	sqljdbc_3.0\enu\auth\x86 ? 32 bit systems.
ii.	sqljdbc_3.0\enu\auth\x64 ? for 64 bit systems, non-Itanium.
iii.	sqljdbc_3.0\enu\auth\IA64 ? for 64 bit Itanium systems.
3.	During the CCS installation, after running create-CCS-domain, run one of the following:
a.	change-CCS-domain-for-WinAuth-2005-NoUnicode.cmd for a non-Unicode system.
b.	change-CCS-domain-for-WinAuth-2005-Unicode.cmd for a Unicode system.
This causes the parameter integratedSecurity=true to be added to the domain.xml database parameters.
4.	The job_config.xml file needs to be modified:
a.	Set crmdbuserid to blank (zero length).
b.	Set crmdbpassword to blank (zero length).
The changes that were required for this implementation were these:
1.	The change-CCS-domain-for-WinAuth-2005-NoUnicode.cmd and change-CCS-domain-for-WinAuth-
2005-Unicode.cmd files were added.
2.	The ccs_batch.cmd file was changed to include the \Programs\Sun\AppServer_91\lib folder on the path.  
The folder that contains the sqljdbc_auth.dll file must be on the path.
3.	The getConnection method in the AppServerSupporterSun81 class was changed.  It now checks the user 
ID parameter and if blank, assumes Windows Authentication and sets the integratedSecurity = true 
parameter.




10.	ADDING A CUSTOMER DATA ELEMENT
The customer?s data is composed of elements.  Elements can be added for a particular functional 
enhancement.  This section describes what must be done to add a customer element.
10.1	Java File Additions
1.	In the Customer object (base/sbeans/domain/customer/Customer.java):
a.	Add an object declaration in the customer?s data section at the beginning of the file.
b.	In finalizeInstantiationFromXML(), instantiate the new element (use current elements as a template ? 
it differs depending on whether the element is a single instance element (like Name) or a multiple 
instance element (like Address).
c.	In finalizeInstantiationFromXML(), there is a delete section at the bottom that the new element must 
be added into
d.	Add a getter method for this new object.
e.	Add a setter method for this new object.
f.	Add to the test in the equalsCountOnly() method.
g.	Add to the buildCustomerElementsList() method.
h.	If the element contains a secondary ID, add to the buildFetchableCustomerElementsList() method.
i.	Add to the equals() method.
j.	Add to the toString() method.
2.	In the CCSApplicationCustomer object (application/sbeans/domain/customer/ 
CCSApplicationCustomer.java):
a.	In finalizeInstantiationFromRequestDocument(), instantiate the new element (use current elements as 
a template ? it differs depending on whether the element is a single instance element (like Name) or a 
multiple instance element (like Address).
b.	In finalizeInstantiationFromOneAudit(), instantiate the new element (use current elements as a 
template ? it differs depending on whether the element is a single instance element (like Name) or a 
multiple instance element (like Address).
3.	In the ExistingCustomer object (application/sbeans/domain/customer/ExistingCustomer.java):
a.	Add to populateCustomerElements() method (initialize and populate)
b.	Add to populateCustomerElementsSQL() method (initialize and populate)
4.	In the ChangingCustomer object (application/sbeans/domain/customer/ChangingCustomer.java):
a.	In finalizeInstantiationFromMergedCustomer(), instantiate the new element (use current elements as 
a template ? it differs depending on whether the element is a single instance element (like Name) or a 
multiple instance element (like Address).
b.	Add to populateChangedCustomer() method
c.	Add to createCustomerFetchRows() method
5.	In the CustomerMerger object (application/sbeans/domain/customer/misc/CustomerMerger.java):
a.	Add to mergeSingleInstanceElements() or mergeMultipleInstanceElements()  method
b.	Add to prepareMergedCustomerForChange () method
c.	Add to adjustMergedCustomerAfterChange () method
d.	Add to adjustMergedCustomerBeforeCreate () method
6.	Add JUnit Test files to base/sbeans/domains/customer
7.	Add reference to new tests in TestAll.java in that same folder
10.2	Table Additions
1.	ElementIDs ? PopulateBaseData.sql ? add an entry for the new Element
2.	MDCustomerElements ? PopulateBaseData.sql ? add an entry for the new Element
10.3	When The Element Is A Secondary ID
1.	ElementIDs ? PopulateBaseData.sql ? add an entry for the new Element
2.	MDCustomerElements ? PopulateBaseData.sql ? add an entry for the new Element
3.	MDFetch ? PopulateApplicationData.sql ? add an entry for the new element
4.	SecondaryIDXRef ? PopulateApplicationData.sql ? add an entry for the new element
5.	Add SecondaryIDxxx.java file to Projects\CCSV4-Shopko\Java\src\com\fujitsu\ftxs\corema\ccs 
\base\sbeans\domain\misc folder.
6.	In Customer.java, method validate(), potentially add a check for customer type.
7.	In RequestHandlerCustomerFetch.java:
a.	In the constant section, add a new constant for the new ID, similar to 
REQUEST_ELEMENT_WEB_ID.
b.	In the variables section containing the secondary IDs, add a new variable for the new ID, similar to 
one of the others, either ?int? or ?String?.
c.	In getRequestParameters() method, add the new ID constant to the choices array.
d.	In getCustomerID() method, add a new else clause for the new ID, similar to one of the others, either 
?int? or ?String?.
e.	In getFetchID() method, add a new variable and a new else clause for the new ID, similar to one of 
the others, either ?int? or ?String?.
8.	In CCSBatchUtils:
a.	Change getExistingCustomerFromSecondaryID() method, extending it to include the new element.
b.	Add a getExistingCustomerFromxxxID() method.



11.	ADDING A REQUEST / RESPONSE PAIR
The following steps must be executed for an added auto-generated ID:
1.	Add the request and response to the XML schema
2.	Add an entry to the MessageTypeLookup table
3.	Add appropriate entries to the ResponseAttributes and MDAttributes tables
4.	Add test cases
5.	Add a request handler
6.	Add a response builder
11.1	The XML Schema
An XML schema definition is required for both the request and the response.  XMLSpy is the editor used to 
maintain these files.  The files are located in Documents\XMLSchema\Messages.
Use a current pair as the templates.
11.2	MessageTypeLookup Table
Each request/response pair is represented by a row in the MessageTypeLookupTable.  So, when a pair is 
added, another row must be added to that table.
The rows are added to the PopulateBaseTables.sql file and whatever update .sql file is being used if it is not 
the initial release.  These files can be found in the Database folder.
11.3	ResponseAttributes and MDAttributes Tables
Each response contains attributes generated via the ResponseAttributes table.  This table contains a row for 
each attribute ? each row contains the response ID from the MessageTypeLookup table) and the attribute ID 
(from the MDAttributes table).
Thus, for each new request/response pair added, attributes may have to be added to MDAttributes and a row 
must be added for each attribute to the ResponseAttributes table.
Add an attribute to the MDAttributes table containing the following fields:
1.	attributeID ? to link up with the ResponseAttributes table
2.	attributeName ? the attribute name
3.	attributeValType ? a code that specifies how the value of the attribute is determined:
a.	0 ? fixed text from the attributeValFixed column
b.	1 ? the response ID linked to the request ID in the MessageTypeLookup table
c.	2 ? the response name linked to the request name in the MessageTypeLookup table
d.	3 ? the value comes from the request attribute whose attribute ID is in the attributeValSource column
4.	attributeValFixed ? fixed text to be used for the attribute value when attributeValType = 0
5.	attributeValSource ? attribute ID of the request attribute that is to be used to supply this attribute?s value 
when attributeValType = 3
11.4	Test Cases
A set of test cases (XML requests) should be constructed for each request being added.  
A set of JUnit programs should be added to an appropriately named new folder under 
coremajunittests\ccs\requests.  Test files should be added to a similarly named new folder under 
Testing\JUnitTests\Requests.
Use current programs and files as a template.  Minimum tests should include TestAll, TestErrors and 
TestGeneral.
11.5	RequestHandler
A new request handler must be added to the applications\sbeans\requestresponse folder.  Use current files 
as a template.
11.6	ResponseBuilder
A new response builder must be added to the applications\sbeans\requestresponse folder.  Use current files 
as a template.



12.	ADDING AN AUTO GENERATED ID
CCS has a number of auto generated IDs ? e.g., CCS customer ID, logical row ID.  The following steps 
describe how to add another auto-generated ID:
1.	Add a new table based on the auto-generated tables that are already present (e.g., NextLoyaltyID) ? see 
section 8, Adding / Changing A Database Table.  The table must be both created and populated.
2.	Add a new entity bean for the new table ? see same section
3.	Change the CCSApplicationSchema.java file in the applications\misc folder:
a.	Add an entry in the tables section at the beginning, using one of the current next ID tables as a 
template
b.	Add a class for the new ID in the bottom section, using one of the current next ID tables as a template
4.	Change the CCSNextIDs.java file in the application\facade folder
a.	Add a ?currentID? variable at the beginning, using a current one as a template
b.	Add a section of comments for the new ID (using a current section as a template)
c.	Add three methods (using another ID as a template) ? getNextxx(), getNextxx(blocksize) and nextxx()
5.	Change the CCSNextIDs session bean:
a.	CCSNextIDsSession.java ? add 2 methods for the new ID (using current IDs as a template)
b.	CCSNextIDsSessionLocal.java ? add 2 methods for the new ID (using current IDs as a template)
c.	CCSNextIDsSessionBean.java ? add 2 methods for the new ID (using current IDs as a template)
6.	If the auto generated ID is added for an upgrade release, then the upgrade SQL file will need to have the 
same done as step 2.



13.	ADDING AN ERROR CODE
The following steps must be executed for an added error code:
1.	In either CCSErrorCodes.java or CCSApplicationErrorCodes add the new error in the appropriate part of 
the constants section of the file.
2.	For base enhancements, in the PopulateBaseData.sql or PopulateApplicationData.sql file (based on 
which file was chosen in step 1), add a row using an insert currently in that file as a template:
a.	First field is the language field ? currently we are using only ?US?
b.	Second field is the error code (from step 1)
c.	Third field is error code constant name (from step 1)
d.	Fourth field is the error code (same as b)
e.	Fifth field is the error text
3.	For customer enhancements, add the new error code (as specified in step 2) to the 
CreatePopulateXXXTables.sql file (where XXX is the customer designation). 
4.	If the error code is added for an upgrade release, then the upgrade SQL file will need to have the same 
done as step 2.
Error codes are assigned in number ranges:
*	100-110 ? errors generated by the Servlet listeners.
*	111-400 ? miscellaneous software problems.
*	401-499 ? address cleansing errors.
*	801-1000 ? common errors not related to a specific request or domain.
*	1001-100 ? customer update errors.
*	1071-1090 ? customer search errors.
*	1091-1100 ? customer fetch errors.
*	1421-1440 ? audit search errors.
*	1441-1460 ? transaction search errors.
*	1461-1480 ? transaction update errors.
*	1481-1500 ? loyalty update errors.
*	1501-1520 ? transaction adjustment update errors.
*	1521-1540 ? batch request errors.


14.	CCSEXCEPTION PROCESSING
One of the CCS conventions is the use of the CCSException class for exception processing.  A 
CCSException instance is created in the following cases:
1.	A Java exception is caught during processing.  CCS will create and throw a CCSException object.
2.	The CCS software determines a problem and needs to throw an exception.  CCS will create and throw a 
CCSException object.
Unfortunately, the CCSException is a checked exception and thus almost all methods must declare it in the 
throws clause.  This was a na?ve design choice that was made early on before the ramifications were 
understood ? and then it was too late.
CCS does the following things with a CCSException object:
1.	Create ? a CCSException object is created when a problem is detected.  The instantiation takes the 
following parameters:
a.	CCSTracer object:
i.	If done in a static method, use CCSTracer.getInstance(); which returns an instance of the Tracer 
object.
ii.	If this is done in a non-static method, use tracer, a reference to the Tracer object that is present in 
each object.
b.	Throwable object:
i.	If done because of catching an exception, then this argument is that Exception object (or 
Throwable object).
ii.	If not done because of catching an exception, then this argument is null.
c.	String object ? the class name:
i.	If done in a static method, use CLASS_NAME_STATIC.
ii.	If done in a non-static method, use CLASS_NAME.
d.	String object ? the method name ? use METHOD_NAME.
e.	int ? the error code.  The error code is defined in CCSErrorCodes.java or 
CCSApplicationErrorCodes.java.
f.	String object ? error description ? this description is text that should be detailed enough so that the 
problem can be understood with no ambiguity.
2.	Throw ? all created CCSException objects are thrown.  There may be an exception to this but it will be 
rare.  If it is not thrown, then its only purpose will have been to put something into the trace log.
3.	Catch ? occasionally a CCSException is caught, although this is rare.  It is not a good programming 
practice and should be avoided.
The CCSException object is tightly coupled to the Tracer object.  By virtue of instantiating a CCSException 
object, an entry will appear in the trace (see section 22.2) at trace level 1.  The class name and method name 
will be identified and the error description will be displayed.  If the second argument is not null, then a stack 
trace will be displayed as well as the original exception that was caught.
Here?s an example of a trace entry for a CCSException instantiation where CCS discovered the problem 
without catching an exception.
06/23/2010 08:31:06 T1 com.fujitsu.ftxs.corema.ccs.base.sbeans.domain.customer.Member:validate 1026 
JoinStoreID 1x is not a valid store ID  
Here?s an example of a trace entry for a CCSException instantiation where CCS caught an exception.
06/23/2010 08:31:06 T1 CCSFieldValidator:validateDate 827 TerminationDate x is not a correctly 
formatted date - must be yyyy-MM-dd java.text.ParseException: Unparseable date: "x"
06/23/2010 08:31:06 T1 java.text.ParseException: Unparseable date: "x"
	at java.text.DateFormat.parse(DateFormat.java:335)
	at 
com.fujitsu.ftxs.corema.ccs.base.sbeans.misc.CCSFieldValidator.validateDate(CCSFieldValidator.java:73
)
	at 
com.fujitsu.ftxs.corema.ccs.base.sbeans.domain.customer.CustomerElement.validateDate(CustomerElement.
java:1172)
	at com.fujitsu.ftxs.corema.ccs.base.sbeans.domain.customer.Member.validate(Member.java:331)
	at 
com.fujitsu.ftxs.corema.ccs.base.sbeans.domain.customer.Member.finalizeDataChange(Member.java:266)
	at 
com.fujitsu.ftxs.corema.ccs.base.sbeans.domain.customer.Member.finalizeInstantiation(Member.java:247)
	at 
com.fujitsu.ftxs.corema.ccs.base.sbeans.domain.customer.Member.finalizeInstantiationFromXML(Member.ja
va:234)
	at com.fujitsu.ftxs.corema.ccs.base.sbeans.domain.customer.Member.<init>(Member.java:168)
	at 
com.fujitsu.ftxs.corema.ccs.application.sbeans.domain.customer.CCSApplicationCustomer.finalizeInstant
iationFromRequestDocument(CCSApplicationCustomer.java:431)
	at 
com.fujitsu.ftxs.corema.ccs.application.sbeans.domain.customer.NewCustomer.populate(NewCustomer.java:
89)
	at 
com.fujitsu.ftxs.corema.ccs.application.sbeans.requestresponse.RequestHandlerCustomerUpdate.processCr
eateRequest(RequestHandlerCustomerUpdate.java:402)
	at 
com.fujitsu.ftxs.corema.ccs.application.sbeans.requestresponse.RequestHandlerCustomerUpdate.processSi
ngleCustomerUpdate(RequestHandlerCustomerUpdate.java:265)
	at 
com.fujitsu.ftxs.corema.ccs.application.sbeans.requestresponse.RequestHandlerCustomerUpdate.processRe
quest(RequestHandlerCustomerUpdate.java:219)
	at com.fujitsu.ftxs.corema.ccs.application.sbeans.facade.CCS.processCCSRequest(CCS.java:382)
	at com.fujitsu.ftxs.corema.ccs.application.sbeans.facade.CCS.processRequest(CCS.java:303)
	at 
com.fujitsu.ftxs.corema.ccs.application.sbeans.session.CCSSessionBean.processRequest(CCSSessionBean.j
ava:72)
	at sun.reflect.GeneratedMethodAccessor168.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)
	at java.lang.reflect.Method.invoke(Method.java:585)
	at 
com.sun.enterprise.security.application.EJBSecurityManager.runMethod(EJBSecurityManager.java:1067)
	at com.sun.enterprise.security.SecurityUtil.invoke(SecurityUtil.java:176)
	at com.sun.ejb.containers.BaseContainer.invokeTargetBeanMethod(BaseContainer.java:2895)
	at com.sun.ejb.containers.BaseContainer.intercept(BaseContainer.java:3986)
	at 
com.sun.ejb.containers.EJBObjectInvocationHandler.invoke(EJBObjectInvocationHandler.java:203)
	at 
com.sun.ejb.containers.EJBObjectInvocationHandler.invoke(EJBObjectInvocationHandler.java:120)
	at $Proxy143.processRequest(Unknown Source)
	at sun.reflect.GeneratedMethodAccessor167.invoke(Unknown Source)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)
	at java.lang.reflect.Method.invoke(Method.java:585)
	at 
com.sun.corba.ee.impl.presentation.rmi.StubInvocationHandlerImpl.privateInvoke(StubInvocationHandlerI
mpl.java:233)
	at 
com.sun.corba.ee.impl.presentation.rmi.StubInvocationHandlerImpl.invoke(StubInvocationHandlerImpl.jav
a:152)
	at com.sun.corba.ee.impl.presentation.rmi.bcel.BCELStubBase.invoke(BCELStubBase.java:225)
	at 
com.fujitsu.ftxs.corema.ccs.application.sbeans.session._CCSSession_DynamicStub.processRequest(com/fuj
itsu/ftxs/corema/ccs/application/sbeans/session/_CCSSession_DynamicStub.java)
	at 
com.fujitsu.ftxs.corema.ccs.application.clients.intface.CCSClientServlet.getResponseWithSlots(CCSClie
ntServlet.java:152)
	at 
com.fujitsu.ftxs.corema.ccs.application.clients.intface.CCSClientBasicServlet.doGet(CCSClientBasicSer
vlet.java:141)
	at 
com.fujitsu.ftxs.corema.ccs.application.clients.intface.CCSClientServlet.doPost(CCSClientServlet.java
:127)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:738)
	at javax.servlet.http.HttpServlet.service(HttpServlet.java:831)
	at 
org.apache.catalina.core.ApplicationFilterChain.servletService(ApplicationFilterChain.java:411)
	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:290)
	at 
org.apache.catalina.core.StandardContextValve.invokeInternal(StandardContextValve.java:271)
	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:202)
	at org.apache.catalina.core.StandardPipeline.doInvoke(StandardPipeline.java:632)
	at org.apache.catalina.core.StandardPipeline.doInvoke(StandardPipeline.java:577)
	at com.sun.enterprise.web.WebPipeline.invoke(WebPipeline.java:94)
	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:206)
	at org.apache.catalina.core.StandardPipeline.doInvoke(StandardPipeline.java:632)
	at org.apache.catalina.core.StandardPipeline.doInvoke(StandardPipeline.java:577)
	at org.apache.catalina.core.StandardPipeline.invoke(StandardPipeline.java:571)
	at org.apache.catalina.core.ContainerBase.invoke(ContainerBase.java:1080)
	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:150)
	at org.apache.catalina.core.StandardPipeline.doInvoke(StandardPipeline.java:632)
	at org.apache.catalina.core.StandardPipeline.doInvoke(StandardPipeline.java:577)
	at org.apache.catalina.core.StandardPipeline.invoke(StandardPipeline.java:571)
	at org.apache.catalina.core.ContainerBase.invoke(ContainerBase.java:1080)
	at org.apache.coyote.tomcat5.CoyoteAdapter.service(CoyoteAdapter.java:270)
	at 
com.sun.enterprise.web.connector.grizzly.DefaultProcessorTask.invokeAdapter(DefaultProcessorTask.java
:637)
	at 
com.sun.enterprise.web.connector.grizzly.DefaultProcessorTask.doProcess(DefaultProcessorTask.java:568
)
	at 
com.sun.enterprise.web.connector.grizzly.DefaultProcessorTask.process(DefaultProcessorTask.java:813)
	at 
com.sun.enterprise.web.connector.grizzly.DefaultReadTask.executeProcessorTask(DefaultReadTask.java:33
9)
	at com.sun.enterprise.web.connector.grizzly.DefaultReadTask.doTask(DefaultReadTask.java:261)
	at com.sun.enterprise.web.connector.grizzly.DefaultReadTask.doTask(DefaultReadTask.java:212)
	at com.sun.enterprise.web.connector.grizzly.TaskBase.run(TaskBase.java:265)
	at com.sun.enterprise.web.connector.grizzly.WorkerThreadImpl.run(WorkerThreadImpl.java:116)



15.	SQL STATEMENTS GENERATION
The Fast Lane Reader design pattern is a pattern used in EJB applications.  This pattern provides for JDBC 
access to a database table instead of entity bean access.  This pattern is used for read only data, like meta-
data tables, and for situations where the SQL has to be generated in real time ? e.g., for searches, for using 
extract tables whose table name changes daily.
CCS uses this design pattern.  When using this pattern, the Strategy pattern is also used.  The Strategy 
pattern is used to isolate the SQL that is generated.  SQL generation is best done in a relatively isolated way, 
since it may change from one database type to another (e.g., Microsoft SQL Server versus Oracle).
To generate some SQL for a JDBC database access, do the following: 
1.	In the file CCSApplicationSQLGenerator.java file in the applications\misc folder, add a method name for 
the method to be used to generate the SQL.  This file is an interface that defines all SQL generator 
methods.
2.	In the SQLGeneratorCommon.java file in the applications\misc folder, add the required method.  If the 
SQL for any of the database types in use (currently we only use SQL Server) is different, then add the 
appropriate method to that database?s version of SQLGeneratorxxx.java (e.g., 
SQLGeneratorSQLServer2000.java).
3.	Make the appropriate method call in the file requiring the SQL to be generated.
Note:  the CCSGenericTableAccess object (CCSGenericTableAccess.java in the base\misc folder) is used for 
all JDBC access.
Note:  the Object Factory pattern is used to get the appropriate SQLGeneratorxxx object instantiated.  The 
CCSApplicationSQLGeneratorFactory object (CCSApplicationSQLGeneratorFactory.java in the 
applications\misc folder) is used to do this.  The appropriate object is based on the ?databaseServerType? 
parameter in the CCS.properties file.



16.	CCS BATCH JOBS
Batch jobs are not part of the CCS engine functionality ? batch jobs should be seen as client applications to 
CCS.  Batch jobs are used for the following purposes:
1.	Import jobs ? import jobs are used to move data into CCS from an outside source ? e.g., a customer 
takeon load.
2.	Export jobs ? export jobs are used to move data from CCS to an outside source ? e.g., the standard 
customer export to a retailer?s data warehouse system.
3.	Miscellaneous jobs ? miscellaneous jobs are used for all other purposes ? e.g., to maintain the system, 
ageing out data at appropriate times.
There following sections are used to describe the batch jobs:
1.	The batch job framework ? how the source files are organized.
2.	The job_config.xml file ? how the batch jobs are set up to run.
3.	The Batch folder structure.
4.	The Batch logging scheme.
5.	The FTP structure.
6.	Testing Batch Jobs
16.1	Batch Job Framework
The CCS batch framework is organized as follows, in terms of packages:
1.	The com.fujitsu.ftxs.corema.ccs.batch package, containing:
a.	CCSBatchJob.java serving two purposes:
i.	It contains the ?main? for all batch jobs, starting up each job and then loading the appropriate 
class to handle the processing.
ii.	It contains data and methods common to all batch jobs.
b.	A number of supporting .java files
2.	The com.fujitsu.ftxs.corema.ccs.batch.imports package, containing:
a.	CCSImportJob.java, which contains all the data and methods common to all import jobs.  Most 
importantly, this file contains the processFile() method that will be used for most import jobs.  
Inheriting files normally only need to be concerned about the processing of a record and any end of 
file processing.
b.	CCSImportFile.java, which encapsulates input file processing.
c.	All import batch job .java files for specific jobs.
3.	The com.fujitsu.ftxs.corema.ccs.batch.exports package, containing:
a.	CCSExportJob.java, which contains all the data and methods common to all export jobs.
b.	CCSExportFile.java, which encapsulates export file processing.
c.	All export batch job .java files for specific jobs.
4.	The com.fujitsu.ftxs.corema.ccs.batch.misc package, containing all miscellaneous batch job .java files.
Sample .java files are provided for import, export and misc jobs.  These can be used as templates for new 
jobs ? or other (for already existing jobs) files can be used as templates.  Each new job will be represented by 
a .java file that has these responsibilities:
1.	Import
a.	Specific parameters for the job:
i.	Define the variables.
ii.	Get the values for those variables in the loadSpecificParameters() method.
iii.	Trace the values for those variables in the traceSpecificParameters() method.
b.	Run the job ? include any changes to the import flow by overriding the runTheJob() method ? it is not 
required to override this method and is not normally done.
c.	Process a record ? include all the logic for record processing in the processRecord() method (and any 
methods called) ? this is a required method.
d.	Process end of file ? include any logic required at end of file in the processEOF() method ? this is a 
required method, even if nothing has to be done.
e.	End of job processing ? include the logging of any unique counts in the reportEOJStats() method.
2.	Export
a.	Specific parameters for the job:
i.	Define the variables.
ii.	Get the values for those variables in the loadSpecificParameters() method.
iii.	Trace the values for those variables in the traceSpecificParameters() method.
b.	Run the job ? unlike import jobs, no runTheJob() method is provided by the base class.  For export 
jobs, all processing logic is required; it starts in this method and includes all called methods.
c.	End of job processing ? include the logging of any unique counts in the reportEOJStats() method.
3.	Misc
a.	Specific parameters for the job:
i.	Define the variables.
ii.	Get the values for those variables in the loadSpecificParameters() method.
iii.	Trace the values for those variables in the traceSpecificParameters() method.
b.	Run the job ? for export jobs, all processing logic is required; it starts in the runTheJob() method 
(which must be provided) and includes all called methods.
c.	End of job processing ? include the logging of any unique counts in the reportEOJStats() method.
16.2	job_config.xml File
All new jobs must have an entry in the job_config.xml file.  Use the jobs in there already as templates, unless 
there is some compelling reason to do a specific job differently.  The jobs break down into job steps like this:
1.	Import Jobs:
a.	Step 1 ? move the input file from the FTP structure to the stage folder.
b.	Step 2 ? process the input file.
c.	Step 3 ? archive the input file.
d.	Step 4 ? delete the input file from the stage folder.
2.	Export Jobs:
a.	Step 1 ? process the data from the extract table, creating an export file in the stage folder.
b.	Step 2 ? copy the export file to the FTP structure.
c.	Step 3 ? archive the export file.
d.	Step 4 ? delete the export file from the stage folder.
3.	Misc Jobs ? these jobs have a variety of job steps, depending on their functionality.
16.3	Batch Folder Structure
The Batch folder structure is built as part of a CCS installation.  It can be found directly under CCSV4.  This is 
the structure:
Batch
bin ? contains all the files required to run batch jobs, including the job_config.xml file.
data ? encapsulating folder for all files:
processed ? encapsulating folder for archived files:
Customers ? customer import files.
POSTransactions ? TLog files.
Stage ? folder files are imported from or exported to.
lib ? folder containing the batch software jar files.
logs ? folder containing the batch log files.
16.4	Batch Logging Scheme
Batch jobs have three layers of logging:
1.	History ? the batch system logs summary data about each job to the history_yyyymmdd.txt file.
2.	CCSBatch ? the batch system logs summary data about each job step to the CCSBatch_yyyymmdd.txt 
file.
3.	Individual batch job ? each individual batch job logs data to the jobNameddmmyyyy.txt file.
All log files are found in the \Projects\AppServers_91\Domains\CCSV4\Batch\logs folder.
16.5	FTP Structure
The FTP structure is used to support moving data into the CCS domain (for import jobs) and out of the CCS 
domain (for export jobs).  This structure is built as part of the CCS installation.  It can normally be found on 
the d drive and it consists of these folders:
TransferData
Imports
Customers
POSTransactions
Exports
Customers
16.6	Testing Batch Jobs
Batch job testing is done using the standard JUnit test methodology ? see section 25.  In addition to that, in 
order to adequately test any changes to the job_config.xml file (see section 16.2), running the batch job 
outside the JUnit structure is required.
The job can be run in the standard way from the DOS command line with the current directory set to the 
Batch/bin folder.  Before doing that, these steps must be done:
1.	Build the CCSInterface.jar file (BuildInterfaceJarD)
2.	Build the CCSBatch.jar file (BuildBatchJarD)
3.	Move both files to the Batch/lib folder



17.	CCS DATA EXTRACTION
CCS is often required to export data.  
The most common example is customer update data.  This may be required by a retailer?s data warehouse 
system, which is the case for Danier and Payless.  It may be required for a retailer?s legacy CRM system, 
which is the case for Dressbarn / Maurices.  
Another common example is email related.  CCS may be required to export customer related data for 
customers that have an email address.  This is the case at Godiva.
The data export process is a two step process:
1.	Extract the data into a database table.  
2.	Copy the data from that export table into a file that can be sent to the recipient.  
17.1	General Extraction Scheme
All of the CCS extraction source can be found in the com.fujitsu.ftxs.corema.ccs.application.sbeans.extract 
package.
Two files provide a base class for extraction processing:
1.	CCSApplicationExtractionWriter ? for real time processing extractions.
2.	CCSApplicationExtractionWriterForBatch ? for batch extractions.
Several files exist that extend these files.  They all begin ExtractionWriterFor and contain a suffix that 
describes their purpose.  These files can be used as a model to create any other files needed for new 
extractions that are required in the future.
There are also several ExtractionGenerator files in the package.  These files are used when the generation of 
the data is complicated enough to warrant it.  These files can also be used as a model to create any other 
files needed for new extractions that are required in the future.
17.2	Standard Customer Extraction
In the case of the customer data, the exporting is a three step process:
1.	Accumulate the data in the database in real time.  Each customer create and each customer change 
results in an entry in the ExtractForStandardCustomer table.
2.	Copy the data from the accumulating table into a daily table, once a day.  When the 
StandardCustomerExtractor job is run, the rows from the ExtractForStandardCustomer table are copied 
into the ExtractForStandardCustomerExtract_yyyymmdd table.  They are also copied into the 
ExtractForStandardCustomerSave table for backup purposes.
3.	Copy the data from the daily table to a file, either daily or weekly.  When the StandardCustomerExporter 
job is run, it can be run in one of two ways:
a.	Copy the data from the ExtractForStandardCustomerExtract_yyyymmdd table into a file.
b.	Copy the data from all the ExtractForStandardCustomerExtract_yyyymmdd tables since the last time 
the job was run.
17.2.1	Current Customer Extractions
There are currently three possible customer extractions / exports.  One of them, CAS, uses a non-standard 
export process that is not instructive here.  Therefore, we?ll consider only the other two:
1.	Standard
2.	NewEmail
Following is the explanation of how this is set up and works:
1.	Step 1 has no regard for what extracts / exports there are.  It always works the same.  Data is added to 
the ExtractForStandardCustomer table in real time.  Each CustomerUpdate request results in an entry.
2.	Step 2 is the StandardCustomerExtractor batch job.  This job has a parameter extracterSuffixes that 
specifies which extractions are required:
a.	extracterSuffixes=?Standard? for standard extract only.
b.	extracterSuffixes=?NewEmail? for new email extract only.
c.	extracterSuffixes=?Standard|NewEmail? for both extracts.
3.	This job (StandardCustomerExtractor) has another parameter, filteredUsers, which can be used to filter 
out updates for specific user values.  This is used when the receiver of the export data is also an importer 
and thus have no interest in receiving the changes they earlier sent.  Here?s an example of that parameter 
? filteredUsers=?Standard:Existing Customer Takeon?.  For the standard extract, all entries from the user 
?Existing Customer Takeon? will be filtered out and will not be part of the daily extract.
4.	Step 3 is the StandardCustomerExporter job.  It can be run as follows:
a.	If the standard extract only was done, this job is run with the extractTableName parameter set to 
ExtractForStandardCustomerExtract_yyyymmdd.
b.	If the new email extract only was done, this job is run with the extractTableName parameter set to 
ExtractForNewEmail_yyyymmdd.
c.	If both extracts were done, this job is run twice, each job having a different value for the 
extractTableName parameter.
17.2.2	Adding A Customer Extraction
This section describes how to add a new customer based extraction.  It will be described using the three step 
process again:
1.	There is no impact on this step.
2.	Step 2 is the StandardCustomerExtractor batch job.  This job has a parameter extracterSuffixes that 
specifies which extractions are required ? see previous section.  To add a new extract, the following must 
be done:
a.	Assign a new extracterSuffixes value.  For this example, let?s use ?NewExtract?.
b.	Add that new value to the extracterSuffixes parameter for the job in the job_config.xml file.  As an 
example, the parameter may change from extracterSuffixes=?Standard? to 
extracterSuffixes=?Standard|NewExtract?.
c.	Add a new source file.  In this example, the file name will be 
StandardCustomerDataExtracterObserverNewExtract.java.  This new file must use one of the other 
files as a model.  The purpose of the new file is to format the extract data as required.
3.	Step 3 involves setting up another version of the StandardCustomerExporter job to create a new export 
file.  
This scheme (at step 2) uses the Observer pattern as follows:
1.	Based on the extracterSuffixes parameter, the StandardCustomerExtractor job calls the register() method 
on a class named StandardCustomerDataExtracterObserverxxx where xxx is the value in the 
extracterSuffixes parameter.
2.	The register() method in the new file calls one or more of these methods in the caller:
a.	subject.registerForCreate(this); ? to register to get called when a create is being processed.
b.	subject.registerForChange(this); ? to register to get called when a change is being processed.
c.	subject.registerForUpdate(this); ? to register to get called when a create or a change is being 
processed.
3.	When the StandardCustomerExtractor job is processing a customer record, it will make calls to observers 
as follows:
a.	For a create, it will call all those that have registered with a subject.registerForCreate(this); call or a 
subject.registerForUpdate(this); call.
b.	For a change, it will call all those that have registered with a subject.registerForChange(this); call or a 
subject.registerForUpdate(this); call.
4.	Each new file must have a unique method to accept a call based on create (extractForCreate()), change 
(extractForChange()) and update (extractForUpdate()) and has the method programmed appropriately, 
based on the extract requirement.




18.	THE RM / LM INTERFACE
The interface between Relationship Manager and Loyalty Manager is a one way interface ? from CCS to LM.  
CCS sends requests to LM and LM returns a response.  CCS uses the LM ?helpdesk? API and can be thought 
of as a ?helpdesk? user, thus requiring a user ID and password to be set up in LM ? in this case CCS / CCS.
18.1	Request Processing
The following request processing makes use of the RM / LM interface:
1.	CustomerUpdate ? customer adds and customer changes are communicated from CCS to LM.  The data 
that CCS passes to LM is limited to the following:
a.	Name.
b.	Single phone number.
c.	Loyalty ID (aka card ID).
In addition, CCS can manage segments and offer progress during a CustomerUpdate requests.
2.	CustomerFetch ? if a CustomerFetch request contains the IncludeLoyaltySummary=?true? attribute, then 
CCS uses the RM / LM interface to retrieve the following data for the customer:
a.	HouseholdID.
b.	Loyalty IDs (aka card IDs).
c.	Segments.
d.	OfferProgress.
e.	Transactions .
3.	LoyaltyUpdate ? CCS provides for the following updates of LM data:
a.	Segments ? customers can be added or removed from segments.
b.	OfferProgress ? offer progress can be adjusted (any of the 4 totals may be changed).
18.2	The Interface Scheme
18.2.1	Updates
The interface for LM updates is a guaranteed delivery interface and thus is relatively complicated ? it works 
like this:
1.	Session Bean processing:
a.	Direct call ? CCS will make a direct call to LM using the LM ?helpdesk? API.  If this interface is active 
and there is no problem with the update request, then the request is processed cleanly and no other 
processing is required on the CCS side and a successful response is returned to the client 
application.
b.	JMS call ? if the direct call failed for any reason, CCS attempts a JMS call to put the request on the 
JMS queue.  This is an asynchronous queue with a guaranteed delivery.  If the JMS call is 
successful, no other processing is required on the CCS side and a successful response is returned to 
the client application.
c.	Error ? if the JMS call fails, an internal error 901 is generated and that error code is returned to the 
client application.  The request failed and no customer update was done (i.e., everything was rolled 
back).  The only known cause of this error is no more room in the queue.
2.	Message Bean processing:
a.	Message Bean processing is initiated when a message has been placed on the queue.  The message 
is picked up by the Message Bean.
b.	The store / forward table (ExtractForJMSSave) is checked to see if it is populated:
i.	If the table is not populated, the message is processed and sent to LM via a direct call.
ii.	If it is populated, the following occurs:
(1)	The current message is added to the store / forward table (ExtractForJMSSave).  This 
supports guaranteed delivery of messages in the appropriate order.
(2)	An attempt is made to empty the store / forward table (ExtractForJMSSave).  Messages are 
processed from the table in order from the top and processing continues as long as no error 
occurs.  With each success, the entry is removed from the store / forward table 
(ExtractForJMSSave).  If an error occurs, the entry in the store / forward table 
(ExtractForJMSSave) remains and processing is terminated.
18.2.2	Read Only
The interface for read only requests (e.g., CustomerFetch), is more straight-forward.  CCS sends requests to 
LM to retrieve the appropriate data.  If LM is not currently connect, an 810 error will be logged internally, but 
the request will be completed successfully.  I.e., the client application will get a response containing the 
customer?s profile data, but no LoyaltySummary data.
18.2.3	Blocked Interface
The interface can become blocked ? i.e., no updates can be processed ? for the following reasons:
1.	CCS cannot get a connection to LM.  This can normally be fixed by restarting the LM service.
2.	LM rejects the request.  The two most common causes are these:
a.	A software problem caused the LM request to be invalid.  An example of this is CCS sending a name 
suffix that is too big for LM.  
b.	An LM configuration caused LM to reject the request.  An example of this is the card length 
parameters being set incorrectly.
These problems normally require our intervention.  Sometimes in the case of a software problem, we will 
have to remove the top entry in the store / forward table (ExtractForJMSSave).
A blocked interface does not cause any specific problems other than a delay in getting the data to LM.  We 
have seen additional problems when this occurs during a high volume customer load procedure ? e.g., when 
loading data prior to go live:  These are the problems:
1.	When hundreds of thousands of requests are buffered up in the store / forward table 
(ExtractForJMSSave), when the blockage problem is finally fixed, it can take a long time for the saved 
messages to be processed (see the scheme above).  During that time, the load job will continue to add 
requests to the queue.  The queue can become full, thus causing the load program to experience 901 
errors (see the scheme above).  The import records associated with the 901 errors will be placed in the 
rejects file for the job and can be re-run later.
2.	If the CCSV4 service is restarted when the queue is not empty, the queued messages must be processed 
prior to the CCS being available ? and this may take a long time.  There are two choices when this 
occurs:
a.	Allow the queued messages to be processed.  During this time, no client activity (including batch 
jobs) is possible.
b.	The queue can be removed, as follows:
i.	Stop the CCSV4 service.
ii.	Delete this file ? \Programs\AppServers_91\Domains\CCSV4\imq\instances\imqbroker 
\fs370\message\QCoremaLoyaltyQueue\vrfile.
iii.	Start the CCSV4 service.  



19.	SYSTEM MAINTAINER SCHEME
The SystemMaintainer is a miscellaneous batch job whose goal is to maintain system files and tables by 
aging out the data at the appropriate time.
For each maintenance task (e.g., Audit table), there is a class file in the 
com.fujitsu.ftxs.corema.ccs.batch.misc.systemmaintainers folder (e.g., MaintainerAudit).  There is a 
relationship between the job?s expirations parameter and the class name, as follows:
1.	The expirations parameter is a set of paired parameters ? name and number of days.
2.	The name parameter is used as a suffix to Maintainer to make the class name.
For example, the parameter for the audit table is Audit:90, the class name to process the audit table 
maintenance is MaintainerAudit.  
Thus, when a new maintenance require arises, add the class, say MaintainerAbc and then add Abc:xxx to the 
expirations parameter (xxx is the number of days).
All added maintainer classes must extend the MaintainerCommon abstract class and must implement the 
following methods:
1.	maintainIt ? this method performs the required maintenance.  It normally maintains two counts:
a.	totalCount ? the count of all rows, for example.
b.	expiredCount ? the count of rows aged out, for example.
2.	reportResults ? this method reports the results of the maintenance.
Use any of the existing maintainers as a model.
 


20.	RETURNCENTER TRANSACTION EXTRACT PROCESSING
As part of ReturnCENTER processing, CCS records all transaction events in a daily extract table.  The extract 
table name is ExtractForRCTransaction_yyyymmdd.  This table can be used to export data to the retailer?s 
domain for reporting purposes.
The following events are recorded in this extract table:
1.	Create ? when a transaction is first entered into ReturnCENTER.
2.	Reserve ? when a SetReserve request is processed.
3.	ReserveSuspend ? when a SetSuspend request is processed.
4.	ReleaseSuspend ? when a ReleaseSuspend request is processed.
5.	Release ? when a Release request is processed.
6.	ForceRelease ? when a ForceRelease request is processed.
7.	AddAdjustment ? when an adjustment (a return) is entered into ReturnCENTER.
8.	DeleteAdjustment ? when an adjustment (a return) is removed from ReturnCENTER.
9.	InvalidLineItem ? when an invalid line item return is entered into ReturnCENTER.  For example, a return 
of an item that is not part of the transaction.  ReturnCENTER allows such returns and records them here.
10.	InvalidTender ? when an invalid tender return is entered into ReturnCENTER.  For example, a return of a 
tender that is not part of the transaction.  ReturnCENTER allows such returns and records them here.
11.	OrphReturnWithoutTry ? when a return transaction is entered into ReturnCENTER and the return 
transaction contains no original transaction data.
12.	OrphReturnWithTry ? when a return transaction is entered into ReturnCENTER, the return transaction 
contains the original transaction data but the original transaction is not in ReturnCENTER.
13.	PostVoid ? when a post void transaction is processed.
This extraction processing is performed by class files in the 
com.fujitsu.ftxs.corema.ccs.application.sbeans.extract.rctransaction package.  Here?s a brief summary of the 
class files in that package:
1.	ExtractionGeneratorForRCTransaction ? this interface describes the requirements for the various class 
files that implement it (one class file for each extract listed above).
2.	ExtractionGeneratorForRCTransactionAllEvents ? this is a base class for the various class files that 
implement it (one class file for each extract listed above).  It implements 
ExtractionGeneratorForRCTransaction.
3.	ExtractionGeneratorForRCTransactionXxx ? this represents the various class files that extend 
ExtractionGeneratorForRCTransactionAllEvents and handle the responsibility for the various extracts.  
The ?Xxx? is a suffix that matches the list above.
4.	ExtractionGeneratorFactoryForRCTransaction ? this factory class returns an instance of the appropriate 
class file based on the suffix in the list above.
5.	ExtractionWriterForRCTransaction ? this class manages the generic portion of the extraction writing.
The ReturnCENTER transaction event extraction scheme is tightly coupled with the AuditTransaction object 
and it works like this:
1.	Event processing finds these values somehow (this is the part that must be programmed when a new 
event is discovered):
a.	The transaction?s primary key data
i.	Store ID
ii.	Register ID
iii.	Register Transaction ID
iv.	Transaction Date
b.	Customer secondary ID associated with the transaction.
c.	User ID associated with the event.
d.	Reason code associated with the event.
e.	Comment associated with the event.
f.	ActionCode associated with the event.
g.	ActionData associated with the event.
2.	The following AuditTransaction method calls are made:
a.	Instantiation.
b.	populate ? all the values from above are passed in this call.
c.	insertOnline or insertBatch.
3.	The AuditTransaction object takes care of the rest of it:
a.	Instantiates an ExtractionWriterForRCTransaction object.
b.	Calls the populate method on that object.
c.	Calls the insertExtractionData on that object:
i.	The ExtractionGeneratorFactoryForRCTransaction class is called to get the appropriate instance 
to process the extract.
ii.	The populate method is called on that instance to populate it appropriately.
iii.	The data is inserted into the extract table.


21.	CCS CONFIGURATION
CCS has the following configuration files, all found in the CCSV4\config folder:
1.	CCS.properties ? this file contains all the configuration parameters for CCS processing.
2.	GCS.properties ? this file contains all the configuration parameters for the GCS listener (see section 5.1).
3.	RCGSS.properties ? this file contains all the configuration parameters for the RCGSS listener (see 
section 5.2).
These configuration files are described in detail in the CCSConfiguration.doc file (see Appendix C ? CCS 
Documents) and are not described here.
Parameters are used by CCS using a relatively complicated scheme.  CCS uses the standard Java Properties 
object/model but it is enhanced to provide defaults and validity checking.
To add a parameter, do the following:
1.	In the CCSApplicationConfigurationData.java file in the application\sbeans\misc folder, add two constants 
in the parameters constants section at the beginning ? one to define the parameter name and one to 
define its default value.
2.	In the setDefaults() method in the same file, add a statement for the new parameter, using the current 
statements as a template.
3.	If the parameter is an int or boolean parameter, in the validateParameters() method in the same file, add 
a statement for the new parameter, using the current statements as a template.
4.	In the toString() method in the same file, add the new parameter to the return statement, using the current 
parameters as a template.
To reference the parameter, here?s an example ?

CCSApplicationConfigurationData ConfigurationData
     = CCSApplicationConfigurationData.getApplicationInstance();        
if(configurationData.getParameterBoolean
                (CCSApplicationConfigurationData.BYPASS_MATCHING)) {
     return 0;
} 




22.	CCS LOGGING
This section describes the CCS logging:
1.	Request / Response logging.
2.	Trace logging.
3.	CCS / LM logging.
4.	GCS logging.
5.	RCGSS logging.
22.1	Request / Response Logging
CCS logs requests and responses into the CCSRequestLogxmmddyyyy.txt file.  ?x? represents the thread 
number.  There will be one of these files for each of the CCS threads run during the day.  Because of this, the 
request / response pairs will always be in the same file and contiguous.  
This logging is optional and is controlled by the requestLogLevel parameter in the CCS.properties file ? see 
section 21.  If this parameter is set to 3, the requests and responses will be logged.  If this parameter is set to 
1, the logging will be bypassed.
22.2	Trace Logging
CCS logs tracing and timing data into the CCSTracexmmddyyyy.txt file.  ?x? represents the thread number.  
There will be one of these files for each of the CCS threads run during the day.  Because of this, the tracing 
data for a single request will always be contiguous in this file.  
This logging is optional and is controlled by the traceLevel parameter in the CCS.properties file ? see section 
21.  The various settings work as follows:
1 ? Only exception messages are logged (Fatal error).
2 ? Only exception messages are logged (Non-fatal error).
3 ? Exception messages plus request timing results will be logged (Information).  
4 ? All of the above plus some minimum trace data is logged (Debug).
5 ? All of the above plus very detailed trace data is logged (Super debug).
Trace level 3 is used for production systems.  Trace level 4 is allowed in a production system only when the 
system is being monitored for a specific problem and that trace level is maintained for a limited period.  Trace 
level 5 should never be used in production.
22.3	CCS / LM Logging
CCS logs tracing data based on the requests and response to and from LM in the 
CCSJMSTracemmddyyyy.txt file.  There is only one of these files per day, so logging from various CCS 
threads are interspersed in this file.  
22.4	GCS Logging
CCS logs timing data for CCS processing in the GCS_mmddyyyy.txt file.  This GCS listener manages this file 
and it contains a good measure of CCS processing time for a request.  Although there is a traceLevel 
parameter for this file in the GCS.properties configuration file, the only useful value is 3.  
22.5	RCGSS Logging
CCS logs ReturnCENTER request and response data in the RCGSS_mmddyyyy.txt file.  This RCGSS 
listener manages this file and it contains the following:
1.	The client application ReturnCENTER request.
2.	The CCS request into which the listener has transformed the ReturnCENTER request.
3.	The CCS response.
4.	The ReturnCENTER response into which the listener has transformed the CCS response.
There is only one of these files per day, so logging from various CCS threads are interspersed in this file.  
That makes it difficult to debug production problems.
Although there is a traceLevel parameter for this file in the RCGSS.properties configuration file, the only 
useful value is 3.


23.	INTERNATIONALIZATION
Internationalization is currently restricted to the following items:
1.	The ErrorCodes table contains a language field ? see section 13. 
2.	The <AdditionalInfo> element of the error response.  This is handled using the Java ResourceBundle 
scheme.  The CCS processing is encapsulated mostly in the CCSExceptionDescription object.  To use it, 
use the RequestHandler objects as a template.  The translation occurs in the files in the 
CCSV4\resourceBundles folder.   The following things must be considered and understood:
a.	Create an array of Object objects to represent the AdditionalInfo text.  All String object will be 
translated.  Non-String objects will not be translated.  
i.	So put all non-translatable parts (normally the run-time values) into StringBuffer objects or Integer 
objects, etc.
ii.	Put the text to be translated into a String object (?literal? works fine).  However, this String object 
is just the key to a key/value pair translation.  So it does not have to be the whole String, just 
enough to make it unique in the method it is in.  I.e., the key is formed by the class name + the 
method name + some portion of the String (pipe separated).
b.	One entry is required in each resource bundle property file for each error response requiring the 
AdditionalInfo.  The entry looks like this ? CLASSNAME|METHODNAME|keytext=translated text.  All 
blanks in the keytext field must be represented by the Unicode escape ?\u0020?.  The Unicode 
escape for blanks is only required for the first character of the translated text (if it?s a blank).  All other 
blanks in the translated text (including trailing blanks) will be handled.  Here?s an example ? 
CCSRequest|validateNumber|\u0020must\u0020be=\u0020must be.
3.	The AssociativeTables table contains a language field.
The CCS must support multiple languages at the same time ? i.e., one language for some requests, another 
language for other requests.  The scheme employed works like this:
1.	A parameter exists in the CCS.properties file that specifies the default language to be used ? 
defaultLanguage.
2.	Clients can specify the language to be used for processing any request by including the common 
(common to all requests) attribute Language.  If no Language attribute is supplied (or if the value supplied 
is not one of those that is supported) the default language is used ? based on the defaultLanguage 
parameter described in item 1.
Currently we support the following languages:
1.	English ? US.
2.	Canadian French ? CF.
3.	Chinese ? CN.
All CCS error codes are found in the ErrorCodes table.  Most of these errors are not possible in a production 
environment ? the error codes that are possible should be translated for an international implementation, for 
example (but not limited to):
805, 807, 809, 810, 829, 1071, 1072.
This translation is accomplished by adding a row to the ErrorCodes table for each possible error.  The 
language column should contain the appropriate language code (e.g., CF for Canadian French) and the 
clientDesc column should contain the translated text.  All other columns are the same.
There are additional translations possible in resource bundles for additional information on some of the error 
messages.  However, these are virtually impossible in a production environment and the translation is not 
necessary.
The AssociativeTables table also contains a language column.  Any of the entries in this table can be 
duplicated and translated appropriately.




24.	JAVA CODING CONVENTIONS
CCS uses the standard Sun Java Coding Conventions (see http://java.sun.com/docs/codeconv/ ) with certain 
emphases and additional standards developed for CCS.
The following standards are important to the use and readability of CCS code and should be maintained:
1.	General ? follow the already established and obvious readability coding model in each file.
2.	There should be no errors or warnings when using the Eclipse setting described here ? Appendix A ? 
Eclipse .
3.	All literals should be found only in a constant definition ? e.g., final String ?CCS?;.  Literals that will be 
used outside the defining class file should be public and static ? e.g., public final static String ?CCS?;. 
4.	No line to exceed 80 characters:
a.	Break after a comma when possible.
b.	Break before an operator.
5.	For each method, provide the following comment section:
a.	Single line summary for the method.  Make it a phrase beginning with a verb ? e.g., ?Returns true if 
the flag is set?.  End it with ?<P>?.
b.	If the method needs further description, provide a paragraph under the summary line.
c.	Provide an ?@param? line for each method parameter.
d.	Provide an ?@return? line when the method returns a value.
e.	Provide an ?@throws? line when the method throws an exception.
6.	For each file, provide the following constants:
a.	final static String CLASS_NAME_STATIC = ?class name?;.
b.	final String CLASS_NAME = this.getClass().getName();.  This one is not required in sub-classes.
7.	For each method, the following two lines always start the method:
a.	final String METHOD_NAME = ?method name?;
b.	//tracer.traceIt(tracer, CCSTracer.DEBUG, CLASS_NAME + ? :? + METHOD_NAME);



25.	JUNIT TESTING INTEGRATION
JUnit testing is tightly integrated with CCS.  I.e., CCS contains:
1.	The JUnit software ? packaged in the junit.jar file that can be found in the CCSV4\Server\lib\common 
folder (it is downloaded from PVCS along with all the other jar files in this folder).
2.	JUnit test class files ? all the files in all the packages in the com.fujitsu.ftxs.coremajunittests package and 
all sub-packages are JUnit test class files.
3.	JUnit test files ? all the files in the CCSV4\Testing\JUnitTests folder are JUnit test files.  Test files include:
a.	CCS request files that simulate client application requests.
b.	SQL script files used to populate database tables as part of a test.
c.	Batch test files.
The maintenance of the JUnit class files and the JUnit test files is an important part of CCS maintenance, 
along with the maintenance of the CCS files.  The current files should always be used as a model when 
creating new files.  
This section describes the structure of the JUnit test class files and the JUnit test files.  This section also 
describes how to run JUnit tests.
25.1	JUnit Test Class Files Structure
The JUnit test class files are found under the com.fujitsu.ftxs.coremajunittests package.  The files are 
organized as follows:
1.	Root package ? this package contains:
a.	TestAll.java ? to run all tests in this package and all packages under this one.
b.	TestUtils.java ? an encapsulation of utility test methods available to all test programs.
c.	TestStartUp ? to run a start up test.
2.	application package:
a.	TestAll.java ? to run all tests in this package and all packages under this one.
b.	clients package:
i.	TestAll.java ? to run all tests in this package and all packages under this one.
ii.	Client based test program(s).
iii.	Further sub-packages testing ReturnCENTER requests.
c.	sbeans package:
i.	TestAll.java ? to run all tests in this package and all packages under this one.
ii.	Various class unit tests.
3.	base package:
a.	TestAll.java ? to run all tests in this package and all packages under this one.
b.	Various class unit tests.
4.	batch package
a.	TestAll.java ? to run all tests in this package and all packages under this one.
i.	imports package:
(1)	TestAll.java ? to run all tests in this package and all packages under this one.
(2)	Various test programs for import batch jobs.
ii.	exports package:
(1)	TestAll.java ? to run all tests in this package and all packages under this one.
(2)	Various test programs for export batch jobs.
iii.	misc package:
(1)	TestAll.java ? to run all tests in this package and all packages under this one.
(2)	Various test programs for misc batch jobs.
5.	requests package
a.	TestAll.java ? to run all tests in this package and all packages under this one.
b.	A package for each request:
i.	TestAll.java ? to run all tests in the package.
ii.	Various test files to test the request completely.
25.2	JUnit Test Files Structure
The JUnit test files structure is the same as the JUnit class files structure.  I.e., the CCSV4-
xxx\Testing\JUnitTests folder matches up with the CCSV4-xxx\Java\src\com\fujitsu\ftxs\coremajunittests\ccs 
folder and the folders under these are the same.
Thus, the test files for any test program can be found in the corresponding test folder structure.  Although this 
seems logical and convenient, it does represent a design flaw.  The test files should have been organized by 
function.  For example, all the customer create request files should be in a single structure, all the SQL script 
files should be organized separately.  Had it been done that way, file duplication would have been minimized 
? that would be a good thing.  This is something that should be considered for the next version of the product.
25.3	Running JUnit Tests
Running the complete suite of JUnit tests is very convenient ? it is done with a single command - 
..\..\Testing\JUnitTests\JUnitTests.  However, running the complete suite of tests is not the norm; it is probably 
only done as part of a package release.  Normally, we want to run some sub-set of the tests.
The remainder of this section describes how to run a sub-set of the tests.
A test run may be made at any package level.  Each level has a JUnitTests.bat file and a corresponding 
TestAll.java file that provide for all tests at that level and below to be run.  Thus, the first step is to determine 
at what level the tests should be run.  As an example, let?s say we want to run all the CustomerUpdate / 
Create tests.  In order to do that, the following is executed in the Test session - 
..\..\Testing\JUnitTests\Requests\Customer\Update\Create\JUnitTests.
More common than this is the requirement to run a single test at the bottom of a folder or package structure.  
As an example, let?s say we want to run a single CustomerUpdate / Create test, say the test represented by 
the testEmailStatus() method in the TestGeneral.java file in the 
com.fujitsu.ftxs.coremajunittests.ccs.requests.customer.update.create package.  Here?s what must be done:
1.	Modify the TestAll.java file in the com.fujitsu.ftxs.coremajunittests.ccs.requests.customer.update.create 
package.  Comment out all the suite.addTest calls except this one ? suite.addTest(TestGeneral.suite);.
2.	Modify the TestGeneral.java file in the 
com.fujitsu.ftxs.coremajunittests.ccs.requests.customer.update.create package.  Add an x prior to the 
method name for all methods except the testEmailStatus() method.  For example, the testMaximum() 
method becomes xtestMaximum().  By adding the x, the method is no longer considered a JUnit test 
method and it will not be called by the JUnit infrastructure.
3.	In the Test session, execute this command - 
..\..\Testing\JUnitTests\Requests\Customer\Update\Create\JUnitTests.  It will result in just the one test 
being run.
4.	After the test has been run such that the objective of running the test has been completed, then all the 
changes above must be undone.



26.	APPENDIX A ? ECLIPSE 
26.1	Eclipse Settings 
This section describes the settings used with Eclipse 3.2.1.  All CCS developers should use these settings.  
The settings can be seen by doing the following while in Eclipse:
1.	Click Window, then Preferences?
2.	Expand Java.
3.	Expand Compiler
4.	Select one of the following:
a.	Error/Warnings
b.	Javadoc
c.	Code Style / Code Templates


26.1.1	Error/Warnings
 
 
 
 
 



26.1.2	Javadoc
 



26.1.3	Code Style / Code Templates
These settings are used for the automatic generation of getters and setters.
 
 



26.1.4	Eclipse Project Setup 
This section describes how to set up a project in Eclipse.  For this example, the project is CCSV4-2010.  We 
assume that it has already been populated as described section 3.2.2.  These are the steps to follow:
1.	Click File and select New --> Project.  This dialog box is displayed ?
 



2.	Click Java project and then Next.  This dialog box is displayed ?
 
 
3.	Click the Create project from existing source radio button
4.	Type in the project name (CCSV4-2010) and click Finish.



27.	APPENDIX B ? DEBUG SETUP
Eclipse and Glassfish work together to provide a real-time debugging facility.  Here is a good article on that ? 
http://linuxdevices.com/articles/AT6046208714.html.
This is accomplished as follows:
1.	One-time setup for a domain in Glassfish:
a.	In the domain.xml file in the config folder, search for debug-enabled and set its value to true.
2.	CCS build must generate line numbers.  This is done automatically by the CCS build command ? 
BuildSunD ? see section 3.6.4.3.  
3.	Eclipse setup prior to debug session:
a.	Click Run, then Debug?
b.	In the dialog box that appears, 
i.	Select Remote Java Application
ii.	If this is the first time for a given project:
(1)	Click the New Icon in the upper left.
(2)	Enter the data for the project:
(a)	A name.
(b)	The folder name.
(c)	Port number 9009.
(3)	Click Debug.
iii.	If this is not the first time for a given project:
(1)	Select the appropriate project under the Remote Java Application selection in the left panel.
(2)	Click Debug.


Here is the dialog box that appears after clicking Run / Debug.
 

Standard Eclipse debugging can then be used.  One hint for debugging CCS ? by its nature, everything goes 
through a Request Handler.  Thus, pick the Request Handler being used in the test (e.g., 
RequestHandlerCustomerUpdate) and set a breakpoint in processRequest() or in getRequestParameters() 
and then go from there.
This interactive debugging is not available for batch programs.


28.	APPENDIX C ? CCS DOCUMENTS
This section lists all the CCS documents that specify various portions of the product.  Some or all of these 
documents may need to be updated when a change is made to CCS.
All the documents are found in this structure:
CCSV4
       Documents
       ReturnCenter
XMLSchema
       DomainData
       Extractions
       Messages
       ReturnCenter
The following documents may need to be changed:
1.	CCSV4 / Documents:
a.	CCSConfiguration ? this document describes all the parameters that are in the CCS.properties file.  
Whenever a parameter change is made, this file should be updated.
b.	ClientInterfaceToCCS ? this document describes in detail the client application interface to CCS.  
Whenever the interface changes ? e.g., a new request is added or a current request is changed ? this 
document should be updated.
2.	CCSV4 / Documents / ReturnCenter:
a.	FTXS-RC-006 Transaction Log File Format ? this document describes the processing of the 
GlobalSTORE TLog file.  When new fields are added that must be processed, this document should 
be updated.
b.	FTXS-RC-007 Message Formats ? this document describes the GlobalSTORE to ReturnCENTER 
interface.  When the interface changes ? e.g., a new request is added or a current request is changed 
? this document should be updated.
3.	CCSV4 / Documents / XMLSchema ? this structure contains XSD files defining the various XML 
components in the system.  Whenever any of these components changes, the corresponding XSD file 
should be changed.  Note: the XSD files are currently used only to define the XML visually, they are not 
certified to be used as validation files or programmatically in any other way.  
a.	DomainData ? this folder contains the XSD files describing the various CCS domains (e.g., the 
Customer structure).
b.	Extractions ? this folder contains the XSD files describing the XML extractions available with CCS.
c.	Messages ? this folder contains all the XSD files describing the CCS requests and responses.
d.	ReturnCenter ? this folder contains all the XSD files describing the ReturnCENTER CCS requests 
and responses.


29.	APPENDIX D ? USEFUL BATCH / COMMAND FILES
This section contains a number of batch / command files that can be useful in managing CCS in a 
development environment.
They are organized as follows:
1.	Files that go in the domain root folder.
2.	Files that go in a personal folder that is on the path.
29.1	Domain Files
These files go in the domain root folder (e.g., CCSV4).  They are used to start and stop the server in a 
development environment:
1.	startSplitCCS ? to start CCS.
2.	stopCCS ? to stop CCS.
29.1.1	startSplitCCS
This file is executed with no parameters (everything is set up in setEnv.cmd).
@echo off
SETLOCAL

@REM *************************************************************************
@REM This script is used to start the CCS in the
@REM current working directory.  
@REM *************************************************************************

REM set drive letter

set DRIVE=%CCS_DRIVE%

@rem set this stuff for development mode only
set PRODUCTION_MODE=false

@REM Initialize the common environment.
call setEnv.cmd %DRIVE% %2

if "%AS_INSTALL%" == "" echo "No App Server environment set or found" & goto end

call setPaths %DRIVE%

echo Starting the development version of the Sun 91 version of CCS Version 4 ...

asadmin start-domain --domaindir .. %SERVER_NAME%

:end
ENDLOCAL
29.1.2	stopCCS
This file is executed with no parameters.
@echo off
SETLOCAL

@REM *************************************************************************
@REM This script is used to stop the CCS in the
@REM current working directory.  
@REM *************************************************************************

REM set drive letter
if "" == "%1" goto DEFAULT
set DRIVE=%1
goto CONTINUE

:DEFAULT
if NOT "" == "%DRIVE%" goto CONTINUE
set DRIVE=D

:CONTINUE

@REM Initialize the common environment.
call setEnv %DRIVE%

if "%AS_INSTALL%" == "" echo "No App Server environment set or found" & goto end

call setPaths


echo Stopping %SERVER_NAME%

asadmin stop-domain --domaindir %DOMAIN_DIR% %SERVER_NAME%

:end
ENDLOCAL
29.2	Personal Files
These files go into a personal folder outside the CCS structure.  That folder should be on the path:
1.	CCSV4 ? support file for the other files in this section.
2.	Build91 ? to set up a DOS session for building CCS and its components.
3.	Test91 ? to set up a DOS session for JUnit testing.
4.	Server91 ? to set up a DOS session for running the CCS application.
Additionally, add the environmental variable ORIGINAL_PATH ? this should have the same value as the 
PATH variable.
29.2.1	CCSV4
This file is not executed manually ? it is called by one of the next three files.
@echo off
@rem *************************************************************************
@rem This script is used to set up your environment for development with CCS
@rem It is used for setting up a server window, a test window and a build window
@rem     CCSV4 d Server WL81 - server window for base (WebLogic version)
@rem     CCSV4 d Test Sun81 - test window for base (Sun version)
@rem     CCSV4 d Build Sun91 AMC - build window for AMC
@rem     CCSV4 d Build Sun91 DBM - build window for Dressbarn / Maurice''s
@rem     CCSV4 d Build Sun91 Davids - build window for David''s Bridal
@rem     CCSV4 d Build Sun91 RS - build window for Radio Shack
@rem     CCSV4 d Build Sun91 Shopko - build window for Shopko
@rem     CCSV4 d Build Sun91 2010 - build window for 2010 version
@rem *************************************************************************

REM set drive letter
if "" == "%1" goto DEFAULT
set DRIVE=%1
goto CONTINUE_AFTER_SET_DRIVE

:DEFAULT
goto USAGE

:CONTINUE_AFTER_SET_DRIVE

set PATH=%ORIGINAL_PATH%

@rem Make sure all parms are present (#4 is optional)
if "%2" == "" goto USAGE
if "%3" == "" goto USAGE

@rem Set window type
if "%2" == "Server" goto SET_WINDOW
if "%2" == "Test" goto SET_WINDOW
if "%2" == "Build" goto SET_WINDOW
goto USAGE

:SET_WINDOW
set WINDOW_TYPE=%2

@rem Set AppServer Type
if "%3" == "WL81" goto SET_APPSERVER_APPSERVERS
if "%3" == "Sun81" goto SET_APPSERVER_APPSERVERS
if "%3" == "Sun91" goto SET_APPSERVER_APPSERVERS_91
goto USAGE

@rem Set path for WL81/Sun81
:SET_APPSERVER_APPSERVERS
set APP_SERVERS=AppServers

goto SET_APPSERVER

@rem Set path for Sun91
:SET_APPSERVER_APPSERVERS_91
set APP_SERVERS=AppServers_91
set PATH=%DRIVE%:\Programs\Sun\AppServer_91\bin;%PATH%


:SET_APPSERVER
set APPSERVER=%3

@rem Set Customer
if "%4" == "" goto SET_CUSTOMER
if "%4" == "Danier" goto SET_CUSTOMER
if "%4" == "Payless" goto SET_CUSTOMER
if "%4" == "Godiva" goto SET_CUSTOMER
if "%4" == "AMC" goto SET_CUSTOMER
if "%4" == "DBM" goto SET_CUSTOMER
if "%4" == "Davids" goto SET_CUSTOMER
if "%4" == "RS" goto SET_CUSTOMER
if "%4" == "Shopko" goto SET_CUSTOMER
if "%4" == "2010" goto SET_CUSTOMER
goto USAGE

:SET_CUSTOMER
set CUSTOMER=%4

@rem Go to domain location
%DRIVE%:
if "%CUSTOMER%" == "" goto SET_BASE_HOME
if "%CUSTOMER%" == "2010" goto SET_BASE_HOME_2010
cd \Programs\%APP_SERVERS%\Domains\CCSV4-%CUSTOMER%
goto CONTINUE_AFTER_SET_HOME

:SET_BASE_HOME
cd \Programs\%APP_SERVERS%\Domains\CCSV4-%APPSERVER%
goto CONTINUE_AFTER_SET_HOME

:SET_BASE_HOME_2010
cd \Programs\%APP_SERVERS%\Domains\CCSV4-2010
:CONTINUE_AFTER_SET_HOME

@rem Set the environment
call setEnv.cmd %DRIVE%

@rem Go to project home location
%DRIVE%:
if "%CUSTOMER%" == "" goto SET_BASE_PROJECT_HOME
cd \Projects\CCSV4-%CUSTOMER%
goto CONTINUE_AFTER_SET_PROJECT_HOME

:SET_BASE_PROJECT_HOME
cd \Projects\CCSV4
:CONTINUE_AFTER_SET_PROJECT_HOME


rem if "%APPSERVER%" == "WL81" goto CONTINUE_AFTER_SET_ENVIRONMENT
rem @rem Adjust for Sun81 Customers
rem if "%CUSTOMER%" == "" goto SET_ENVIRONMENT_BASE
rem set CCS_HOME=%DOMAIN_DIR%\CCS%CUSTOMER%-%APPSERVER%
rem goto CONTINUE_AFTER_SET_ENVIRONMENT
rem :SET_ENVIRONMENT_BASE
rem set CCS_HOME=%CCS_HOME%-%APPSERVER%
rem :CONTINUE_AFTER_SET_ENVIRONMENT
rem call %CCS_HOME%\setEnv.cmd %DRIVE%

@rem Go to the appropriate directory
if "%WINDOW_TYPE%" == "Test" goto SET_TEST
if "%WINDOW_TYPE%" == "Build" goto SET_BUILD

@rem Server location
cd %CCS_HOME%
goto CONTINUE_AFTER_SET_LOCATION

@rem Test location
:SET_TEST
cd java\classes
goto CONTINUE_AFTER_SET_LOCATION

@rem Buildlocation
:SET_BUILD
cd Build
goto CONTINUE_AFTER_SET_LOCATION

:CONTINUE_AFTER_SET_LOCATION
@echo ****************************************************************************
if "%CUSTOMER%" == "" goto DISPLAY_BASE
@echo   Ready for %WINDOW_TYPE% for AppServer %APPSERVER% for customer %CUSTOMER%
goto CONTINUE_AFTER_DISPLAY
:DISPLAY_BASE
@echo   Ready for %WINDOW_TYPE% for AppServer %APPSERVER% for Base
:CONTINUE_AFTER_DISPLAY
@echo ****************************************************************************

goto END


:USAGE
@echo ****************************************************************************
@echo Improper usage - it must be ...
@echo    CCSV4 driveletter {Server/Test/Build} {WL81/Sun81/Sun91} 
[Danier/Payless/AMC/Godiva/DBM/Davids]
@echo ****************************************************************************

:END

29.2.2	Build91
This file is executed with one parameter ? the customer designation.  If a drive other than d is being used, 
change the d between CCSV4 and Build to the drive letter being used.
@echo off
call CCSV4 d Build Sun91 %1
29.2.3	Test91
This file is executed with one parameter ? the customer designation.  If a drive other than d is being used, 
change the d between CCSV4 and Build to the drive letter being used.
@echo off
call CCSV4 d Test Sun91 %1
29.2.4	Server91
This file is executed with one parameter ? the customer designation. If a drive other than d is being used, 
change the d between CCSV4 and Build to the drive letter being used.
@echo off
call CCSV4 d Server Sun91 %1



30.	APPENDIX E ? CUSTOMER IDS
CCS assigns a customer ID to each customer.  In addition, a customer may have one or more secondary IDs.  
This section describes these IDs:
1.	CCS Customer ID ? this is the CCS assigned customer ID.  This ID normally does not have visibility 
outside of CCS and its client applications.  I.e., retailer personnel are not normally aware of this ID, but 
software programs (client applications) are aware of it.
2.	Loyalty ID ? this is a CCS secondary ID.  It is the Loyalty Manager card ID.  This ID may be assigned by 
CCS or it may be assigned by the client application when creating a customer.
3.	Internal Customer ID ? this is a CCS secondary ID.  It is the retailer?s primary number for the customer.  It 
may be a mail order ID for example.  This ID may be assigned by CCS or it may be assigned by the client 
application when creating a customer.
4.	Employee ID ? this is a CCS secondary ID.  This ID is assigned by the client application when creating a 
customer.
5.	Member ID ? this is a CCS secondary ID.  It is a retailer?s member number for the customer ? e.g., in a 
co-op situation.  This ID may be assigned by CCS or it may be assigned by the client application when 
creating a customer.
6.	Web ID ? this is a CCS secondary ID.  It is a retailer?s web site user ID for the customer.  This ID is 
assigned by the web site application when creating a customer.  This ID has not been used as of this 
writing.
7.	Return Center ID ? this is a CCS secondary ID.  It is used for velocity checking of non-receipt returns for 
ReturnCENTER.  Current usage is the hashed plus masked value of the customer?s driver?s license.  This 
ID is assigned by the client application when creating a customer.


31.	APPENDIX F ? CCS IDIOSYNCRASIES
This appendix describes some of the idiosyncrasies that exist in and around the CCS.  
31.1	XML Parsing
The Xerces software is used for XML parsing.  Very rarely, but it does happen, a valid XML document will fail 
to be parsed ? a Java exception ArrayOutOfBounds occurs.  The number 16384 is displayed as part of that 
exception.  We have not figured out how to preclude this from happening.  However, the work-around is 
simple.  Just add or subtract a byte (blank character) from the source of the document and then it will work 
fine.  For example, if it?s a TLog file, add a blank into the file at the end of one of the lines.
31.2	Startup Problem
There have been cases where CCS would not start up.  These are the known cases:
1.	The previous shutdown had a failure and a lock file was left in place.  The lock file (file name is ?lock?) can 
be found in this folder ? \Programs\AppServers_91\Domains\CCSV4\imq\instances\imqbroker.  If the file 
is deleted, CCS will start up at the next attempt.
2.	Port conflict.  CCS has several ports assigned to it during installation and it is assumed that these ports 
will be available.  There have been cases where a server is restarted, another process is started before 
CCS and allocates one of these ports.  In that case, CCS fails to startup and a ?port conflict? error can be 
found in the server.log file.  Normally, restarting the server again will solve it and CCS will start up.  If the 
problem becomes permanent, the other process must be found and somehow altered.
31.3	Problem After Restart
Very rarely this problem has occurred after a CCSV4 restart.  The symptom is that an 805 error occurs on a 
CustomerUpdate request ? a data overrun occurs on a field in the Audit table.  Normally, restarting the server 
again will solve it.


32.	APPENDIX G ? TLOG FILE PROCESSING
CCS imports GlobalSTORE TLog files for one or more of the following purposes:
1.	In Relationship Manager, we have the ability to display a customer?s transactions.
2.	In ReturnCENTER, we can search for a transaction and deliver a transaction to GlobalSTORE so a return 
can be made against it.
The following types of TLog files have been imported by CCS:
1.	Native GlobalSTORE files ? these files are imported at Godiva.  These files are used only for Relationship 
Manager processing.
2.	StoreCENTER TLog files ? these files are imported by the FRS version of CCS and at Dressbarn / 
Maurices, Radio Shack and Shopko.  These files are used by both Relationship Manager and 
ReturnCENTER.  Note:  at Dressbarn / Maurices, these files are imported even though StoreCENTER is 
not part of the application suite ? i.e., a custom piece of software is used to deliver files from 
GlobalSTORE to ReturnCENTER.



33.	APPENDIX H ? BUILDING CCS
There are currently three ways to build CCS:
1.	For development testing ? this is described in section 3.6.4.3, using the BuildSunD command.
2.	As part of a formal build ? see below.
3.	A build to generate a CCS EAR file only ? see below.
33.1	The CCS Formal Build
The formal build process can be used to generate a CCS EAR file, a CCSInterface.jar file and a CCSBatch.jar 
file.  Here is the process:
1.	Download the entire CoreContextServer / Source to a similarly named structure on the target system.
2.	Download the entire BaseContextServer / Source to a similarly named structure on the target system.
3.	Build the Core packages first:
a.	Copy the appropriate CoremaLoyaltyClient.jar file into the CCSV4\Server\lib\common folder.
b.	Modify the setupenv.bat file ? comment out any call :findit lines.
c.	Run setupenv, setversion and build in that order.
d.	When those are complete, the packages can be found in the Releases folder.
4.	Build the Base packages:
a.	Copy the appropriate CoremaLoyaltyClient.jar file into the CCSV4\Server\lib\common folder.
b.	Copy the CCSInterface.jar file from step 3 into the Server / lib / common folder
c.	Modify the setupenv.bat file ? comment out any call :findit lines.
d.	Run setupenv, setversion and build in that order.
e.	When those are complete, the packages can be found in the Releases folder.
33.2	The CCS Informal Build
A development process can be used to build just the CCS EAR file.  This is the process:
1.	Use the DOS session for build as described in section 3.6.4.3.
2.	Enter the command CleanSunD, followed by PackageSunD.
3.	When those are complete, you can find the CCS.ear file here - \Projects\CCSV4-
xxx\Build\Sun81\CCSV4\SampleEAR\Build\CCSV4.



34.	APPENDIX I ?CONFIGURATION FOR STORECENTER
In a ReturnCENTER system, where TLog files are supplied by StoreCENTER, the ReturnCENTER batch 
server must be configured such that StoreCENTER can FTP the TLog files.
First, the ReturnCENTER batch server must have some version of IIS / FTP installed.  Various versions of 
Windows Server will require different versions.  The server should have the appropriate version installed as 
one of the pre-requisites.
Based on which version is installed, the configuration instructions are different.  Check the web for specific 
instructions for the version installed.  The end result must be that an FTP site named ?rcpin? must be added 
and it must be the following folder - \TransferData\Imports\POSTransactions.
Here is an example of that setup ? Windows Server 2008.
 



35.	APPENDIX J ? GLOBALSTORE CONFIGURATIONS
This section describes the configuration required at GlobalSTORE to interface properly with CCS (and CSA 
and LM).
35.1	GlobalSTORE / CCS Configuration
GlobalSTORE can communicate directly with CCS, sending HTTP requests and receiving responses.  There 
are two specific interfaces ? Relationship Manager interface and ReturnCENTER interface.
35.1.1	Relationship Manager Interface
The configuration file is found in the C:\gstr\RMAdapter folder, file name is RelationshipManagerAdapter.xml.  
This file exists on the GlobalSTORE server and the POS registers.
In this file, the <RMAURL> tag specifies which server will handle the GlobalSTORE requests.  The 
?servername? (see below) must be changed to specify one of these:
1.	The server name of the Relationship Manager server dedicated to online requests.
2.	The IP address of the Relationship Manager server dedicated to online requests.
3.	The server name of the Relationship Manager load balancer that will direct online requests to an 
appropriate ReturnCENTER server.  (Recommended.)
4.	The IP address of the Relationship Manager load balancer that will direct online requests to an 
appropriate ReturnCENTER server.
This XML must be changed (only the ?servername? is to be changed).
<URL>
         <RMAURL>http://servername:10001/GenericClient/CCSRequestProcessor?ccsRequest=</RMAURL>
</URL>
35.1.2	ReturnCENTER  Interface
The configuration file is found in the C:\gstr\RCAdapter folder, file name is returnCENTERAdapter.xml.  This 
file exists on the GlobalSTORE server and the POS registers.
In this file, the <ReturnCenterURL> tag specifies which server will handle the GlobalSTORE requests.  The 
?servername? (see below) must be changed to specify one of these:
1.	The server name of the ReturnCENTER server dedicated to online requests.
2.	The IP address of the ReturnCENTER server dedicated to online requests.
3.	The server name of the ReturnCENTER load balancer that will direct online requests to an appropriate 
ReturnCENTER server.  (Recommended.)
4.	The IP address of the ReturnCENTER load balancer that will direct online requests to an appropriate 
ReturnCENTER server.
This XML must be changed (only the ?servername? is to be changed).
<URL>
         <ReturnCenterURL>http://servername:10001/RCGSServlet/CCSRequestProcessorForRCGS?ccsRequest=</
ReturnCenterURL>
</URL>
35.2	GlobalSTORE / CSA Configuration
The configuration file is found in the C:\gstr\iStore\bin folder, file name is pos.xpa.  This file exists on the 
GlobalSTORE server and the POS registers.
In this file, the <CSAURL> tag specifies which server will handle the GlobalSTORE Relationship Manager 
CSA launch requests.  The ?servernameRM? and ?servernameRC? (see below) must be changed to specify 
one of these:
1.	The server name of the Relationship Manager server dedicated to CSA launch requests.
2.	The IP address of the Relationship Manager server dedicated to CSA launch requests.
3.	The server name of the Relationship Manager load balancer that will direct CSA launch requests to an 
appropriate Relationship Manager server.  (Recommended.)
4.	The IP address of the Relationship Manager load balancer that will direct CSA launch requests to an 
appropriate Relationship Manager server.
In this file, the <RETURNCENTERURL> tag specifies which server will handle the GlobalSTORE 
ReturnCENTER RCCSA launch requests.  The ?servername? must be changed to specify one of these:
1.	The server name of the ReturnCENTER server dedicated to RCCSA launch requests.
2.	The IP address of the ReturnCENTER server dedicated to RCCSA launch requests.
3.	The server name of the ReturnCENTER load balancer that will direct RCCSA launch requests to an 
appropriate ReturnCENTER server.  (Recommended.)
4.	The IP address of the ReturnCENTER load balancer that will direct RCCSA launch requests to an 
appropriate ReturnCENTER server.
This XML must be changed (only the ?servernameRM? and ?servernameRC? are to be changed).

<CSAURL>http://servernameRM:10031/GSInterface.jsp</CSAURL>
<RETURNCENTERURL>http://servernameRC:10035/GSRCInterface.jsp</RETURNCENTERURL>

35.3	GlobalSTORE / Loyalty Manager Configuration
The configuration file is found in the C:\gstr\LoyaltyCache\config folder, file name is cache.param.txt.  This file 
exists on the GlobalSTORE server only.
In this file:
The HOSTCOREMA parameter specifies the server name or IP address of the primary Loyalty Manager 
server.  
The BACKUPCOREMA parameter specifies the server name or IP address of the primary Loyalty Manager 
server.  This will have the same value as the HOSTCOREMA parameter if only one server exists.
In addition to this configuration, the IP address of each GlobalSTORE server that needs to connect to Loyalty 
Manager must be the store.txt file in the \Programs\corema\fe\div\11\config folder on the Loyalty Manager 
server.



36.	APPENDIX K ? REDESIGN OPPORTUNITIES
Nothing works better than hindsight.  This section covers those design areas that could have been done 
differently (i.e., better) and are opportunities for improvement the next time around.
36.1	ReturnCENTER SetReserve Request
The ReturnCENTER SetReserve (AKA Fetch) request fetches the details for an original transaction and 
reserves it for exclusive use by the collector.  There is no justification for this but this request is transformed 
into a CCS TransactionSearch request (instead of TransactionFetch) with unique attributes that allow it to 
return the details of the transaction (as a TransactionFetch does naturally).
The ReturnCENTER SetReserve (AKA Fetch) request should be transformed into a TransactionFetch 
request.
36.2	Base / Application Division
The Java source structure has the base / application / batch hierarchy.  The base portion is meant to contain 
files that are basic to the CCS functionality and will not be changed by specific customizations for customers.  
The application portion is meant to contain files that we are at a less basic level and are candidates for 
customization by customers.
This division worked very well in the case of the Customer object.  The Customer class is in the base portion 
and its sub-classes are in the application portion (CCSApplicationCustomer, NewCustomer, 
ChangingCustomer and ExistingCustomer).  Customer related changes are all done in these application files.
This section contains items where the division could have been done better.
36.2.1	CustomerElement Files
All the CustomerElement files are in the base portion.  There is a CustomerElement file for each top-level 
customer data element ? e.g., Name, Address, Email.  There is currently no way to customize these except in 
the base portion.  It should have been done this way:
1.	The base portion files are OK, except they should have non-public constructors.
2.	There should be corresponding files in the application portion ? those files should extend the 
corresponding file in the base portion and provide a set of public constructors.  That would be the extent 
of those files.  Then, all customization could occur in these files (the ones in the application portion).
3.	All of the CustomerElement object references would have to be changed to the application object instead 
of the base object.
36.2.2	SQL Statement Files
The design principles relating to SQL statements are fine (see section 15) ? the placement of the statements 
is not.
Instead of putting all SQL statements in files in the application portion, they should be split between the base 
and application portions ? using the same general philosophy as described above.  As it stands now, this 
basic principle is not followed ? all base classes should reference only other base classes; application classes 
may reference both.  
36.3	CCSException
This is simple.  The use of CCSException and its coupling with the Tracer object (see section 14) is fine ? 
except it should not be a checked exception.
36.4	JUnit Test Files
The JUnit test file organization is based on the JUnit test organization.  Each test program folder has a 
corresponding test file folder.  This has some aspects of convenience to it, but it causes a vast amount of file 
duplication.
The JUnit test files should also be organized by function.  For example, all the CustomerUpdate / Create files 
should be in the same folder, all the SQL script files should be in the same folder, etc.  Then, only those files 
that are not in the functional organization are added in the current organization.
36.5	Cloning CustomerElement Objects
There are occasions when a CustomerElement object, e.g., Name object, must be created from an existing 
one, similar to a clone but not exactly the same.  Usually, this is part of doing a change.  This process is 
currently complicated.  There should be a simple way to do it, but it currently requires the following to be 
done:
1.	Copy logicalRowID from the existing object to the new object.
2.	Copy lastUpdated from the existing object to the new object.
3.	Copy elementTimeStamp from the existing object to the new object.
4.	Set changeType in the new object to CustomerElement.UPDATE_TYPE_REPLACE.
5.	Set typeOfChange in the new object to CustomerElement.CHANGE_TYPE_REPLACE.
Here?s a code example, using the Name object:
        	Name newName = new Name();
        	Name existingName = existingCustomer.getName();
        	name.setLogicalRowID(existingName.getLogicalRowID());
        	name.setLastUpdated(existingName.getLastUpdated());
        	name.setElementTimeStamp(CCSUtils
        			.getDateTimeString(existingName.getLastUpdated()));
        	name.setChangeType(CustomerElement.UPDATE_TYPE_REPLACE);
        	name.setTypeOfChange(CustomerElement.CHANGE_TYPE_REPLACE);

36.6	Transaction Objects
The transaction objects are all found in the com.fujitsu.ftxs.corema.ccs.base.sbeans.domain.transaction 
package and they are designed as JDO?s (Java Data Objects).  However, in practice, they are much more 
than JDO?s.
The design should have been like this:
1.	JDO?s ? i.e., true data objects.
2.	Transaction processing objects for real time processing.
3.	Transaction processing objects for batch processing.




CCS Programmer?s Guild
Page VI

                            Table of Contents		
Development Environment




', NULL, 0, N'')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (4, N'Sample.txt', N'', NULL, 0, N'')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (5, N'Sample.txt', N'', NULL, 0, N'')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (6, N'Sample.txt', N'', NULL, 0, N'')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (7, N'Sample.txt', N'asaasasasasa', NULL, 0, N'')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (8, N'Sample.txt', N'asaasasasasa

test 2


aaaa
', NULL, 0, N'')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (9, N'Overtime Authorization Guide.txt', N'GUIDELINES			
			
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
			
', NULL, 0, N'')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (10, N'REQUESTS.txt', N'??/ *  
       M o n d a y ,   M a y   2 7 ,   2 0 1 9 4 : 3 9 : 2 6   P M  
       U s e r :   s a  
       S e r v e r :   l o c a l h o s t  
       D a t a b a s e :   t r i c e r a _ d b  
       A p p l i c a t i o n :    
 * /  
  
 R E Q U E S T S  
 ', NULL, 0, N'')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (11, N'test.txt', N'test', NULL, 0, N'')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (12, N'test.txt', N'test', NULL, 0, N'')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (13, N'test.txt', N'test', NULL, 0, N'')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (14, N'test.txt', N'test', NULL, 0, N'Documents/test.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (15, N'test.txt', N'test', NULL, 0, N'Documents/test.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (16, N'asasasa.txt', N'asasasasa', NULL, 0, N'Documents/asasasa.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (17, N'asasasa.txt', N'asasasasa', NULL, 0, N'Documents/asasasa.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (18, N'This is a Text File.txt', N'I am a container', NULL, 0, N'Documents/This is a Text File.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (19, N'This is a Text File.txt', N'I am a container', NULL, 0, N'Documents/This is a Text File.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (20, N'This is a Text File.txt', N'I am a container', NULL, 0, N'Documents/This is a Text File.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (21, N'This is a Text File.txt', N'I am a container', NULL, 0, N'Documents/This is a Text File.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (22, N'This is a Text File.txt', N'I am a container', NULL, 0, N'Documents/This is a Text File.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (23, N'This is a Text File.txt', N'I am a container', NULL, 0, N'Documents/This is a Text File.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (24, N'This is a Text File.txt', N'I am a container', NULL, 0, N'Documents/This is a Text File.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (25, N'This is a Text File.txt', N'I am a container', NULL, 0, N'Documents/This is a Text File.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (26, N'This is a Text File.txt', N'I am a container', NULL, 0, N'Documents/This is a Text File.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (27, N'This is a Text File.txt', N'I am a container', NULL, 0, N'Documents/This is a Text File.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (28, N'asasasa.txt', N'asasasasa', NULL, 0, N'Documents/asasasa.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (29, N'asasasa.txt', N'asasasasa', NULL, 0, N'Documents/asasasa.txt')
SET IDENTITY_INSERT [dbo].[DOCUMENTS] OFF
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
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (1, -1, NULL, N'Get username', 2, N'what can I do for you?', N'', 1, NULL, NULL, N'@username')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (2, 1, N'Help me with my Concern', N'Search for anything in all records', 200, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (4, 2, N'Add 3C', N'Add 3C', 400, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (4, 3, N'Add Lesson Learn', N'Add Lesson Learn', 300, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (200, -1, NULL, N'Textbox for Search', 201, N'Check this out!', N'SELECT description FROM SUMMARY_CI WHERE description like ''%'' + @input + ''%'' or title like ''%'' + @input + ''%''', 0, NULL, NULL, N'input')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (300, -1, NULL, N'get value of problem', 301, NULL, NULL, NULL, NULL, NULL, N'problem')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (301, -1, NULL, N'get value of solution', 900, N'Thank you for sharing your knowledge. I will share these to others as well.', N' insert into SAMPLE_LESSONLEARNT(problem, solution) values (@problem, @solution); ', NULL, NULL, NULL, N'solution')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (900, 1, N'OK', NULL, 2, N'Is there anything else I can do for you?', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (4, 4, N'Upload a Document', N'Add 3C', 500, N'Great! Uploading a document will drastically increase my knowledge. You can drag and drop the files on the fields below.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (500, -2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (3, 1, N'Fujitsu Prime Members', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (0, 0, N'It''s OK, no worries', NULL, 2, N'For the meantime, please choose another option. ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (2, 2, N'I want to Contribute', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (201, 1, N'Yes, it helped. Thanks!', NULL, 900, N'Great! I''m glad I could be of assistance.', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (3, 2, N'Reports', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (400, -1, NULL, N'Textbox for Concern input', 401, NULL, NULL, NULL, NULL, NULL, N'concern')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (401, -1, NULL, N'Textbox for Cause', 402, NULL, NULL, NULL, NULL, NULL, N'cause')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (402, -1, NULL, N'Textbox for Countermeasure', 900, N'Thank you for raising your concerns.', N'INSERT INTO [dbo].[SAMPLE_3C] ([concern] ,[cause] ,[countermeasure]) VALUES (@concern ,@cause ,@countermeasure);', NULL, NULL, NULL, N'countermeasure')
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (201, 2, N'Yes, but I want to improve it', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (201, 3, N'No, continue searching', NULL, 202, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (202, 1, N'Yes, it helped. Thanks!', NULL, 2, N'Is there anything else I can do for you?', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (202, 2, N'Yes, but I''ll add something', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (202, 3, N'No, continue searching', NULL, 202, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE] ([parent_reqid], [seq], [display], [description], [next_reqid], [response_display], [stored_proc], [response_type], [continue_loop], [param_value], [param_name]) VALUES (2, 1, N'Others', N'Display new features here', 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (1, N'STRING_COL1                   ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (2, N'STRING_COL2                   ')
INSERT [dbo].[RESPONSE_TYPE] ([response_type], [description]) VALUES (3, N'STRING_COL3                   ')
SET IDENTITY_INSERT [dbo].[SAMPLE_3C] ON 

INSERT [dbo].[SAMPLE_3C] ([id], [concern], [cause], [countermeasure], [upload_dt]) VALUES (1, N'I am concern', N'I am cause', N'I am countermeasure', CAST(N'2019-06-23 02:51:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_3C] ([id], [concern], [cause], [countermeasure], [upload_dt]) VALUES (2, N'Test', N'Test', N'Test', CAST(N'2019-06-24 15:27:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_3C] ([id], [concern], [cause], [countermeasure], [upload_dt]) VALUES (3, N'aaaabbbb', N'ccccdddd', N'eeeeffff', CAST(N'2019-06-24 15:27:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_3C] ([id], [concern], [cause], [countermeasure], [upload_dt]) VALUES (5, N'this is a concern', N'this is the root cause', N'this is the countermeasure', CAST(N'2019-06-25 10:39:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[SAMPLE_3C] OFF
SET IDENTITY_INSERT [dbo].[SAMPLE_LESSONLEARNT] ON 

INSERT [dbo].[SAMPLE_LESSONLEARNT] ([id], [problem], [solution], [upload_dt]) VALUES (1, N'Test', N'AAAAAAAA', CAST(N'2019-06-23 02:10:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_LESSONLEARNT] ([id], [problem], [solution], [upload_dt]) VALUES (2, N'Tesa123123asd asdas', N'asdasasda asdasawe', CAST(N'2019-06-23 02:13:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_LESSONLEARNT] ([id], [problem], [solution], [upload_dt]) VALUES (3, N'Teseeee', N'sdasdasdasda', CAST(N'2019-06-23 02:16:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_LESSONLEARNT] ([id], [problem], [solution], [upload_dt]) VALUES (4, N'Teseses', N'aspdapsdpaspdapsd', CAST(N'2019-06-23 02:19:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_LESSONLEARNT] ([id], [problem], [solution], [upload_dt]) VALUES (7, N'asda123123asda', N'asdasd123123asds', CAST(N'2019-06-23 02:37:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_LESSONLEARNT] ([id], [problem], [solution], [upload_dt]) VALUES (8, N'aaaaa', N'bbbbb', CAST(N'2019-06-23 02:39:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_LESSONLEARNT] ([id], [problem], [solution], [upload_dt]) VALUES (10, N'test1', N'test1', CAST(N'2019-06-23 03:10:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_LESSONLEARNT] ([id], [problem], [solution], [upload_dt]) VALUES (11, N'test1', N'test1', CAST(N'2019-06-23 03:10:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_LESSONLEARNT] ([id], [problem], [solution], [upload_dt]) VALUES (12, N'problem 6/25', N'solution 6/25', CAST(N'2019-06-25 10:32:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_LESSONLEARNT] ([id], [problem], [solution], [upload_dt]) VALUES (5, N'123123sadsd', N'asdadasdasdasda1231312312', CAST(N'2019-06-23 02:21:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_LESSONLEARNT] ([id], [problem], [solution], [upload_dt]) VALUES (6, N'2ADAD213123', N'SDAADQ32123123', CAST(N'2019-06-23 02:25:00' AS SmallDateTime))
INSERT [dbo].[SAMPLE_LESSONLEARNT] ([id], [problem], [solution], [upload_dt]) VALUES (9, N'ttt', N'aaaa', CAST(N'2019-06-23 03:01:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[SAMPLE_LESSONLEARNT] OFF
USE [master]
GO
ALTER DATABASE [TriceraDB] SET  READ_WRITE 
GO
