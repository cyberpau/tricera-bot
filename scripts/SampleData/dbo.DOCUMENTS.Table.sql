USE [TriceraDB]
GO
DELETE FROM [dbo].[DOCUMENTS]
GO
SET IDENTITY_INSERT [dbo].[DOCUMENTS] ON 

INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (1, N'Overtime Authorization Guide.txt', N'GUIDELINES			
			
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
			
', NULL, 0, N'Documents/Overtime Authorization Guide.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (2, N'Windows display a blue screen during startup.txt', N'

    Windows may automatically restart after displaying a blue screen, as shown below. You may also get a Windows startup menu upon reboot. If you do, choose ''Start Windows Normally'' and see if the problem goes away. It may be a one-off glitch.
    If Windows hasn''t automatically restarted after displaying a blue screen, press the Ctrl & Alt & Del keys on your keyboard at the same time to restart the machine. You may need to press and hold the power button on the machine to force it to turn off. Switch it back on and, if you get a Windows startup menu upon reboot, choose ''Start Windows Normally'' and see if the problem goes away.

', NULL, 0, N'Documents/Windows display a blue screen during startup.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (3, N'Overtime Authorization Guide.txt', N'GUIDELINES			
			
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
			
', NULL, 0, N'Documents/Overtime Authorization Guide.txt')
INSERT [dbo].[DOCUMENTS] ([refid], [title], [bulk_content], [upload_dt], [uploader_id], [file_location]) VALUES (4, N'Windows display a blue screen during startup.txt', N'

    Windows may automatically restart after displaying a blue screen, as shown below. You may also get a Windows startup menu upon reboot. If you do, choose ''Start Windows Normally'' and see if the problem goes away. It may be a one-off glitch.
    If Windows hasn''t automatically restarted after displaying a blue screen, press the Ctrl & Alt & Del keys on your keyboard at the same time to restart the machine. You may need to press and hold the power button on the machine to force it to turn off. Switch it back on and, if you get a Windows startup menu upon reboot, choose ''Start Windows Normally'' and see if the problem goes away.

', NULL, 0, N'Documents/Windows display a blue screen during startup.txt')
SET IDENTITY_INSERT [dbo].[DOCUMENTS] OFF
