/****** Object:  StoredProcedure [dbo].[spUpdateClientIncome]    Script Date: 1/28/2021 4:34:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateClientIncome]
@client_id int,
@debtor_monthly_pay float,
@spouse_monthly_pay float,
@debtor_business_income float,
@spouse_business_income float,
@debtor_interest_income float,
@spouse_interest_income float,
@debtor_retirement_income float,
@spouse_retirement_income float,
@debtor_rent_income float,
@spouse_rent_income float,
@debtor_contrib_income float,
@spouse_contrib_income float,
@debtor_unemp_comp_income float,
@spouse_unemp_comp_income float,
@debtor_ss_income float,
@spouse_ss_income float,
@debtor_other_income float,
@spouse_other_income float,
@spouse_nc float,
@debtor_income_tax float,
@spouse_income_tax float,
@debtor_gross_income float,
@spouse_gross_income float,
@debtor_net_income float,
@spouse_net_income float,
@m_house_income float,
@lastaccess datetime
AS
BEGIN
UPDATE mom_client_income SET
	debtor_monthly_pay = @debtor_monthly_pay,
	spouse_monthly_pay = @spouse_monthly_pay,
	debtor_business_income = @debtor_business_income,
	spouse_business_income = @spouse_business_income,
	debtor_interest_income = @debtor_interest_income,
	spouse_interest_income = @spouse_interest_income,
	debtor_retirement_income = @debtor_retirement_income,
	spouse_retirement_income = @spouse_retirement_income,
	debtor_rent_income = @debtor_rent_income,
	spouse_rent_income = @spouse_rent_income,
	debtor_contrib_income = @debtor_contrib_income,
	spouse_contrib_income = @spouse_contrib_income,
	debtor_unemp_comp_income = @debtor_unemp_comp_income,
	spouse_unemp_comp_income = @spouse_unemp_comp_income,
	debtor_ss_income = @debtor_ss_income,
	spouse_ss_income = @spouse_ss_income,
	debtor_other_income = @debtor_other_income,
	spouse_other_income = @spouse_other_income,
	spouse_nc = @spouse_nc,
	debtor_income_tax = @debtor_income_tax,
	spouse_income_tax = @spouse_income_tax,
	debtor_gross_income = @debtor_gross_income,
	spouse_gross_income = @spouse_gross_income,
	debtor_net_income = @debtor_net_income,
	spouse_net_income = @spouse_net_income
WHERE client_id = @client_id;


UPDATE 	mom_client_info
 SET m_house_income = @m_house_income,
	session_result = 'Income',
	lastaccess = @lastaccess
WHERE client_id = @client_id;
END
GO

