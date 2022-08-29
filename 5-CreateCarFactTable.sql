-----------------------------------------------------------------
--	You must be in the Master database when you create a database
-----------------------------------------------------------------

USE [CarDW]
GO

-----------------------------------------------------------------
--	You must drop the Fact table before you create it
-----------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factAd]') AND type in (N'U'))
DROP TABLE [dbo].[factAd]
GO
-----------------------------------------------------------------
--	Create the factAd table
-----------------------------------------------------------------

CREATE TABLE [dbo].[factAd](
	[MakeID] [char](2) NOT NULL ,
		CONSTRAINT FK_dimMake_factAd FOREIGN KEY (MakeID)
		REFERENCES dimMake (MakeID),
	[GenmodelID] [varchar] (5) NOT NULL,
	[AdvId] [varchar] (11) NOT NULL,
		CONSTRAINT PK_factAd PRIMARY KEY CLUSTERED (AdvID),
	[AdMonthID] [char] (7) Null, 
		CONSTRAINT FK_dimAdMonth_factAd FOREIGN KEY (AdMonthID)
		REFERENCES dimAdMonth (AdMonthID),
	[ColorID] [char] (2) NULL,
		CONSTRAINT FK_dimColor_factAd FOREIGN KEY (ColorID)
		REFERENCES dimColor (ColorID),
	[Reg_Year] [int] Null,
	[BodytypeID] [char] (3) NULL,
		CONSTRAINT FK_dimBodytype_factAd FOREIGN KEY (BodytypeID)
		REFERENCES dimBodytype (BodytypeID),
	[Mileage] [int] Null,
	[Engine_Size] [varchar] (5) Null,
	[TransmissionID] [char] (1) NULL,
		CONSTRAINT FK_dimTransmission_factAd FOREIGN KEY (TransmissionID)
		REFERENCES dimTransmission (TransmissionID),
	[FuelSubcategoryID] [char] (7) NULL,
		CONSTRAINT FK_dimFuelSubcategory_factAd FOREIGN KEY (FuelSubcategoryID)
		REFERENCES dimFuelSubcategory (FuelSubcategoryID),
	[Price] [int] Null,
	[Seat_Num] [int] Null,
	[Door_Num] [int] Null

	)

