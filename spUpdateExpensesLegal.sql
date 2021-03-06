/****** Object:  StoredProcedure [dbo].[spUpdateExpensesLegal]    Script Date: 1/15/2021 11:23:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateExpensesLegal]
@client_id int,
@user_id int,
@current_module char(1),
@cc_alimony_child_support float,
@cc_court_payments float,
@cc_support_payment float,
@cc_other float,
@cc_total float
AS
BEGIN
	IF @current_module = 'F'
	BEGIN
		UPDATE mom_client_expenses
		SET
			cc_alimony_child_support = @cc_alimony_child_support,
			cc_court_payments = @cc_court_payments,
			cc_support_payment = @cc_court_payments,
			cc_other = @cc_other,
			cc_total = @cc_total
		WHERE client_id = @client_id
		AND [user_id] = @user_id
	END
	UPDATE mom_client_expenses_b
	SET
		cc_alimony_child_support = @cc_alimony_child_support,
		cc_court_payments = @cc_court_payments,
		cc_support_payment = @cc_court_payments,
		cc_other = @cc_other,
		cc_total = @cc_total
	WHERE client_id = @client_id
	AND [user_id] = @user_id
END