/****** Object:  StoredProcedure [dbo].[spAddUpdateGoal]    Script Date: 1/15/2021 11:45:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spAddUpdateGoal]
@client_id int,
@user_id int,
@goal_text text,
@goal_resource text,
@goal_date text,
@goal_actions text,
@goal_number int
AS
	IF (@client_id <= 0)
	BEGIN
		INSERT INTO	mom_client_goals
		(user_id,
		goal_text,
		goal_resource,
		goal_date,
		goal_actions,
		goal_num)
		VALUES
		(@user_id,
		@goal_text,
		@goal_resource,
		@goal_date,
		@goal_actions,
		@goal_number)
		SET @client_id = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE mom_client_goals SET 
		goal_text = @goal_text,
		goal_resource = @goal_resource,
		goal_date = @goal_date,
		goal_actions = @goal_actions,
		goal_num = @goal_number
		WHERE client_id=@client_id
		AND [user_id] = @user_id
	END
