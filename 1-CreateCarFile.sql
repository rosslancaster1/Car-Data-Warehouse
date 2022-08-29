--	Create Car database

USE [master]
GO

/****** Object:  Database [Car]    Script Date: 11/4/2021 5:04:46 PM ******/
DROP DATABASE [Car]
GO

/****** Object:  Database [Car]    Script Date: 11/4/2021 5:04:46 PM ******/
CREATE DATABASE [Car]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Car_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Car_Data.mdf' , SIZE = 109504KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Car_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Car_Log.ldf' , SIZE = 193536KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

USE Car
GO

--	Create AdFile table

/****** Object:  Table [dbo].[AdFile]    Script Date: 11/4/2021 5:03:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdFile]') AND type in (N'U'))
DROP TABLE [dbo].[AdFile]
GO

/****** Object:  Table [dbo].[AdFile]    Script Date: 11/4/2021 5:03:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AdFile](
	[Make] [varchar](50) NULL,
	[Genmodel] [varchar](50) NULL,
	[GenmodelID] [varchar](50) NULL,
	[AdvID] [varchar](50) NULL,
	[Adv_Year] [varchar](50) NULL,
	[Adv_Month] [varchar](50) NULL,
	[AdMonthID] [varchar] (50) NULL,
	[Color] [varchar](50) NULL,
	[Reg_Year] [varchar](50) NULL,
	[Bodytype] [varchar](50) NULL,
	[Mileage] [varchar](50) NULL,
	[Engine_Size] [varchar](50) NULL,
	[Transmission] [varchar](50) NULL,
	[Fuel_Type] [varchar](50) NULL,
	[Price] [varchar](50) NULL,
	[Seat_Num] [varchar](50) NULL,
	[Door_Num] [varchar](50) NULL
) ON [PRIMARY]
GO

--	Load AdFile table from Ad_table.csv using BULK INSERT
--	**Change the path to where you stored the csv file**


bulk insert Adfile
from 'C:\CarDW\Ad_table.csv'
with (format = 'csv')

--	Create SalesFile table

/****** Object:  Table [dbo].[SalesFile]    Script Date: 11/4/2021 5:03:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesFile]') AND type in (N'U'))
DROP TABLE [dbo].[SalesFile]
GO

/****** Object:  Table [dbo].[SalesFile]    Script Date: 11/4/2021 5:03:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SalesFile](
	[Make] [varchar](50) NULL,
	[Genmodel] [varchar](50) NULL,
	[GenmodelID] [varchar](50) NULL,
	[2020] [varchar](50) NULL,
	[2019] [varchar](50) NULL,
	[2018] [varchar](50) NULL,
	[2017] [varchar](50) NULL,
	[2016] [varchar](50) NULL,
	[2015] [varchar](50) NULL,
	[2014] [varchar](50) NULL,
	[2013] [varchar](50) NULL,
	[2012] [varchar](50) NULL,
	[2011] [varchar](50) NULL,
	[2010] [varchar](50) NULL,
	[2009] [varchar](50) NULL,
	[2008] [varchar](50) NULL,
	[2007] [varchar](50) NULL,
	[2006] [varchar](50) NULL,
	[2005] [varchar](50) NULL,
	[2004] [varchar](50) NULL,
	[2003] [varchar](50) NULL,
	[2002] [varchar](50) NULL,
	[2001] [varchar](50) NULL
) ON [PRIMARY]
GO

--	Load SalesFile table from Sales_table.csv using BULK INSERT
--	**Change the path to where you stored the csv file**


bulk insert Salesfile
from 'C:\CarDW\Sales_table.csv'
with (format = 'csv')

--	Create PriceFile table

/****** Object:  Table [dbo].[PriceFile]    Script Date: 11/4/2021 5:03:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PriceFile]') AND type in (N'U'))
DROP TABLE [dbo].[PriceFile]
GO

/****** Object:  Table [dbo].[PriceFile]    Script Date: 11/4/2021 5:03:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PriceFile](
	[PriceID] [varchar] (50) NULL,
	[Make] [varchar](50) NULL,
	[Genmodel] [varchar](50) NULL,
	[GenmodelID] [varchar](50) NULL,
	[Year] [varchar](50) NULL,
	[Entry_Price] [varchar](50) NULL
) ON [PRIMARY]
GO

--	Load PriceFile table from Price_table.csv using BULK INSERT
--	**Change the path to where you stored the csv file**


bulk insert Pricefile
from 'C:\CarDW\Price_table.csv'
with (format = 'csv')

--	References
-----------------
--	Create Database
-- https://docs.microsoft.com/en-us/sql/t-sql/statements/create-database-transact-sql?view=sql-server-ver15&tabs=sqlpool
--
--	Create table
--	https://docs.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver15
--
--	Bulk Insert
--	https://docs.microsoft.com/en-us/sql/t-sql/statements/bulk-insert-transact-sql?view=sql-server-ver15
--
--	