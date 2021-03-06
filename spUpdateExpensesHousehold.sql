/****** Object:  StoredProcedure [dbo].[spUpdateExpensesHousehold]    Script Date: 1/15/2021 11:22:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateExpensesHousehold]
@client_id int,
@user_id int,
@current_module char(1),
@hh_mortgage float,
@hh_rent float,
@hh_tax float,
@hh_improvement float,
@hh_insurance float,
@hh_repair float,
@hh_maintenance float,
@hh_others float,
@hh_chap13 float,
@hh_total float
AS
BEGIN
	IF @current_module = 'F'
	BEGIN
		UPDATE mom_client_expenses
		SET
			hh_mortgage = @hh_mortgage,
			hh_rent = @hh_rent,
			hh_tax = @hh_tax,
			hh_improvement = @hh_improvement,
			hh_insurance = @hh_insurance,
			hh_repair = @hh_repair,
			hh_maintenance = @hh_maintenance,
			hh_others = @hh_others,
			hh_chap13 = @hh_chap13,
			hh_total = @hh_total
		WHERE client_id = @client_id
		AND [user_id] = @user_id
	END
	UPDATE mom_client_expenses_b
	SET
		hh_mortgage = @hh_mortgage,
		hh_rent = @hh_rent,
		hh_tax = @hh_tax,
		hh_improvement = @hh_improvement,
		hh_insurance = @hh_insurance,
		hh_repair = @hh_repair,
		hh_maintenance = @hh_maintenance,
		hh_others = @hh_others,
		hh_chap13 = @hh_chap13,
		hh_total = @hh_total
	WHERE client_id = @client_id
	AND [user_id] = @user_id
END