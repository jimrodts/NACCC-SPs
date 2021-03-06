/****** Object:  StoredProcedure [dbo].[spAddUpdateAssessment]    Script Date: 1/15/2021 11:20:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spAddUpdateAssessment]
@client_id int,
@assess_id tinyint,
@assess_answers varchar(8000),
@assess_total int,
@assess_totalv varchar(100),
@assess_count tinyint,
@assess_goal varchar(100)
AS
BEGIN
DECLARE @iCnt int
select @iCnt = COUNT(*) from mom_client_assessments where client_id = @client_id and assess_id = @assess_id
	IF (@iCnt = 0)
	BEGIN
		INSERT INTO	mom_client_assessments
		(client_id,
		assess_id,
		assess_answers,
		assess_total,
		assess_totalv,
		assess_count,
		assess_goal)
		VALUES
		(@client_id,
		@assess_id,
		@assess_answers,
		@assess_total,
		@assess_totalv,
		@assess_count,
		@assess_goal)
	END
	ELSE
	BEGIN
		UPDATE mom_client_assessments SET
		assess_answers = @assess_answers,
		assess_total = @assess_total,
		assess_totalv = @assess_totalv,
		assess_count = @assess_count,
		assess_goal = @assess_goal
		WHERE client_id = @client_id
		AND assess_id = @assess_id
	END
END