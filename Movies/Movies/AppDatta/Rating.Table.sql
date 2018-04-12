CREATE TABLE [dbo].[ratings]
(
	[ratingID] INT NOT NULL identity(1,1) PRIMARY KEY,
	[filmName] varchar(50) not null,
	[rating] decimal(2,1) not null,

)
