
DECLARE	@return_value int

EXEC	@return_value = [dbo].[proc_address_update]
		@EmployeeID = 1,
		@StreetName = N'samples',
		@City = N'Detroit',
		@State = N'WA',
		@Country = N'USP',
		@ZipCode = N'48445',
		@Phone = N'425418415'

SELECT	'Return Value' = @return_value

GO
