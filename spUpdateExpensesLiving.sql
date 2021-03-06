/****** Object:  StoredProcedure [dbo].[spUpdateExpensesLiving]    Script Date: 1/15/2021 11:23:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateExpensesLiving]
@client_id int,
@user_id int,
@current_module char(1),
@ll_groceries float,
@ll_home_supplies float,
@ll_snacks_beverages float,
@ll_cafeteria float,
@ll_pet_food float,
@ll_adult_clothing float,
@ll_child_clothing float,
@ll_child_care float,
@ll_education float,
@ll_cleaning float,
@ll_garden float,
@ll_cosmetic float,
@ll_health_club float,
@ll_other float,
@ll_total float
AS
BEGIN
	IF @current_module = 'F'
	BEGIN
		UPDATE mom_client_expenses
		SET
			ll_groceries = @ll_groceries,
			ll_home_supplies = @ll_home_supplies,
			ll_snacks_beverages = @ll_snacks_beverages,
			ll_cafeteria = @ll_cafeteria,
			ll_pet_food = @ll_pet_food,
			ll_adult_clothing = @ll_adult_clothing,
			ll_child_clothing = @ll_child_clothing,
			ll_child_care = @ll_child_care,
			ll_education = @ll_education,
			ll_cleaning = @ll_cleaning,
			ll_garden = @ll_garden,
			ll_cosmetic = @ll_cosmetic,
			ll_health_club = @ll_health_club,
			ll_other = @ll_other,
			ll_total = @ll_total
		WHERE client_id = @client_id
		AND [user_id] = @user_id
	END
	UPDATE mom_client_expenses_b
	SET
		ll_groceries = @ll_groceries,
		ll_home_supplies = @ll_home_supplies,
		ll_snacks_beverages = @ll_snacks_beverages,
		ll_cafeteria = @ll_cafeteria,
		ll_pet_food = @ll_pet_food,
		ll_adult_clothing = @ll_adult_clothing,
		ll_child_clothing = @ll_child_clothing,
		ll_child_care = @ll_child_care,
		ll_education = @ll_education,
		ll_cleaning = @ll_cleaning,
		ll_garden = @ll_garden,
		ll_cosmetic = @ll_cosmetic,
		ll_health_club = @ll_health_club,
		ll_other = @ll_other,
		ll_total = @ll_total
	WHERE client_id = @client_id
	AND [user_id] = @user_id
END