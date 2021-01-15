/****** Object:  StoredProcedure [dbo].[StoreDMP]    Script Date: 1/15/2021 11:27:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[StoreDMP]
@client_id int,
@user_id varchar(32),
@dmp_result varchar(200)
AS
BEGIN
	UPDATE mom_client_info SET dmp_result=@dmp_result, lastaccess = GETDATE() WHERE client_id = @client_id and user_id=@user_id
END