/****** Object:  StoredProcedure [dbo].[spUpdateExpenses]    Script Date: 1/15/2021 11:22:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateExpenses]
@client_id int,
@user_id int,
@current_module char(1),
@hh_total float,
@uu_total float,
@ll_total float,
@tt_total float,
@mm_total float,
@ee_total float,
@cc_total float,
@ss_total float,
@dd_total float,
@oo_total float
AS
BEGIN
	IF @current_module = 'F'
	BEGIN
		UPDATE mom_client_expenses
		SET
			hh_total = @hh_total,
			uu_total = @uu_total,
			ll_total = @ll_total,
			tt_total = @tt_total,
			mm_total = @mm_total,
			ee_total = @ee_total,
			cc_total = @cc_total,
			ss_total = @ss_total,
			dd_total = @dd_total,
			oo_total = @oo_total
		WHERE client_id = @client_id
		AND [user_id] = @user_id
	END
	UPDATE mom_client_expenses_b
	SET
		hh_total = @hh_total,
		uu_total = @uu_total,
		ll_total = @ll_total,
		tt_total = @tt_total,
		mm_total = @mm_total,
		ee_total = @ee_total,
		cc_total = @cc_total,
		ss_total = @ss_total,
		dd_total = @dd_total,
		oo_total = @oo_total
	WHERE client_id = @client_id
	AND [user_id] = @user_id
END