-----------------------------------------------------------------
--	Load the factAd table
-----------------------------------------------------------------
USE CarDW
GO 
INSERT INTO factAd
SELECT	MakeID =
		case
			when Make= 'ABARTH'then '01'
			when Make= 'ACURA'then '02'
			when Make= 'AIXAM'then '03'
			when Make= 'ALFA ROMEO'then '04'
			when Make= 'ASTON MARTIN'then '05'
			when Make= 'AUDI'then '06'
			when Make= 'BENTLEY'then '07'
			when Make= 'BMW'then '08'
			when Make= 'BROOKE'then '09'
			when Make= 'BUGATTI'then '10'
			when Make= 'CADILLAC'then '11'
			when Make= 'CATERHAM'then '12'
			when Make= 'CHEVROLET'then '13'
			when Make= 'CHRYSLER'then '14'
			when Make= 'CITROEN'then '15'
			when Make= 'CORVETTE'then '16'
			when Make= 'DACIA'then '17'
			when Make= 'DAEWOO'then '18'
			when Make= 'DAIHATSU'then '19'
			when Make= 'DAIMLER'then '20'
			when Make= 'DAX'then '21'
			when Make= 'DODGE'then '22'
			when Make= 'DS'then '23'
			when Make= 'FERRARI'then '24'
			when Make= 'FIAT'then '25'
			when Make= 'FORD'then '26'
			when Make= 'GINETTA'then '27'
			when Make= 'GMC'then '28'
			when Make= 'GREAT WALL'then '29'
			when Make= 'GRINNALL'then '30'
			when Make= 'HONDA'then '31'
			when Make= 'HUMMER'then '32'
			when Make= 'HYUNDAI'then '33'
			when Make= 'INFINITI'then '34'
			when Make= 'ISUZU'then '35'
			when Make= 'JAGUAR'then '36'
			when Make= 'JEEP'then '37'
			when Make= 'JENSEN'then '38'
			when Make= 'KIA'then '39'
			when Make= 'KOENIGSEGG'then '40'
			when Make= 'KTM'then '41'
			when Make= 'LAMBORGHINI'then '42'
			when Make= 'LAND ROVER'then '43'
			when Make= 'LEXUS'then '44'
			when Make= 'LINCOLN'then '45'
			when Make= 'LONDON TAXIS INTERNATIONAL'then '46'
			when Make= 'LOTUS'then '47'
			when Make= 'MASERATI'then '48'
			when Make= 'MAYBACH'then '49'
			when Make= 'MAZDA'then '50'
			when Make= 'MCLAREN'then '51'
			when Make= 'MERCEDES-BENZ'then '52'
			when Make= 'MEV'then '53'
			when Make= 'MG'then '54'
			when Make= 'MICROCAR'then '55'
			when Make= 'MINI'then '56'
			when Make= 'MITSUBISHI'then '57'
			when Make= 'MORGAN'then '58'
			when Make= 'NISSAN'then '59'
			when Make= 'NOBLE'then '60'
			when Make= 'OPEL'then '61'
			when Make= 'PAGANI'then '62'
			when Make= 'PERODUA'then '63'
			when Make= 'PEUGEOT'then '64'
			when Make= 'PILGRIM'then '65'
			when Make= 'PORSCHE'then '66'
			when Make= 'PROTON'then '67'
			when Make= 'RADICAL'then '68'
			when Make= 'RAW'then '69'
			when Make= 'RENAULT'then '70'
			when Make= 'REVA'then '71'
			when Make= 'ROLLS-ROYCE'then '72'
			when Make= 'ROVER'then '73'
			when Make= 'SAAB'then '74'
			when Make= 'SANTANA'then '75'
			when Make= 'SEAT'then '76'
			when Make= 'SEBRING'then '77'
			when Make= 'SKODA'then '78'
			when Make= 'SMART'then '79'
			when Make= 'SSANGYONG'then '80'
			when Make= 'SUBARU'then '81'
			when Make= 'SUZUKI'then '82'
			when Make= 'TATA'then '83'
			when Make= 'TESLA'then '84'
			when Make= 'TIGER'then '85'
			when Make= 'TOYOTA'then '86'
			when Make= 'TVR'then '87'
			when Make= 'VAUXHALL'then '88'
			when Make= 'VOLKSWAGEN'then '89'
			when Make= 'VOLVO'then '90'
			when Make= 'WESTFIELD'then '91'
			when Make= 'ZENOS'then '92'
			else Make
		end,
		GenmodelID,
		AdvID,
		AdMonthID,
		ColorID =
		case
			when Color= 'Silver'then '01'
			when Color= 'Grey'then '02'
			when Color= 'Blue'then '03'
			when Color= 'Green'then '04'
			when Color= 'Black'then '05'
			when Color= 'White'then '06'
			when Color= 'Red'then '07'
			when Color= 'Brown'then '08'
			when Color= 'Orange'then '09'
			when Color= 'Maroon'then '10'
			when Color= 'Purple'then '11'
			when Color= 'Yellow'then '12'
			when Color= 'Multicolour'then '13'
			when Color= 'Gold'then '14'
			when Color= 'Pink'then '15'
			when Color= 'Bronze'then '16'
			when Color= 'Beige'then '17'
			when Color= 'Burgundy'then '18'
			when Color= 'Magenta'then '19'
			when Color= 'Turquoise'then '20'
			when Color= 'Indigo'then '21'
			when Color= 'Navy'then '22'
			else Color
		end,
		Reg_Year,
		BodytypeID =
		case
			when Bodytype= 'Saloon'then '01'
			when Bodytype= 'Convertible'then '02'
			when Bodytype= 'SUV'then '03'
			when Bodytype= 'Estate'then '04'
			when Bodytype= 'Coupe'then '05'
			when Bodytype= 'Hatchback'then '06'
			when Bodytype= 'MPV'then '07'
			when Bodytype= 'Combi Van'then '08'
			when Bodytype= 'Panel Van'then '09'
			when Bodytype= 'Minibus'then '10'
			when Bodytype= 'Window Van'then '11'
			when Bodytype= 'Pickup'then '12'
			when Bodytype= 'Manual'then '13'
			when Bodytype= 'Car Derived Van'then '14'
			when Bodytype= 'Tipper'then '15'
			when Bodytype= 'Camper'then '16'
			when Bodytype= 'Chassis Cab'then '17'
			when Bodytype= 'Limousine'then '18'
			else Bodytype
		end,
		Mileage,
		Engine_Size,
		TransmissionID =
		case
			when Transmission = 'Automatic' then '1'
			when Transmission = 'Semi-Automatic' then '2'
			when Transmission = 'Manual' then '3'
			else Transmission
		end,
		FuelSubcategoryID =
		case 
			when Fuel_Subcategory= 'Petrol'then '01'
			when Fuel_Subcategory= 'Diesel'then '02'
			when Fuel_Subcategory= 'Petrol Plug-in Hybrid'then '03'
			when Fuel_Subcategory= 'Petrol Ethanol'then '04'
			when Fuel_Subcategory= 'Hybrid  Petrol/Electric Plug-in'then '05'
			when Fuel_Subcategory= 'Electric'then '06'
			when Fuel_Subcategory= 'Hybrid  Diesel/Electric'then '07'
			when Fuel_Subcategory= 'Bi Fuel'then '08'
			when Fuel_Subcategory= 'Hybrid  Petrol/Electric'then '09'
			when Fuel_Subcategory= 'Petrol Hybrid'then '10'
			when Fuel_Subcategory= 'Diesel Hybrid'then '11'
			when Fuel_Subcategory= 'Diesel Plug-in Hybrid'then '12'
			when Fuel_Subcategory= 'Hybrid  Diesel/Electric Plug-in'then '13'
			else Fuel_Subcategory
		end,
		Price,
		Seat_Num,
		Door_Num

