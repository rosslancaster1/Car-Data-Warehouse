
USE Car
GO

--SELECT * 
--FROM AdFile VF

----
----	Perform Data Quality check
----

---- Make varchar(26) should be no longer than the longest make which is London Taxis International or no less than the shortest make (DS)
--SELECT *
--FROM AdFile
--WHERE LEN(Make) > 26 or len(make) <2


---- Make varchar(22) should be no longer than the longest genmodel (2 Series Active Tourer) or less than the shortest genmodel (the DS 3)
--------------------Need to remove alpina unspecified models 

--SELECT *
--FROM AdFile
--Where len(Genmodel) >22 or len(Genmodel) <1

------ GenmodelID varchar(5) should be no less than 3 characters and no more than 5 characters 
--SELECT *
--FROM AdFile
--WHERE Len(GenmodelID) <3 or Len(GenmodelID)>5 

------ AdID varchar(10) should be no less than 6 characters and no more than 11 characters 
--SELECT *
--FROM AdFile
--WHERE Len(AdvID) <6 or Len(AdvID)>11

------ Adv_Year date(4) should be between 2012 and 2021
--SELECT *
--FROM AdFile
--WHERE Adv_Year <2012 or Adv_Year>2021

------ Adv_Month date(2) should be between 1 and 12 as their 12 months 
--SELECT *
--FROM AdFile
--WHERE Adv_Month <1 or Adv_Month>12

------Three bad data points with month=13,17, and 33 need to be removed

----- AdMonthID should be between 6 and 7 characters
--Select *
--From AdFile
--Where len(AdMonthID)<6 or len(AdMonthID)>7

------ Color varchar(11) should not be longer than the longest color, Turquoise (11),or shorter than the shortest color, Red (3)
--SELECT *
--FROM AdFile
--WHERE Len(Color) <3 or len(Color)>11

------ Reg_Year date(4) should be between 1960 and 2021 
--SELECT *
--FROM AdFile
--WHERE Reg_Year <1960or Adv_Year>2021

------Remove vauxlhall corsa as it was first manufactured in 1992 not 1900

------ Bodytype varchar(15) should not be longer than the longest bodytype, car derived van (15),or shorter than the shortest bodytypes at 3 characters
--SELECT *
--FROM AdFile
--WHERE Len(Bodytype) <3 or len(Bodytype)>15

------ Mileage int(7) should be less than the record for most mileage in a car at 3 million
--SELECT *
--FROM AdFile
--WHERE Mileage>3000000

------One row written as one mile, fix, remove the car with over 6 million miles 

------ Engine Size varchar(5) should be less than 5 characters 
--SELECT *
--FROM AdFile
--WHERE len(Engine_Size)>5

-----Remove the three engines with the sizes in the thousands of liters 

------ Transmission varchar(14) should be either Automatic, Semi-Automatic, or Manual
--SELECT *
--FROM AdFile
--WHERE Transmission not in ('Automatic','Semi-Automatic','Manual')

------ Fuel_Type varchar(31) should be shorter than the shortest fuel type (hybrid petrol/electric plug-in) or shorter than the shortest fuel type Petrol (6)
--SELECT *
--FROM AdFile
--WHERE len(Fuel_type)>31 or len(Fuel_type)<6

------ Price int(7) should not be greater than ten million dollars 
--SELECT *
--FROM AdFile
--WHERE Price>10000000

----Remove price that is listed as uknown

------ Seat number int(2) should be at least one and less than or equal to the max number of seats, 17
--SELECT *
--FROM AdFile
--WHERE Seat_Num <1 or Seat_Num>17

------ Door int(2) should be at least two and less than 10
--SELECT *
--FROM AdFile
--WHERE Door_Num <2 or Door_Num>9

-----Remove the renault twizy where the door number is 0

----PriceID should be between 1 and 6333
--SELECT *
--FROM PriceFile
--WHERE PriceID<1 or PriceID>6333

------ Make varchar(26) should be no longer than the longest make which is London Taxis International or no less than the shortest make (DS)
--SELECT *
--FROM PriceFile
--WHERE LEN(Make) > 26 or len(make) <2


