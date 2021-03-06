/****** Object:  StoredProcedure [dbo].[spUpdateExpensesTransportation]    Script Date: 1/15/2021 11:25:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateExpensesTransportation]
@client_id int,
@user_id int,
@current_module char(1),
@tt_auto_loan1 float,
@tt_other_auto_loans float,
@tt_auto_insurance float,
@tt_fuel_oil float,
@tt_maintenance float,
@tt_taxe float,
@tt_licensing_fines float,
@tt_parking float,
@tt_tolls float,
@tt_public_transport float,
@tt_others float,
@tt_total float
AS
BEGIN
	IF @current_module = 'F'
	BEGIN
		UPDATE mom_client_expenses
		SET
			tt_auto_loan1 = @tt_auto_loan1,
			tt_other_auto_loans = @tt_other_auto_loans,
			tt_auto_insurance = @tt_auto_insurance,
			tt_fuel_oil = @tt_fuel_oil,
			tt_maintenance = @tt_maintenance,
			tt_taxe = @tt_taxe,
			tt_licensing_fines = @tt_licensing_fines,
			tt_parking = @tt_parking,
			tt_tolls = @tt_tolls,
			tt_public_transport = @tt_public_transport,
			tt_others = @tt_others,
			tt_total = @tt_total
		WHERE client_id = @client_id
		AND [user_id] = @user_id
	END
	UPDATE mom_client_expenses_b
	SET
		tt_auto_loan1 = @tt_auto_loan1,
		tt_other_auto_loans = @tt_other_auto_loans,
		tt_auto_insurance = @tt_auto_insurance,
		tt_fuel_oil = @tt_fuel_oil,
		tt_maintenance = @tt_maintenance,
		tt_taxe = @tt_taxe,
		tt_licensing_fines = @tt_licensing_fines,
		tt_parking = @tt_parking,
		tt_tolls = @tt_tolls,
		tt_public_transport = @tt_public_transport,
		tt_others = @tt_others,
		tt_total = @tt_total
	WHERE client_id = @client_id
	AND [user_id] = @user_id
END