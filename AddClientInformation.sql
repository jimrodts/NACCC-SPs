/****** Object:  StoredProcedure [dbo].[AddClientInformation]    Script Date: 1/29/2021 6:35:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddClientInformation]
@client_id int OUTPUT,
@user_id int,
@client_name varchar(80),
@lastaccess datetime
AS
BEGIN
	INSERT INTO	mom_client_info
	(user_id, client_name, last_page, creation, lastaccess)
	VALUES (@user_id, @client_name,'courseoverview', @lastaccess, @lastaccess);
	SET @client_id = SCOPE_IDENTITY();
	INSERT INTO mom_client_expenses (client_id,user_id) VALUES (@client_id, @user_id);
	INSERT INTO mom_client_expenses_b (client_id,user_id) VALUES (@client_id, @user_id);
	INSERT INTO mom_client_assets (client_id,user_id) VALUES (@client_id, @user_id);
	INSERT INTO mom_client_liabilities (client_id,user_id) VALUES (@client_id, @user_id);
	INSERT INTO mom_client_income (client_id, user_id) VALUES (@client_id, @user_id);
END
GO

