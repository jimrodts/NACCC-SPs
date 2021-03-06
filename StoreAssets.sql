/****** Object:  StoredProcedure [dbo].[StoreAssets]    Script Date: 1/15/2021 11:26:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[StoreAssets]
@client_id int,
@user_id int,
@fa_automobiles float,
@fa_home_market_value float,
@fa_other_real_estate float,
@fa_boats_planes float,
@fa_jewels_collectibles float,
@fa_other_property float,
@fa_other float,
@fa_total float,
@da_retirement_plan float,
@da_ira float,
@da_other float,
@da_total float,
@ca_cash_on_hand float,
@ca_checking_account float,
@ca_savings_account float,
@ca_certificate_of_deposit float,
@ca_money_owed_to_you float,
@ca_tax_refund float,
@ca_stocks_bonds float,
@ca_mutual_funds float,
@ca_other float,
@ca_total float
AS
BEGIN
UPDATE mom_client_assets
	SET
		fa_automobiles = @fa_automobiles,
		fa_home_market_value = @fa_home_market_value,
		fa_other_real_estate = @fa_other_real_estate,
		fa_boats_planes = @fa_boats_planes,
		fa_jewels_collectibles = @fa_jewels_collectibles,
		fa_other_property = @fa_other_property,
		fa_other = @fa_other,
		fa_total = @fa_total,
		da_retirement_plan = @da_retirement_plan,
		da_ira = @da_ira,
		da_other = @da_other,
		da_total = @da_total,
		ca_cash_on_hand = @ca_cash_on_hand,
		ca_checking_account = @ca_checking_account,
		ca_savings_account = @ca_savings_account,
		ca_certificate_of_deposit = @ca_certificate_of_deposit,
		ca_money_owed_to_you = @ca_money_owed_to_you,
		ca_tax_refund  = @ca_tax_refund,
		ca_stocks_bonds = @ca_stocks_bonds,
		ca_mutual_funds = @ca_mutual_funds,
		ca_other = @ca_other,
		ca_total = @ca_total
	WHERE [user_id] = @user_id
	AND client_id= @client_id
END