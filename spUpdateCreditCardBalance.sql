/****** Object:  StoredProcedure [dbo].[spUpdateCreditCardBalance]    Script Date: 1/15/2021 11:51:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spUpdateCreditCardBalance]
@client_id int,
@user_id int,
@credit_card_balances float
AS
BEGIN
	UPDATE mom_client_liabilities
		SET
		credit_card_balances = @credit_card_balances
		WHERE [user_id] = @user_id
		AND
		client_id = @client_id
END
