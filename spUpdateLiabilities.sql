/****** Object:  StoredProcedure [dbo].[spUpdateLiabilities]    Script Date: 1/15/2021 11:26:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateLiabilities]
@client_id int,
@user_id int,
@auto_loan float,
@home_equity_loans float,
@bank_loan float,
@credit_card_balances float,
@personal_loan float,
@real_estate_taxes float,
@student_loan float,
@income_taxes float,
@mortgages float,
@other float,
@total float
AS
BEGIN
	UPDATE mom_client_liabilities
		SET
		auto_loan = @auto_loan,
		home_equity_loans = @home_equity_loans,
		bank_loan = @bank_loan,
		credit_card_balances = @credit_card_balances,
		personal_loan = @personal_loan,
		real_estate_taxes = @real_estate_taxes,
		student_loan = @student_loan,
		income_taxes = @income_taxes,
		mortgages = @mortgages,
		other = @other,
		total = @total
		WHERE [user_id] = @user_id
		AND
		client_id = @client_id
END