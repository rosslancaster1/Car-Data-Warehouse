
USE CarDW
GO
--################################################
--	Drop factAd, factPrice, and factSales
--################################################
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factAd]') AND type in (N'U'))
DROP TABLE [dbo].[factAd]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factPrice]') AND type in (N'U'))
DROP TABLE [dbo].[factPrice]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[factSales]') AND type in (N'U'))
DROP TABLE [dbo].[factSales]
GO


--################################################
--	Create Make Dimension
--################################################
--
--	If the dimMake table exists, drop it
--
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimMake]') AND type in (N'U'))
DROP TABLE [dbo].[dimMake]
GO

--
--	Create the dimMake table
--

CREATE TABLE [dbo].[dimMake](
	[MakeID] [char](2) NOT NULL ,
		CONSTRAINT PK_dimMake_MakeID PRIMARY KEY CLUSTERED (MakeID),
	[Make] [char] (100) NOT NULL
	)
--
--	Insert values into the dimGenerations table
--
INSERT INTO dimMake
VALUES 
('01','ABARTH'),
('02','ACURA'),
('03','AIXAM'),
('04','ALFA ROMEO'),
('05','ASTON MARTIN'),
('06','AUDI'),
('07','BENTLEY'),
('08','BMW'),
('09','BROOKE'),
('10','BUGATTI'),
('11','CADILLAC'),
('12','CATERHAM'),
('13','CHEVROLET'),
('14','CHRYSLER'),
('15','CITROEN'),
('16','CORVETTE'),
('17','DACIA'),
('18','DAEWOO'),
('19','DAIHATSU'),
('20','DAIMLER'),
('21','DAX'),
('22','DODGE'),
('23','DS'),
('24','FERRARI'),
('25','FIAT'),
('26','FORD'),
('27','GINETTA'),
('28','GMC'),
('29','GREAT WALL'),
('30','GRINNALL'),
('31','HONDA'),
('32','HUMMER'),
('33','HYUNDAI'),
('34','INFINITI'),
('35','ISUZU'),
('36','JAGUAR'),
('37','JEEP'),
('38','JENSEN'),
('39','KIA'),
('40','KOENIGSEGG'),
('41','KTM'),
('42','LAMBORGHINI'),
('43','LAND ROVER'),
('44','LEXUS'),
('45','LINCOLN'),
('46','LONDON TAXIS INTERNATIONAL'),
('47','LOTUS'),
('48','MASERATI'),
('49','MAYBACH'),
('50','MAZDA'),
('51','MCLAREN'),
('52','MERCEDES-BENZ'),
('53','MEV'),
('54','MG'),
('55','MICROCAR'),
('56','MINI'),
('57','MITSUBISHI'),
('58','MORGAN'),
('59','NISSAN'),
('60','NOBLE'),
('61','OPEL'),
('62','PAGANI'),
('63','PERODUA'),
('64','PEUGEOT'),
('65','PILGRIM'),
('66','PORSCHE'),
('67','PROTON'),
('68','RADICAL'),
('69','RAW'),
('70','RENAULT'),
('71','REVA'),
('72','ROLLS-ROYCE'),
('73','ROVER'),
('74','SAAB'),
('75','SANTANA'),
('76','SEAT'),
('77','SEBRING'),
('78','SKODA'),
('79','SMART'),
('80','SSANGYONG'),
('81','SUBARU'),
('82','SUZUKI'),
('83','TATA'),
('84','TESLA'),
('85','TIGER'),
('86','TOYOTA'),
('87','TVR'),
('88','VAUXHALL'),
('89','VOLKSWAGEN'),
('90','VOLVO'),
('91','WESTFIELD'),
('92','ZENOS')

GO

--################################################
--	Create AdYear Dimension
--################################################
------------------------------------------------
--	Drop AdMonth Dimension
--	
--	You have to drop the "many" table before you drop
--	the "one" table
------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimAdMonth]') AND type in (N'U'))
DROP TABLE [dbo].[dimAdMonth]
GO
------------------------------------------------
--	Drop AdYear Dimension
------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimAdYear]') AND type in (N'U'))
DROP TABLE [dbo].[dimAdYear]
GO
------------------------------------------------
--	Create the dimAdYear table
------------------------------------------------
CREATE TABLE [dbo].[dimAdYear](
	[AdYearID] [char] (1) NOT NULL,
		CONSTRAINT PK_dimAdYear_AdYearID PRIMARY KEY CLUSTERED (AdYearID),
	[AdYear] [char] (4) NOT NULL,
	)
GO

INSERT INTO dimAdYear
VALUES 
('1','2013'),
('2','2014'),
('3','2015'),
('4','2016'),
('5','2017'),
('6','2018'),
('7','2019'),
('8','2020'),
('9','2021')

GO

