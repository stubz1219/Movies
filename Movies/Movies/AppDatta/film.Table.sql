CREATE TABLE [dbo].[film]
(
	[filmName] varchar(50)PRIMARY KEY NOT NULL,
	[year] int NOT NULL,
	[runTime] varchar(50) NOT NULL,
	[genre] varchar(50) NOT NULL,
	[prodComp] varchar(50) default Null,
	[boxSales] decimal(13,2) default NULL,
	[idmb] decimal(2,1) default NULL,
)
