/****** Object:  StoredProcedure [dbo].[GetIssuedCerts]    Script Date: 1/15/2021 11:20:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetIssuedCerts]
as
BEGIN
SELECT i.*,
 (c.first_name + ' ' + c.last_name) as counselor_name,
 a.agency_name 
FROM mom_client_info i
 INNER JOIN contact_master c on i.user_id = c.contact_id
 INNER JOIN agency_master a on c.agency_id = a.agency_id
WHERE pbc_issued is not null
ORDER BY pbc_issued desc
END