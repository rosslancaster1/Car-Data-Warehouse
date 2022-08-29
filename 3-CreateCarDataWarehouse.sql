-----------------------------------------------------------------
--	You must be in the Master database when you create a database
-----------------------------------------------------------------

USE [master]
GO

-----------------------------------------------------------------
--	You must drop the database before you create it
-----------------------------------------------------------------

DROP DATABASE [CarDW]
GO

-----------------------------------------------------------------
--	Create the CarDW database
--	https://docs.microsoft.com/en-us/sql/t-sql/statements/create-database-transact-sql?view=sql-server-ver15&tabs=sqlpool
-----------------------------------------------------------------

CREATE DATABASE [CarDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CarDW.mdf' , SIZE = 20480KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CarDW_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
-----------------------------------------------------------------
--	Declare the Car DW database as the active database
-----------------------------------------------------------------
USE [CarDW]
GO
