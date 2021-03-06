/****** Object:  StoredProcedure [dbo].[spUpdateExpensesRecreation]    Script Date: 1/15/2021 11:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateExpensesRecreation]
@client_id int,
@user_id int,
@current_module char(1),
@ee_movies float,
@ee_lottery float,
@ee_movie_rentals float,
@ee_gambling_costs float,
@ee_alcohol_cigarettes float,
@ee_weekend float,
@ee_travel float,
@ee_festivals float,
@ee_total float
AS
BEGIN
	IF @current_module = 'F'
	BEGIN
		UPDATE mom_client_expenses
		SET
			ee_movies = @ee_movies,
			ee_lottery = @ee_lottery,
			ee_movie_rentals = @ee_movie_rentals,
			ee_gambling_costs = @ee_gambling_costs,
			ee_alcohol_cigarettes = @ee_alcohol_cigarettes,
			ee_weekend = @ee_weekend,
			ee_travel = @ee_travel,
			ee_festivals = @ee_festivals,
			ee_total = @ee_total
		WHERE client_id = @client_id
		AND [user_id] = @user_id
	END
	UPDATE mom_client_expenses_b
	SET
		ee_movies = @ee_movies,
		ee_lottery = @ee_lottery,
		ee_movie_rentals = @ee_movie_rentals,
		ee_gambling_costs = @ee_gambling_costs,
		ee_alcohol_cigarettes = @ee_alcohol_cigarettes,
		ee_weekend = @ee_weekend,
		ee_travel = @ee_travel,
		ee_festivals = @ee_festivals,
		ee_total = @ee_total
	WHERE client_id = @client_id
	AND [user_id] = @user_id
END