/****** Object:  StoredProcedure [dbo].[spSaveClientGoals]    Script Date: 1/15/2021 11:21:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spSaveClientGoals]
@client_id int,
@user_id int,
@goal_text text,
@goal_resource text,
@goal_date text,
@goal_actions text,
@numGoals int
AS
BEGIN
	UPDATE mom_client_info SET 
	goal_text = @goal_text,
	goal_resource = @goal_resource,
	goal_dates = @goal_date,
	goal_actions = @goal_actions,
	num_goals = @numGoals
	WHERE client_id=@client_id
	AND [user_id] = @user_id
END