/****** Object:  StoredProcedure [dbo].[StoreDMP]    Script Date: 1/28/2021 4:38:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[StoreDMP]
@client_id int,
@user_id varchar(32),
@dmp_result varchar(200),
@lastaccess datetime
AS
BEGIN
	UPDATE mom_client_info SET dmp_result=@dmp_result, lastaccess = @lastaccess WHERE client_id = @client_id and user_id=@user_id
END
GO

