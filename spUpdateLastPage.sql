/****** Object:  StoredProcedure [dbo].[spUpdateLastPage]    Script Date: 1/15/2021 11:25:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateLastPage]
@clientID int,
@last_page varchar(50),
@duration int
AS
BEGIN
	IF(@last_page = 'logout')
	begin
	UPDATE mom_client_info 
	SET lastaccess=GETDATE(), total_time = @duration
	WHERE client_id = @clientID
	end
	else
	begin
	UPDATE mom_client_info 
	SET lastaccess=GETDATE(), last_page = @last_page, total_time = @duration
	WHERE client_id = @clientID
	end
END