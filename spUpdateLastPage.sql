/****** Object:  StoredProcedure [dbo].[spUpdateLastPage]    Script Date: 1/28/2021 4:36:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateLastPage]
@clientID int,
@last_page varchar(50),
@duration int,
@lastaccess datetime
AS
BEGIN
	IF(@last_page = 'logout')
	begin
	UPDATE mom_client_info 
	SET lastaccess=@lastaccess, total_time = @duration
	WHERE client_id = @clientID
	end
	else
	begin
	UPDATE mom_client_info 
	SET lastaccess=@lastaccess, last_page = @last_page, total_time = @duration
	WHERE client_id = @clientID
	end
END
GO

