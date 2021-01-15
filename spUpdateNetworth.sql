/****** Object:  StoredProcedure [dbo].[spUpdateNetworth]    Script Date: 1/15/2021 11:26:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateNetworth]
@client_id int,
@user_id int,
@total_asset float,
@total_liablities float,
@networth float
AS
BEGIN
UPDATE mom_client_info
	SET
	total_asset = @total_asset,
	total_liablities = @total_liablities,
	networth = @networth,
	session_result = 'AssetLiab',
	lastaccess = getdate()						
	WHERE client_id = @client_id
		AND	[user_id] = @user_id
END