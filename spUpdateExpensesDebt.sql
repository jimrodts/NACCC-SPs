/****** Object:  StoredProcedure [dbo].[spUpdateExpensesDebt]    Script Date: 1/15/2021 11:53:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateExpensesDebt]
@client_id int,
@user_id int,
@current_module char(1), 
@dd_no_cc tinyint,
@dd_cc_creditor_breakup varchar(MAX),
@dd_cc_breakup varchar(200),
@dd_cc_balance_breakup varchar(200),
@dd_cc_tot float,
@dd_equity_loan float,
@dd_personal_loan_1 float,
@dd_student_loan float,
@dd_other_personal_loan float,
@dd_other_loan float,
@dd_total float
AS
BEGIN
	IF @current_module = 'F'
	BEGIN
		UPDATE mom_client_expenses SET 
		dd_no_cc = @dd_no_cc,
		dd_cc_creditor_breakup = @dd_cc_creditor_breakup,
		dd_cc_breakup = @dd_cc_breakup,
		dd_cc_balance_breakup = @dd_cc_balance_breakup,
		dd_cc_tot = @dd_cc_tot,
		dd_equity_loan  = @dd_equity_loan,
		dd_personal_loan_1 = @dd_personal_loan_1,
		dd_student_loan = @dd_student_loan,
		dd_other_personal_loan = @dd_other_personal_loan,
		dd_other_loan = @dd_other_loan,
		dd_total = @dd_total
		WHERE client_id=@client_id
		AND [user_id] = @user_id
	END
	UPDATE mom_client_expenses_b SET 
	dd_no_cc = @dd_no_cc,
	dd_cc_creditor_breakup = @dd_cc_creditor_breakup,
	dd_cc_breakup = @dd_cc_breakup,
	dd_cc_balance_breakup = @dd_cc_balance_breakup,
	dd_cc_tot = @dd_cc_tot,
	dd_equity_loan  = @dd_equity_loan,
	dd_personal_loan_1 = @dd_personal_loan_1,
	dd_student_loan = @dd_student_loan,
	dd_other_personal_loan = @dd_other_personal_loan,
	dd_other_loan = @dd_other_loan,
	dd_total = @dd_total
	WHERE client_id=@client_id
	AND [user_id] = @user_id
END