/****** Object:  StoredProcedure [dbo].[spUpdateExpensesSavings]    Script Date: 1/15/2021 11:24:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateExpensesSavings]
@client_id int,
@user_id int,
@current_module char(1),
@ss_401K float,
@ss_investment float,
@ss_college_savings float,
@ss_retirement float,
@ss_IRA float,
@ss_general float,
@ss_total float
AS
BEGIN
	IF @current_module = 'F'
	BEGIN
		UPDATE mom_client_expenses
		SET
			ss_401K = @ss_401K,
			ss_investment = @ss_investment,
			ss_college_savings = @ss_college_savings,
			ss_retirement = @ss_retirement,
			ss_IRA = @ss_IRA,
			ss_general = @ss_general,
			ss_total = @ss_total
		WHERE client_id = @client_id
		AND [user_id] = @user_id
	END
	UPDATE mom_client_expenses_b
	SET
		ss_401K = @ss_401K,
		ss_investment = @ss_investment,
		ss_college_savings = @ss_college_savings,
		ss_retirement = @ss_retirement,
		ss_IRA = @ss_IRA,
		ss_general = @ss_general,
		ss_total = @ss_total
	WHERE client_id = @client_id
	AND [user_id] = @user_id
END