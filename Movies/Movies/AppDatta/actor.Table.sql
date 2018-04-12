CREATE TABLE [dbo].[actors]
(
	[actorID] INT NOT NULL identity(1,1) PRIMARY KEY,
	[filmName] varchar(50) not null,
	[actorName] varchar(50) not null,
)
