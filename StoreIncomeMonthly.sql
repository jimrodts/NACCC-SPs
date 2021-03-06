/****** Object:  StoredProcedure [dbo].[StoreIncomeMonthly]    Script Date: 1/15/2021 11:27:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[StoreIncomeMonthly]
@clientID int,
@userID int,
@dpf tinyint,
@spf tinyint,
@dpp float,
@spp float
AS
BEGIN
 UPDATE mom_client_income SET
	debtor_pay_freq = @dpf,
	spouse_pay_freq = @spf,
	debtor_pay_period = @dpp,
	spouse_pay_period = @spp
 WHERE client_id = @clientID AND [user_id] = @userID
END