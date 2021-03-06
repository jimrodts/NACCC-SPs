/****** Object:  StoredProcedure [dbo].[AddUpdateNewUser]    Script Date: 1/26/2021 11:49:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AddUpdateNewUser]
@ContactID int,
@ContactCounselor int,
@strFName varchar(50),
@strLName varchar(50),
@iAgencyID int,
@userID UniqueIdentifier,
@strPhoneNum varchar(20),
@strCompanyBranchName varchar(50),
@strAddress varchar(100),
@strAddress2 varchar(50),
@strCity varchar(50),
@strState char(2),
@strZip varchar(15),
@strCell varchar(20),
@strFax varchar(20),
@strEMail varchar(150),
@request_pbc bit,
@request_dmp bit,
@approved_for_pbc bit,
@approved_for_dmp bit,
@counselor_cert_number varchar(50),
@counselor_cert_issuer varchar(150)
AS
BEGIN
	IF @ContactID = 0
	BEGIN
		insert into contact_master (contact_counselor, first_name, last_name, agency_id, userGUID, address1, address2, city, [state], zip, phone1, cell, fax, email,branch_name,request_pbc,request_dmp,approved_for_pbc, approved_for_dmp, counselor_cert_number, counselor_cert_issuer)
		values(@ContactCounselor ,@strFName, @strLName, @iAgencyID, @userID, @strAddress, @strAddress2, @strCity, @strState, @strZip, @strPhoneNum, @strCell, @strFax, @strEMail,@strCompanyBranchName,@request_pbc,@request_dmp,@approved_for_pbc,@approved_for_dmp,@counselor_cert_number, @counselor_cert_issuer)
		
		select @@IDENTITY;
	END
	ELSE
	BEGIN
		UPDATE contact_master SET
		contact_counselor = @ContactCounselor,
		first_name = @strFName,
		last_name = @strLName,
		branch_name = @strCompanyBranchName,
		agency_id = @iAgencyID,
		userGUID = @userID,
		address1 = @strAddress,
		address2 = @strAddress2,
		city = @strCity,
		[state] = @strState,
		zip = @strZip,
		phone1 = @strPhoneNum,
		cell = @strCell,
		fax = @strFax,
		email = @strEMail,
		request_pbc = @request_pbc,
		request_dmp = @request_dmp,
		approved_for_pbc = @approved_for_pbc,
		approved_for_dmp = @approved_for_dmp,
		counselor_cert_number = @counselor_cert_number,
		counselor_cert_issuer = @counselor_cert_issuer
		WHERE contact_id = @ContactID;
	END
END