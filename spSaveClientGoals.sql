/****** Object:  StoredProcedure [dbo].[spSaveClientGoals]    Script Date: 1/15/2021 11:49:37 AM ******/
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
@goal_number int
AS

	IF not exists (select * from mom_client_goals where @client_id = client_id and @goal_number = goal_num)
	BEGIN
		INSERT INTO	mom_client_goals
		(client_id,
		[user_id],
		goal_text,
		goal_resource,
		goal_date,
		goal_actions,
		goal_num)
		VALUES
		(@client_id,
		@user_id,
		@goal_text,
		@goal_resource,
		@goal_date,
		@goal_actions,
		@goal_number)
	END
	ELSE
	BEGIN
		UPDATE mom_client_goals SET
		[user_id] = @user_id,
		goal_text = @goal_text,
		goal_resource = @goal_resource,
		goal_date = @goal_date,
		goal_actions = @goal_actions
		WHERE client_id=@client_id
		AND [goal_num] = @goal_number
	END

/*
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
*/
