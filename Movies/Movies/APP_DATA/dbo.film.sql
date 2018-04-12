CREATE TABLE [dbo].[film] (
    [filmName] VARCHAR (50)    NOT NULL,
    [year]     INT             NOT NULL,
    [runTime]  VARCHAR (50)    NOT NULL,
    [genre]    VARCHAR (50)    NOT NULL,
    [prodComp] VARCHAR (50)    DEFAULT (NULL) NULL,
    [boxSales] DECIMAL (13, 2) DEFAULT (NULL) NULL,
    [idmb]     DECIMAL (2, 1)  DEFAULT (NULL) NULL,
    [rotten]   INT             DEFAULT (NULL) NULL,
    PRIMARY KEY CLUSTERED ([filmName] ASC)
);

