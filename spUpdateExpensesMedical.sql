/****** Object:  StoredProcedure [dbo].[spUpdateExpensesMedical]    Script Date: 1/15/2021 11:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spUpdateExpensesMedical]
@client_id int,
@user_id int,
@current_module char(1), 
@mm_health_insurance float,
@mm_disablity_insurance float,
@mm_life_insurance float,
@mm_doctor float,
@mm_dentist float,
@mm_eye_care float,
@mm_veterinarian float,
@mm_prescriptions float,
@mm_otc float,
@mm_elder_care float,
@mm_others float,
@mm_total float
AS
BEGIN
	IF @current_module = 'F'
	BEGIN
		UPDATE mom_client_expenses SET 
		mm_health_insurance = @mm_health_insurance,
		mm_disablity_insurance = @mm_disablity_insurance,
		mm_life_insurance = @mm_life_insurance,
		mm_doctor = @mm_doctor,
		mm_dentist  = @mm_dentist,
		mm_eye_care = @mm_eye_care,
		mm_veterinarian = @mm_veterinarian,
		mm_prescriptions = @mm_prescriptions,
		mm_otc = @mm_otc,
		mm_elder_care = @mm_elder_care,
		mm_others = @mm_others,
		mm_total = @mm_total
		WHERE client_id=@client_id
		AND [user_id] = @user_id
	END
	UPDATE mom_client_expenses_b SET 
	mm_health_insurance = @mm_health_insurance,
	mm_disablity_insurance = @mm_disablity_insurance,
	mm_life_insurance = @mm_life_insurance,
	mm_doctor = @mm_doctor,
	mm_dentist  = @mm_dentist,
	mm_eye_care = @mm_eye_care,
	mm_veterinarian = @mm_veterinarian,
	mm_prescriptions = @mm_prescriptions,
	mm_otc = @mm_otc,
	mm_elder_care = @mm_elder_care,
	mm_others = @mm_others,
	mm_total = @mm_total
	WHERE client_id=@client_id
	AND [user_id] = @user_id
END