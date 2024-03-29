USE [Word Project]
GO
/****** Object:  StoredProcedure [dbo].[ProcedureIsWordUsed]    Script Date: 24.04.2016 22:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- =============================================
ALTER PROCEDURE [dbo].[ProcedureIsWordUsed]
	@wordEN NVARCHAR(30),
	@game INT
AS
DECLARE @count INT
DECLARE @wordID INT
BEGIN
	SET @wordID = (SELECT WordID FROM Words WHERE EnglishWord = @wordEN);
	SET @count = (SELECT COUNT(WordID) FROM Moves WHERE GameID = @game AND WordID = @wordID);
	IF(@count > 0)
		RETURN 0
	ELSE
		RETURN 1
END
