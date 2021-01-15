/****** Object:  StoredProcedure [dbo].[GetCounselings]    Script Date: 1/15/2021 11:19:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetCounselings]
@userID int = 0,
@agencyID int = 0,
@isAdmin bit = 0
AS
BEGIN
if @userID > 0
	BEGIN
	SELECT i.*,
	 CONVERT(nvarchar, DATEADD(s, total_time, '00:00:00'), 8) AS totaltime,
	 'Certificate' as certificate,
	 (c.first_name + ' ' + c.last_name) as name, 
	 a.agency_name 
	FROM mom_client_info i
	 INNER JOIN contact_master c on i.user_id = c.contact_id
	 INNER JOIN agency_master a on c.agency_id = a.agency_id
	 WHERE i.[user_id] = @userID
	 AND i.lastaccess between DATEADD(D, -30, GETDATE()) And GETDATE()	 
	 ORDER BY i.client_id DESC
	END
ELSE IF @agencyID > 0
	BEGIN
	SELECT i.*,
	 CONVERT(nvarchar, DATEADD(s, total_time, '00:00:00'), 8) AS totaltime,
	 'Certificate' as certificate,
	 (c.first_name + ' ' + c.last_name) as name, 
	 a.agency_name 
	FROM mom_client_info i
	 INNER JOIN contact_master c on i.user_id = c.contact_id
	 INNER JOIN agency_master a on c.agency_id = a.agency_id
	 WHERE i.[user_id] in
	 (SELECT contact_id FROM contact_master WHERE agency_id = @agencyID)
		AND i.lastaccess between DATEADD(D, -30, GETDATE()) And GETDATE()
	 ORDER BY i.client_id DESC
	END
ELSE IF @isAdmin = 1
	BEGIN
	SELECT i.*,
	 CONVERT(nvarchar, DATEADD(s, total_time, '00:00:00'), 8) AS totaltime,
	 'Certificate' as certificate,
	 (c.first_name + ' ' + c.last_name) as name, 
	 a.agency_name 
	FROM mom_client_info i
	 INNER JOIN contact_master c on i.user_id = c.contact_id
	 INNER JOIN agency_master a on c.agency_id = a.agency_id
	 WHERE i.lastaccess between DATEADD(D, -30, GETDATE()) And GETDATE()
	 ORDER BY i.client_id DESC
	END
END