--################################################
--	Create AdMonth Dimension
--################################################
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimAdMonth]') AND type in (N'U'))
DROP TABLE [dbo].[dimAdMonth]
GO
------------------------------------------------
--	Create the dimAdMonth table
------------------------------------------------
CREATE TABLE [dbo].[dimAdMonth](
	[AdMonthID] [char](7) NOT NULL,
		CONSTRAINT PK_dimAdMonth_AdMonthID PRIMARY KEY CLUSTERED (AdMonthID),
	[Date] [varchar] (10) NOT NULL,
	[AdMonth] [int] NOT NULL,
	[AdYearID] [char] (1) NOT NULL,
		CONSTRAINT FK_dimAdYear_dimAdMonth FOREIGN KEY (AdYearID)
		REFERENCES dimAdYear(AdYearID)
)
GO

INSERT INTO dimAdMonth
VALUES 
('11/2013','Nov2013','11','1'),
('8/2013','Aug2013','8','1'),
('10/2013','Oct2013','10','1'),
('9/2013','Sep2013','9','1'),
('3/2014','Mar2014','3','2'),
('8/2014','Aug2014','8','2'),
('11/2014','Nov2014','11','2'),
('9/2014','Sep2014','9','2'),
('10/2014','Oct2014','10','2'),
('12/2014','Dec2014','12','2'),
('6/2014','Jun2014','6','2'),
('1/2014','Jan2014','1','2'),
('2/2014','Feb2014','2','2'),
('6/2015','Jun2015','6','3'),
('3/2015','Mar2015','3','3'),
('10/2015','Oct2015','10','3'),
('8/2015','Aug2015','8','3'),
('11/2015','Nov2015','11','3'),
('5/2015','May2015','5','3'),
('9/2015','Sep2015','9','3'),
('12/2015','Dec2015','12','3'),
('2/2015','Feb2015','2','3'),
('4/2015','Apr2015','4','3'),
('7/2015','Jul2015','7','3'),
('1/2015','Jan2015','1','3'),
('12/2016','Dec2016','12','4'),
('11/2016','Nov2016','11','4'),
('6/2016','Jun2016','6','4'),
('8/2016','Aug2016','8','4'),
('3/2016','Mar2016','3','4'),
('9/2016','Sep2016','9','4'),
('10/2016','Oct2016','10','4'),
('2/2016','Feb2016','2','4'),
('7/2016','Jul2016','7','4'),
('5/2016','May2016','5','4'),
('1/2016','Jan2016','1','4'),
('4/2016','Apr2016','4','4'),
('11/2017','Nov2017','11','5'),
('12/2017','Dec2017','12','5'),
('3/2017','Mar2017','3','5'),
('7/2017','Jul2017','7','5'),
('5/2017','May2017','5','5'),
('10/2017','Oct2017','10','5'),
('9/2017','Sep2017','9','5'),
('8/2017','Aug2017','8','5'),
('2/2017','Feb2017','2','5'),
('4/2017','Apr2017','4','5'),
('6/2017','Jun2017','6','5'),
('1/2017','Jan2017','1','5'),
('4/2018','Apr2018','4','6'),
('6/2018','Jun2018','6','6'),
('8/2018','Aug2018','8','6'),
('2/2018','Feb2018','2','6'),
('3/2018','Mar2018','3','6'),
('7/2018','Jul2018','7','6'),
('5/2018','May2018','5','6'),
('1/2018','Jan2018','1','6'),
('9/2018','Sep2018','9','6'),
('10/2018','Oct2018','10','6'),
('4/2019','Apr2019','4','7'),
('8/2019','Aug2019','8','7'),
('12/2019','Dec2019','12','7'),
('10/2019','Oct2019','10','7'),
('11/2019','Nov2019','11','7'),
('7/2019','Jul2019','7','7'),
('5/2019','May2019','5','7'),
('9/2019','Sep2019','9','7'),
('6/2019','Jun2019','6','7'),
('2/2019','Feb2019','2','7'),
('12/2020','Dec2020','12','8'),
('9/2020','Sep2020','9','8'),
('2/2020','Feb2020','2','8'),
('10/2020','Oct2020','10','8'),
('11/2020','Nov2020','11','8'),
('1/2020','Jan2020','1','8'),
('3/2020','Mar2020','3','8'),
('7/2020','Jul2020','7','8'),
('8/2020','Aug2020','8','8'),
('6/2020','Jun2020','6','8'),
('5/2020','May2020','5','8'),
('4/2020','Apr2020','4','8'),
('4/2021','Apr2021','4','9'),
('1/2021','Jan2021','1','9'),
('3/2021','Mar2021','3','9'),
('5/2021','May2021','5','9'),
('6/2021','Jun2021','6','9'),
('2/2021','Feb2021','2','9')

GO

--################################################
--	Create Color Dimension
--################################################

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimColor]') AND type in (N'U'))
DROP TABLE [dbo].[dimColor]
GO
------------------------------------------------
--	Create the dimColor table
------------------------------------------------
CREATE TABLE [dbo].[dimColor](
	[ColorID] [char](2) NOT NULL,
		CONSTRAINT PK_dimColor_ColorID PRIMARY KEY CLUSTERED (ColorID),
	[Color] [char] (20) NOT NULL,
	)