FROM [Car].DBO.AdODS

-----------------------------------------------------------------
--	You must drop the factPrice table before you create it
-----------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factPrice]') AND type in (N'U'))
DROP TABLE [dbo].[factPrice]
GO
-----------------------------------------------------------------
--	Create the factPrice table
-----------------------------------------------------------------

CREATE TABLE [dbo].[factPrice](
	[PriceId] [int] NOT NULL,
		CONSTRAINT PK_factPrice PRIMARY KEY CLUSTERED (PriceID),
	[MakeID] [char](2) NOT NULL ,
		CONSTRAINT FK_dimMake_factPrice FOREIGN KEY (MakeID)
		REFERENCES dimMake (MakeID),
	[GenmodelID] [varchar] (5) NOT NULL,
	[Year] [char] (4) Null,
	[Entry_price] [int] Null
	)

-----------------------------------------------------------------
--	Load the factPrice table
-----------------------------------------------------------------
USE CarDW
GO 
INSERT INTO factPrice
SELECT	PriceId,
		MakeID =
		case
			when Make= 'ABARTH'then '01'
			when Make= 'ACURA'then '02'
			when Make= 'AIXAM'then '03'
			when Make= 'ALFA ROMEO'then '04'
			when Make= 'ASTON MARTIN'then '05'
			when Make= 'AUDI'then '06'
			when Make= 'BENTLEY'then '07'
			when Make= 'BMW'then '08'
			when Make= 'BROOKE'then '09'
			when Make= 'BUGATTI'then '10'
			when Make= 'CADILLAC'then '11'
			when Make= 'CATERHAM'then '12'
			when Make= 'CHEVROLET'then '13'
			when Make= 'CHRYSLER'then '14'
			when Make= 'CITROEN'then '15'
			when Make= 'CORVETTE'then '16'
			when Make= 'DACIA'then '17'
			when Make= 'DAEWOO'then '18'
			when Make= 'DAIHATSU'then '19'
			when Make= 'DAIMLER'then '20'
			when Make= 'DAX'then '21'
			when Make= 'DODGE'then '22'
			when Make= 'DS'then '23'
			when Make= 'FERRARI'then '24'
			when Make= 'FIAT'then '25'
			when Make= 'FORD'then '26'
			when Make= 'GINETTA'then '27'
			when Make= 'GMC'then '28'
			when Make= 'GREAT WALL'then '29'
			when Make= 'GRINNALL'then '30'
			when Make= 'HONDA'then '31'
			when Make= 'HUMMER'then '32'
			when Make= 'HYUNDAI'then '33'
			when Make= 'INFINITI'then '34'
			when Make= 'ISUZU'then '35'
			when Make= 'JAGUAR'then '36'
			when Make= 'JEEP'then '37'
			when Make= 'JENSEN'then '38'
			when Make= 'KIA'then '39'
			when Make= 'KOENIGSEGG'then '40'
			when Make= 'KTM'then '41'
			when Make= 'LAMBORGHINI'then '42'
			when Make= 'LAND ROVER'then '43'
			when Make= 'LEXUS'then '44'
			when Make= 'LINCOLN'then '45'
			when Make= 'LONDON TAXIS INTERNATIONAL'then '46'
			when Make= 'LOTUS'then '47'
			when Make= 'MASERATI'then '48'
			when Make= 'MAYBACH'then '49'
			when Make= 'MAZDA'then '50'
			when Make= 'MCLAREN'then '51'
			when Make= 'MERCEDES-BENZ'then '52'
			when Make= 'MEV'then '53'
			when Make= 'MG'then '54'
			when Make= 'MICROCAR'then '55'
			when Make= 'MINI'then '56'
			when Make= 'MITSUBISHI'then '57'
			when Make= 'MORGAN'then '58'
			when Make= 'NISSAN'then '59'
			when Make= 'NOBLE'then '60'
			when Make= 'OPEL'then '61'
			when Make= 'PAGANI'then '62'
			when Make= 'PERODUA'then '63'
			when Make= 'PEUGEOT'then '64'
			when Make= 'PILGRIM'then '65'
			when Make= 'PORSCHE'then '66'
			when Make= 'PROTON'then '67'
			when Make= 'RADICAL'then '68'
			when Make= 'RAW'then '69'
			when Make= 'RENAULT'then '70'
			when Make= 'REVA'then '71'
			when Make= 'ROLLS-ROYCE'then '72'
			when Make= 'ROVER'then '73'
			when Make= 'SAAB'then '74'
			when Make= 'SANTANA'then '75'
			when Make= 'SEAT'then '76'
			when Make= 'SEBRING'then '77'
			when Make= 'SKODA'then '78'
			when Make= 'SMART'then '79'
			when Make= 'SSANGYONG'then '80'
			when Make= 'SUBARU'then '81'
			when Make= 'SUZUKI'then '82'
			when Make= 'TATA'then '83'
			when Make= 'TESLA'then '84'
			when Make= 'TIGER'then '85'
			when Make= 'TOYOTA'then '86'
			when Make= 'TVR'then '87'
			when Make= 'VAUXHALL'then '88'
			when Make= 'VOLKSWAGEN'then '89'
			when Make= 'VOLVO'then '90'
			when Make= 'WESTFIELD'then '91'
			when Make= 'ZENOS'then '92'
			else Make
		end,
		GenmodelID,
		[Year],
		Entry_Price
			

