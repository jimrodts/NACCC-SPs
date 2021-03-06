/****** Object:  StoredProcedure [dbo].[spUpdateExpensesUtilities]    Script Date: 1/15/2021 11:25:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateExpensesUtilities]
@client_id int,
@user_id int,
@current_module char(1),
@uu_electricity float,
@uu_heatcool float,
@uu_gas float,
@uu_water_sewage float,
@uu_phone float,
@uu_internet float,
@uu_cable float,
@uu_trash float,
@uu_other float,
@uu_total float
AS
BEGIN
	IF @current_module = 'F'
	BEGIN
		UPDATE mom_client_expenses
		SET
			uu_electricity = @uu_electricity,
			uu_heatcool = @uu_heatcool,
			uu_gas = @uu_gas,
			uu_water_sewage = @uu_water_sewage,
			uu_phone = @uu_phone,
			uu_internet = @uu_internet,
			uu_cable = @uu_cable,
			uu_trash = @uu_trash,
			uu_other = @uu_other,
			uu_total = @uu_total
		WHERE client_id = @client_id
		AND [user_id] = @user_id
	END
	UPDATE mom_client_expenses_b
	SET
		uu_electricity = @uu_electricity,
		uu_heatcool = @uu_heatcool,
		uu_gas = @uu_gas,
		uu_water_sewage = @uu_water_sewage,
		uu_phone = @uu_phone,
		uu_internet = @uu_internet,
		uu_cable = @uu_cable,
		uu_trash = @uu_trash,
		uu_other = @uu_other,
		uu_total = @uu_total
	WHERE client_id = @client_id
	AND [user_id] = @user_id
END