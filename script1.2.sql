/****** Object:  StoredProcedure [dbo].[proc_address_update]    Script Date: 7/21/2018 5:09:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_address_update]
@EmployeeID int,
@StreetName NVARCHAR(50),
@City NVARCHAR(50),
@State NVARCHAR(50),
@Country NVARCHAR(50),
@ZipCode NVARCHAR(50),
@Phone	NVARCHAR(50)
AS

Declare @addressID int;
set @addressID=(select Max(Address_id) from Employee_Address);


SET IDENTITY_INSERT dbo.Employee_Address ON

set @addressID= @addressID+1
INSERT INTO [dbo].[Employee_Address]
           ([Address_id],
		   [Employee_ID]
           ,[Street_Name]
           ,[City]
           ,[State]
           ,[Country]
           ,[ZipCode]
           ,[Phone_Number])
     VALUES
           (@addressID
		   ,@EmployeeID
           ,@StreetName
           ,@City
           ,@State
           ,@Country
           ,@ZipCode
           ,@Phone)

UPDATE [dbo].[Employee]
   SET [Address_ID] = @addressID
 WHERE id =@EmployeeID


GO