------ Make varchar(22) should be no longer than the longest genmodel (2 Series Active Tourer) or less than the shortest genmodel (the DS 3)
----------------------Need to remove alpina unspecified models 

--SELECT *
--FROM PriceFile
--Where len(Genmodel) >22 or len(Genmodel) <1

------ GenmodelID varchar(5) should be no less than 3 characters and no more than 5 characters 
--SELECT *
--FROM PriceFile
--WHERE Len(GenmodelID) <3 or Len(GenmodelID)>5 

----- Year int should be between 1998 and 2021
--SELECT *
--FROM PriceFile
--WHERE [Year]<1998 or [Year]>2021

------ Entry_price int(7) should be less than 10 million dollars and seven characters or less
--SELECT *
--FROM PriceFile
--WHERE Entry_price>10000000 or len(entry_price)>7

------ Make varchar(26) should be no longer than the longest make which is London Taxis International or no less than the shortest make (DS)
--SELECT *
--FROM SalesFile
--WHERE LEN(Make) > 26 or len(make) <2


------ Make varchar(22) should be no longer than the longest genmodel (2 Series Active Tourer) or less than the shortest genmodel (the DS 3)
----------------------Need to remove alpina unspecified models 

--SELECT *
--FROM SalesFile
--Where len(Genmodel) >22 or len(Genmodel) <1

-----change rolls royce silver seraph to just silver seraph

------ GenmodelID varchar(5) should be no less than 3 characters and no more than 5 characters 
--SELECT *
--FROM SalesFile
--WHERE Len(GenmodelID) <3 or Len(GenmodelID)>5 

-----Int (6), the most cars sold in a year in the UK was Ford with 152,777 so every year's sales must not be less than zero and less than 152,777
--Select *
--From SalesFile
--Where [2020]<0 or [2020]>152777

--Select *
--From SalesFile
--Where [2019]<0 or [2019]>152777

--Select *
--From SalesFile
--Where [2018]<0 or [2018]>152777

--Select *
--From SalesFile
--Where [2017]<0 or [2017]>152777

--Select *
--From SalesFile
--Where [2016]<0 or [2016]>152777

--Select *
--From SalesFile
--Where [2015]<0 or [2015]>152777

--Select *
--From SalesFile
--Where [2014]<0 or [2014]>152777

--Select *
--From SalesFile
--Where [2013]<0 or [2013]>152777

--Select *
--From SalesFile
--Where [2012]<0 or [2012]>152777

--Select *
--From SalesFile
--Where [2011]<0 or [2011]>152777

--Select *
--From SalesFile
--Where [2010]<0 or [2010]>152777

--Select *
--From SalesFile
--Where [2009]<0 or [2009]>152777

--Select *
--From SalesFile
--Where [2008]<0 or [2008]>152777

--Select *
--From SalesFile
--Where [2007]<0 or [2007]>152777

--Select *
--From SalesFile
--Where [2006]<0 or [2006]>152777

--Select *
--From SalesFile
--Where [2005]<0 or [2005]>152777

--Select *
--From SalesFile
--Where [2004]<0 or [2004]>152777

--Select *
--From SalesFile
--Where [2003]<0 or [2003]>152777

--Select *
--From SalesFile
--Where [2002]<0 or [2002]>152777

--Select *
--From SalesFile
--Where [2001]<0 or [2001]>152777


--------------------------------------------------
--
--	Create the AdODS table
--	Use data quality findings to create appropriate column data types
--
--------------------------------------------------

--	If the AdODS table exists, delete it

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdODS]') AND type in (N'U'))
DROP TABLE [dbo].[AdODS]
GO

--	Create the AdODS table

