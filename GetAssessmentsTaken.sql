/****** Object:  StoredProcedure [dbo].[GetAssessmentsTaken]    Script Date: 1/15/2021 11:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetAssessmentsTaken]
@client_id int
AS
BEGIN
SELECT assess_id, desc_name, assess_score, assess_goal 
FROM  mom_client_assessments a 
INNER JOIN mom_assessment_name n ON a.assess_id = n.id 
WHERE  client_id=@client_id ORDER BY assess_id
END