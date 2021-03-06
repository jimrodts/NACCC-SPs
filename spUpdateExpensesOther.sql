/****** Object:  StoredProcedure [dbo].[spUpdateExpensesOther]    Script Date: 1/15/2021 11:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateExpensesOther]
@client_id int,
@user_id int,
@current_module char(1),
@oo_other1_value float,
@oo_other2_value float,
@oo_other3_value float,
@oo_other4_value float,
@oo_other1_name varchar(100),
@oo_other2_name varchar(100),
@oo_other3_name varchar(100),
@oo_other4_name varchar(100),
@oo_total float
AS
BEGIN
	IF @current_module = 'F'
	BEGIN
		UPDATE mom_client_expenses
		SET
			oo_other1_value = @oo_other1_value,
			oo_other2_value = @oo_other2_value,
			oo_other3_value = @oo_other3_value,
			oo_other4_value = @oo_other4_value,
			oo_other1_name = @oo_other1_name,
			oo_other2_name = @oo_other2_name,
			oo_other3_name = @oo_other3_name,
			oo_other4_name = @oo_other4_name,
			oo_total = @oo_total
		WHERE client_id = @client_id
		AND [user_id] = @user_id
	END
	UPDATE mom_client_expenses_b
	SET
		oo_other1_value = @oo_other1_value,
		oo_other2_value = @oo_other2_value,
		oo_other3_value = @oo_other3_value,
		oo_other4_value = @oo_other4_value,
		oo_other1_name = @oo_other1_name,
		oo_other2_name = @oo_other2_name,
		oo_other3_name = @oo_other3_name,
		oo_other4_name = @oo_other4_name,
		oo_total = @oo_total
	WHERE client_id = @client_id
	AND [user_id] = @user_id
END