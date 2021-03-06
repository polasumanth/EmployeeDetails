USE [ED]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/21/2018 5:09:27 PM ******/

CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY Key,
	[Firstname] [nvarchar](max) NULL,
	[Lastname] [nvarchar](max) NULL,
	[Address_ID] [int] NULL ,
	 FOREIGN KEY ([Address_ID]) REFERENCES Employee_Address([Address_ID])
)
GO
/****** Object:  Table [dbo].[Employee_Address]    Script Date: 7/21/2018 5:09:27 PM ******/

CREATE TABLE [dbo].[Employee_Address](
	[Address_id] [int] IDENTITY(1,1) NOT NULL PRIMARY Key,
	[Employee_ID] [int] NULL,
	[Street_Name] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[ZipCode] [int] NULL,
	[Phone_Number] [nvarchar](max) NULL,

)

