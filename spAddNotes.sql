/****** Object:  StoredProcedure [dbo].[spAddNotes]    Script Date: 1/15/2021 11:20:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spAddNotes]
@client_id int,
@mod char(1),
@page char(2),
@notes varchar(max)
AS
BEGIN
	if (SELECT COUNT(*) FROM mom_client_notes WHERE client_id = @client_id and mod = @mod and [page] = @page) > 0
	BEGIN
		UPDATE mom_client_notes SET notes = @notes WHERE 
		client_id = @client_id and mod = @mod and [page] = @page
	END
	ELSE
	begin
		INSERT into mom_client_notes (client_id, [mod], [page], notes)
		VALUES (@client_id, @mod, @page, @notes)
	end
END