INSERT INTO dimColor
VALUES 
('01','Silver'),
('02','Grey'),
('03','Blue'),
('04','Green'),
('05','Black'),
('06','White'),
('07','Red'),
('08','Brown'),
('09','Orange'),
('10','Maroon'),
('11','Purple'),
('12','Yellow'),
('13','Multicolour'),
('14','Gold'),
('15','Pink'),
('16','Bronze'),
('17','Beige'),
('18','Burgundy'),
('19','Magenta'),
('20','Turquoise'),
('21','Indigo'),
('22','Navy')

GO
--################################################
--	Create Bodytype Dimension
--################################################
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimBodytype]') AND type in (N'U'))
DROP TABLE [dbo].[dimBodytype]
GO
------------------------------------------------
--	Create the dimBodytype table
------------------------------------------------
CREATE TABLE [dbo].[dimBodytype](
	[BodytypeID] [char](3) NOT NULL,
		CONSTRAINT PK_dimBodytype_BodytypeID PRIMARY KEY CLUSTERED (BodytypeID),
	[Bodytype] [char] (50) NOT NULL,
	)

INSERT INTO dimBodytype
VALUES 
('01','Saloon'),
('02','Convertible'),
('03','SUV'),
('04','Estate'),
('05','Coupe'),
('06','Hatchback'),
('07','MPV'),
('08','Combi Van'),
('09','Panel Van'),
('10','Minibus'),
('11','Window Van'),
('12','Pickup'),
('13','Manual'),
('14','Car Derived Van'),
('15','Tipper'),
('16','Camper'),
('17','Chassis Cab'),
('18','Limousine')

GO

--################################################
--	Create Transmission Dimension
--################################################
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimTransmission]') AND type in (N'U'))
DROP TABLE [dbo].[dimTransmission]
GO
------------------------------------------------
--	Create the dimTransmission table
------------------------------------------------
CREATE TABLE [dbo].[dimTransmission](
	[TransmissionID] [char](1) NOT NULL,
		CONSTRAINT PK_dimTransmission_TransmissionID PRIMARY KEY CLUSTERED (TransmissionID),
	[Transmission] [char] (50) NOT NULL,
	)

INSERT INTO dimTransmission
VALUES 
('1','Automatic'),
('2','Semi-Automatic'),
('3','Manual')
GO

--################################################
--	Create FuelCategory Dimension
--################################################
------------------------------------------------
--	Drop FuelSubcategory Dimension
--	
--	You have to drop the "many" table before you drop
--	the "one" table
------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimFuelSubcategory]') AND type in (N'U'))
DROP TABLE [dbo].[dimFuelSubcategory]
GO
------------------------------------------------
--	Drop FuelCategory Dimension
------------------------------------------------
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimFuelCategory]') AND type in (N'U'))
DROP TABLE [dbo].[dimFuelCategory]
GO
------------------------------------------------
--	Create the dimFuelCategory table
------------------------------------------------
CREATE TABLE [dbo].[dimFuelCategory](
	[FuelCategoryID] [char] (1) NOT NULL,
		CONSTRAINT PK_dimFuelCategory_FuelCategoryID PRIMARY KEY CLUSTERED (FuelCategoryID),
	[FuelCategory] [char] (20) NOT NULL,
	)
GO

INSERT INTO dimFuelCategory
VALUES 
('1','Fossil Fuel'),
('2','Hybrid'),
('3','Electric ')
GO

--################################################
--	Create FuelSubcategory Dimension
--################################################
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimFuelSubcategory]') AND type in (N'U'))
DROP TABLE [dbo].[dimFuelSubcategory]
GO
------------------------------------------------
--	Create the dimFuelSubcategory table
------------------------------------------------
CREATE TABLE [dbo].[dimFuelSubcategory](
	[FuelSubcategoryID] [char](7) NOT NULL,
		CONSTRAINT PK_dimFuelSubcategory_FuelSubcategoryID PRIMARY KEY CLUSTERED (FuelSubcategoryID),
	[FuelSubcategory] [varchar] (35) NOT NULL,
	[FuelCategoryID] [char] (1) NOT NULL,
		CONSTRAINT FK_dimFuelCategory_dimFuelSubcategory FOREIGN KEY (FuelCategoryID)
		REFERENCES dimFuelCategory(FuelCategoryID)
)
GO

INSERT INTO dimFuelSubcategory
VALUES 
('01','Petrol','1'),
('02','Diesel','1'),
('03','Petrol Plug-in Hybrid','2'),
('04','Petrol Ethanol','1'),
('05','Hybrid  Petrol/Electric Plug-in','2'),
('06','Electric','3'),
('07','Hybrid  Diesel/Electric','2'),
('08','Bi Fuel','1'),
('09','Hybrid  Petrol/Electric','2'),
('10','Petrol Hybrid','2'),
('11','Diesel Hybrid','2'),
('12','Diesel Plug-in Hybrid','2'),
('13','Hybrid  Diesel/Electric Plug-in','2')

GO