CREATE TABLE [dbo].[AdODS](
	[Make] [varchar](26),
	[Genmodel] [varchar] (22),
	[GenmodelID] [varchar] (5) NOT NULL,
	[AdvId] [varchar] (11) NOT NULL PRIMARY KEY,
	[Adv_Year] [int] Null,
	[Adv_Month] [int] Null,
	[AdMonthID] [varchar] (7) Null, 
	[Color] [varchar] (11) Null,
	[Reg_Year] [int] Null,
	[Bodytype] [varchar](15) Null,
	[Mileage] [int] Null,
	[Engine_Size] [varchar] (5) Null,
	[Transmission] [varchar](14) Null,
	[Fuel_Subcategory] [varchar](31) Null,
	[Price] [int] Null,
	[Seat_Num] [int] Null,
	[Door_Num] [int] Null
	)


--	
--	Add WHERE clause to remove corrupt data

INSERT INTO AdODS 
SELECT	AF.Make,
		AF.Genmodel,
		AF.GenmodelID,
		AF.AdvId,
		AF.Adv_Year,
		AF.Adv_Month, 
		AF.AdMonthID,
		AF.Color,
		AF.Reg_Year, 
		AF.Bodytype,
		AF.Mileage, 
		AF.Engine_Size,
		AF.Transmission,
		AF.Fuel_Type,
		AF.Price,
		AF.Seat_Num,
		AF.Door_Num
FROM AdFile AF
WHERE Adv_Month >0 and Adv_Month<13
and Reg_Year >1960 and Reg_Year<2021
and Mileage<3000000
and len(Engine_Size)<5
and Door_Num >1 and Door_Num<9

--	If the PriceODS table exists, delete it

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PriceODS]') AND type in (N'U'))
DROP TABLE [dbo].[PriceODS]
GO

--	Create the PriceODS table

CREATE TABLE [dbo].[PriceODS](
	[PriceID] [int] NOT NULL PRIMARY KEY,
	[Make] [varchar](26),
	[Genmodel] [varchar] (22),
	[GenmodelID] [varchar] (5) NOT NULL,
	[Year] [char] (4) Null,
	[Entry_price] [int] Null
	)

--	No corrupt data so WHERE clause is not needed to remove corrupt data 

INSERT INTO PriceODS 
SELECT	PF.PriceID,
		PF.Make,
		PF.Genmodel,
		PF.GenmodelID,
		PF.[Year],
		PF.Entry_price
FROM PriceFile PF

--	If the SalesODS table exists, delete it

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesODS]') AND type in (N'U'))
DROP TABLE [dbo].[SalesODS]
GO
--	Create the SalesODS table

CREATE TABLE [dbo].[SalesODS](
	[Make] [varchar](26),
	[Genmodel] [varchar] (22),
	[GenmodelID] [varchar] (5) NOT NULL PRIMARY KEY,
	[2020] [int] Null,
	[2019] [int] Null,
	[2018] [int] Null,
	[2017] [int] Null,
	[2016] [int] Null,
	[2015] [int] Null,
	[2014] [int] Null,
	[2013] [int] Null,
	[2012] [int] Null,
	[2011] [int] Null,
	[2010] [int] Null,
	[2009] [int] Null,
	[2008] [int] Null,
	[2007] [int] Null,
	[2006] [int] Null,
	[2005] [int] Null,
	[2004] [int] Null,
	[2003] [int] Null,
	[2002] [int] Null,
	[2001] [int] Null
	)

INSERT INTO SalesODS 
SELECT  SF.Make,
	    SF.Genmodel,
		SF.GenmodelID,
		SF.[2020],
		SF.[2019],
		SF.[2018],
		SF.[2017],
		SF.[2016],
		SF.[2015],
		SF.[2014],
		SF.[2013],
		SF.[2012],
		SF.[2011],
		SF.[2010],
		SF.[2009],
		SF.[2008],
		SF.[2007],
		SF.[2006],
		SF.[2005],
		SF.[2004],
		SF.[2003],
		SF.[2002],
		SF.[2001]
FROM SalesFile SF
WHERE len(Genmodel)< 22

--
--	REFEREENCES
--
--	Load data from the AdFile, PriceFile, and SalesFile into the CarODS using INSERT INTO
--		https://docs.microsoft.com/en-us/sql/t-sql/statements/insert-transact-sql?view=sql-server-ver15
--	Change data to conform
--		https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15



