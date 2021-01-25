/****** Object:  StoredProcedure [dbo].[DeleteSession]    Script Date: 1/25/2021 9:43:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteSession]
@client_id int
AS
BEGIN
delete
  FROM [dbo].[mom_client_info]
  where client_id = @client_id

delete
  FROM [dbo].[mom_client_assessments]
  where client_id = @client_id

delete
  FROM [dbo].[mom_client_assets]
  where client_id = @client_id

delete
  FROM [dbo].[mom_client_expenses]
  where client_id = @client_id

delete
  FROM [dbo].[mom_client_expenses_b]
  where client_id = @client_id

delete
  FROM [dbo].[mom_client_goals]
  where client_id = @client_id

delete
  FROM [dbo].[mom_client_income]
  where client_id = @client_id

delete
  FROM [dbo].[mom_client_liabilities]
  where client_id = @client_id

delete
  FROM [dbo].[mom_client_notes]
  where client_id = @client_id
END
GO