FROM [Car].DBO.PriceODS

-----------------------------------------------------------------
--	You must drop the factSales table before you create it
-----------------------------------------------------------------

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factSales]') AND type in (N'U'))
DROP TABLE [dbo].[factSales]
GO
-----------------------------------------------------------------
--	Create the factSales table
-----------------------------------------------------------------

CREATE TABLE [dbo].[factSales](
	[MakeID] [char](2) NOT NULL ,
		CONSTRAINT FK_dimMake_factSales FOREIGN KEY (MakeID)
		REFERENCES dimMake (MakeID),
	[GenmodelID] [varchar] (5) NOT NULL,
		CONSTRAINT PK_factSales PRIMARY KEY CLUSTERED (GenModelID),
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

-----------------------------------------------------------------
--	Load the factPrice table
-----------------------------------------------------------------
USE CarDW
GO 
INSERT INTO factSales
SELECT	MakeID =
		case
			when Make= 'ABARTH'then '01'
			when Make= 'ACURA'then '02'
			when Make= 'AIXAM'then '03'
			when Make= 'ALFA ROMEO'then '04'
			when Make= 'ASTON MARTIN'then '05'
			when Make= 'AUDI'then '06'
			when Make= 'BENTLEY'then '07'
			when Make= 'BMW'then '08'
			when Make= 'BROOKE'then '09'
			when Make= 'BUGATTI'then '10'
			when Make= 'CADILLAC'then '11'
			when Make= 'CATERHAM'then '12'
			when Make= 'CHEVROLET'then '13'
			when Make= 'CHRYSLER'then '14'
			when Make= 'CITROEN'then '15'
			when Make= 'CORVETTE'then '16'
			when Make= 'DACIA'then '17'
			when Make= 'DAEWOO'then '18'
			when Make= 'DAIHATSU'then '19'
			when Make= 'DAIMLER'then '20'
			when Make= 'DAX'then '21'
			when Make= 'DODGE'then '22'
			when Make= 'DS'then '23'
			when Make= 'FERRARI'then '24'
			when Make= 'FIAT'then '25'
			when Make= 'FORD'then '26'
			when Make= 'GINETTA'then '27'
			when Make= 'GMC'then '28'
			when Make= 'GREAT WALL'then '29'
			when Make= 'GRINNALL'then '30'
			when Make= 'HONDA'then '31'
			when Make= 'HUMMER'then '32'
			when Make= 'HYUNDAI'then '33'
			when Make= 'INFINITI'then '34'
			when Make= 'ISUZU'then '35'
			when Make= 'JAGUAR'then '36'
			when Make= 'JEEP'then '37'
			when Make= 'JENSEN'then '38'
			when Make= 'KIA'then '39'
			when Make= 'KOENIGSEGG'then '40'
			when Make= 'KTM'then '41'
			when Make= 'LAMBORGHINI'then '42'
			when Make= 'LAND ROVER'then '43'
			when Make= 'LEXUS'then '44'
			when Make= 'LINCOLN'then '45'
			when Make= 'LONDON TAXIS INTERNATIONAL'then '46'
			when Make= 'LOTUS'then '47'
			when Make= 'MASERATI'then '48'
			when Make= 'MAYBACH'then '49'
			when Make= 'MAZDA'then '50'
			when Make= 'MCLAREN'then '51'
			when Make= 'MERCEDES-BENZ'then '52'
			when Make= 'MEV'then '53'
			when Make= 'MG'then '54'
			when Make= 'MICROCAR'then '55'
			when Make= 'MINI'then '56'
			when Make= 'MITSUBISHI'then '57'
			when Make= 'MORGAN'then '58'
			when Make= 'NISSAN'then '59'
			when Make= 'NOBLE'then '60'
			when Make= 'OPEL'then '61'
			when Make= 'PAGANI'then '62'
			when Make= 'PERODUA'then '63'
			when Make= 'PEUGEOT'then '64'
			when Make= 'PILGRIM'then '65'
			when Make= 'PORSCHE'then '66'
			when Make= 'PROTON'then '67'
			when Make= 'RADICAL'then '68'
			when Make= 'RAW'then '69'
			when Make= 'RENAULT'then '70'
			when Make= 'REVA'then '71'
			when Make= 'ROLLS-ROYCE'then '72'
			when Make= 'ROVER'then '73'
			when Make= 'SAAB'then '74'
			when Make= 'SANTANA'then '75'
			when Make= 'SEAT'then '76'
			when Make= 'SEBRING'then '77'
			when Make= 'SKODA'then '78'
			when Make= 'SMART'then '79'
			when Make= 'SSANGYONG'then '80'
			when Make= 'SUBARU'then '81'
			when Make= 'SUZUKI'then '82'
			when Make= 'TATA'then '83'
			when Make= 'TESLA'then '84'
			when Make= 'TIGER'then '85'
			when Make= 'TOYOTA'then '86'
			when Make= 'TVR'then '87'
			when Make= 'VAUXHALL'then '88'
			when Make= 'VOLKSWAGEN'then '89'
			when Make= 'VOLVO'then '90'
			when Make= 'WESTFIELD'then '91'
			when Make= 'ZENOS'then '92'
			else Make
		end,
		GenmodelID,
		[2020],
		[2019],
		[2018],
		[2017],
		[2016],
		[2015],
		[2014],
		[2013],
		[2012],
		[2011],
		[2010],
		[2009],
		[2008],
		[2007],
		[2006],
		[2005],
		[2004],
		[2003],
		[2002],
		[2001]

FROM [Car].DBO.SalesODS
-- https://www.codeproject.com/Articles/652108/Create-First-Data-WareHouse
-- https://docs.microsoft.com/en-us/sql/t-sql/statements/insert-transact-sql?view=sql-server-ver15


