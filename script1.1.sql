GO

SET IDENTITY_INSERT [dbo].[Employee_Address] ON 

INSERT [dbo].[Employee_Address] ([Address_id], [Employee_ID], [Street_Name], [City], [State], [Country], [ZipCode], [Phone_Number]) VALUES (1, 1, N'Highland Courut', N'Farmington Hills', N'Michigan', N'USA', 48335, N'4254999666')
INSERT [dbo].[Employee_Address] ([Address_id], [Employee_ID], [Street_Name], [City], [State], [Country], [ZipCode], [Phone_Number]) VALUES (2, 1, N'sample', N'Detroit', N'WA', N'USP', 48445, N'4254184189')
INSERT [dbo].[Employee_Address] ([Address_id], [Employee_ID], [Street_Name], [City], [State], [Country], [ZipCode], [Phone_Number]) VALUES (3, 1, N'sample', N'Detroit', N'WA', N'USP', 48445, N'4254184183')
SET IDENTITY_INSERT [dbo].[Employee_Address] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [Firstname], [Lastname], [Address_ID]) VALUES (1, N'Sumanth', N'kumar', 3)
SET IDENTITY_INSERT [dbo].[Employee] OFF
