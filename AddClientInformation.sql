/****** Object:  StoredProcedure [dbo].[AddClientInformation]    Script Date: 1/15/2021 10:57:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AddClientInformation]
@client_id int OUTPUT,
@user_id int,
@client_name varchar(80)
AS
BEGIN
	INSERT INTO	mom_client_info
	(user_id, client_name, last_page, lastaccess)
	VALUES (@user_id, @client_name,'courseoverview', GETDATE());
	SET @client_id = SCOPE_IDENTITY();
	INSERT INTO mom_client_expenses (client_id,user_id) VALUES (@client_id, @user_id);
	INSERT INTO mom_client_expenses_b (client_id,user_id) VALUES (@client_id, @user_id);
	INSERT INTO mom_client_assets (client_id,user_id) VALUES (@client_id, @user_id);
	INSERT INTO mom_client_liabilities (client_id,user_id) VALUES (@client_id, @user_id);
	INSERT INTO mom_client_income (client_id, user_id) VALUES (@client_id, @user_id);
END