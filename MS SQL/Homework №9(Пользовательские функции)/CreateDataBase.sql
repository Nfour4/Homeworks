USE [master]
GO
/****** Object:  Database [SportsShop]    Script Date: 09.11.2024 21:33:09 ******/
CREATE DATABASE [SportsShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportsShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SportsShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SportsShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SportsShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SportsShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportsShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportsShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportsShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportsShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportsShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportsShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportsShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SportsShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportsShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportsShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportsShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportsShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportsShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportsShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportsShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportsShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SportsShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportsShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportsShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportsShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportsShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportsShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportsShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportsShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SportsShop] SET  MULTI_USER 
GO
ALTER DATABASE [SportsShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportsShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportsShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportsShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SportsShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SportsShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SportsShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [SportsShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SportsShop]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAvgPrice]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetAvgPrice]
(
	@Category NVARCHAR(50)
)
RETURNS DECIMAL(7,2)
AS
BEGIN
	DECLARE @Avg DECIMAL(7,2)
	SELECT @Avg = AVG(P.SellPrice)
	FROM Products P JOIN Categories C ON C.CategoryID = P.CategoryID
	WHERE C.CategoryName = @Category
	GROUP BY P.SellPrice
	RETURN @Avg;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetAvgPriceDate]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetAvgPriceDate](
	@SaleDate DATE
)
RETURNS DECIMAL(7,2)
AS
BEGIN
	DECLARE @Avg DECIMAL(7,2)
	SELECT @Avg = AVG(P.SellPrice)
	FROM Products P JOIN SalersProducts SP ON SP.ProductID = P.ProductID
	JOIN Sales S ON S.SaleID = SP.SaleID
	WHERE S.SaleDate = @SaleDate 
	GROUP BY P.SellPrice
	RETURN @Avg;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetMaxDate]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetMaxDate]()
RETURNS DATE
AS
BEGIN
	DECLARE @SaleDate DATE
	SELECT TOP 1 @SaleDate = S.SaleDate
	FROM Products P JOIN SalersProducts SP ON SP.ProductID = P.ProductID
	JOIN Sales S ON S.SaleID = SP.SaleID
	ORDER BY S.SaleDate DESC
	RETURN @SaleDate;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetMinDate]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetMinDate]()
RETURNS DATE
AS
BEGIN
	DECLARE @SaleDate DATE
	SELECT TOP 1 @SaleDate = S.SaleDate
	FROM Products P JOIN SalersProducts SP ON SP.ProductID = P.ProductID
	JOIN Sales S ON S.SaleID = SP.SaleID
	ORDER BY S.SaleDate ASC
	RETURN @SaleDate;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GetSaleDate]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetSaleDate]
(
	@SaleDate DATE
)
RETURNS INT
AS
BEGIN
	DECLARE @Date INT;

	SET @Date = DATEDIFF(YEAR, @SaleDate, GETDATE())

	RETURN @Date;
END;

GO
/****** Object:  UserDefinedFunction [dbo].[GetUniqueCount]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetUniqueCount]()
RETURNS INT
AS
BEGIN
	DECLARE @Count INT
	SELECT @Count = COUNT(*)
	FROM (
		SELECT ClientID FROM Clients
		GROUP BY ClientID HAVING COUNT(ClientID) = 1
	) AS C
	RETURN @Count;
END;
	
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Makers]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makers](
	[MakerID] [int] IDENTITY(1,1) NOT NULL,
	[MakerName] [nvarchar](50) NULL,
	[MakerCountry] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MakerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[CategoryID] [int] NULL,
	[AvailableQuantity] [int] NULL,
	[NetPrice] [decimal](7, 2) NULL,
	[SellPrice] [decimal](7, 2) NULL,
	[MakerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetProductInfo]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetProductInfo](
	@CategoryName NVARCHAR(50),
	@MakerName NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN(
	SELECT P.ProductName, P.AvailableQuantity, P.SellPrice, P.NetPrice, M.MakerName, C.CategoryName
	FROM Products P JOIN Categories C ON C.CategoryID = P.CategoryID
	JOIN Makers M ON M.MakerID = P.MakerID
	WHERE C.CategoryName = @CategoryName AND M.MakerName = @MakerName
	GROUP BY P.ProductName,  P.AvailableQuantity, P.SellPrice, P.NetPrice, M.MakerName, C.CategoryName
);
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Discount] [decimal](2, 2) NULL,
	[IsSubscribed] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[EmployeeID] [int] NULL,
	[SaleDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMoreThanTwo]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetMoreThanTwo]()
RETURNS TABLE
AS
RETURN(
	SELECT C.FirstName + ' ' + C.MiddleName + ' ' + C.LastName AS FullName, dbo.GetSaleDate(SaleDate) AS SaleDate
	FROM Sales S JOIN Clients C ON C.ClientID = S.SaleID
	WHERE dbo.GetSaleDate(SaleDate) > 2
);
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[PositionID] [int] NULL,
	[HireDate] [date] NULL,
	[Gender] [char](1) NULL,
	[Salary] [decimal](7, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalersProducts]    Script Date: 09.11.2024 21:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalersProducts](
	[SaleID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Clothes')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Shoes')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Balls')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'Bags')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'Snowboarding')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (6, N'Accessories')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (1, N'Blanch', N'Una', N'Billows', N'ubillows0@icio.us', N'+48 (142) 509-1290', CAST(0.87 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (2, N'Micheil', N'Yule', N'Castri', N'ycastri1@squarespace.com', N'+52 (389) 580-7961', CAST(0.21 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (3, N'Mathian', N'Maynard', N'Sainteau', N'msainteau2@homestead.com', N'+233 (402) 120-0153', CAST(0.49 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (4, N'Hugues', N'Gilly', N'Barbier', N'gbarbier3@ft.com', N'+62 (157) 763-5806', CAST(0.56 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (5, N'Dyann', N'Katuscha', N'Pankhurst.', N'kpankhurst4@opensource.org', N'+63 (677) 415-3699', CAST(0.76 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (6, N'Leroy', N'Cecilio', N'Dami', N'cdami5@fc2.com', N'+62 (694) 248-9627', CAST(0.30 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (7, N'Nissa', N'Nananne', N'Gradon', N'ngradon6@hexun.com', N'+593 (143) 816-2668', CAST(0.09 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (8, N'Con', N'Lila', N'Dransfield', N'ldransfield7@dyndns.org', N'+62 (401) 245-5954', CAST(0.63 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (9, N'Daffie', N'Ardene', N'Tournie', N'atournie8@xinhuanet.com', N'+86 (488) 384-6391', CAST(0.01 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (10, N'Dalis', N'Shaina', N'Cullerne', N'scullerne9@behance.net', N'+7 (694) 929-7568', CAST(0.31 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (11, N'Cob', N'Dacey', N'Binge', N'dbingea@bravesites.com', N'+62 (316) 451-4641', CAST(0.73 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (12, N'Deeyn', N'Miller', N'Colquit', N'mcolquitb@java.com', N'+33 (357) 209-3358', CAST(0.69 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (13, N'Simmonds', N'Guinevere', N'Leeman', N'gleemanc@bing.com', N'+380 (558) 514-3457', CAST(0.02 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (14, N'Kalila', N'Sibylla', N'Volette', N'svoletted@wisc.edu', N'+56 (946) 880-2309', CAST(0.69 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (15, N'Kaela', N'Josie', N'Linnitt', N'jlinnitte@com.com', N'+355 (275) 371-8796', CAST(0.98 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (16, N'Denyse', N'Fredi', N'Gronow', N'fgronowf@parallels.com', N'+7 (917) 922-0205', CAST(0.97 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (17, N'Dietrich', N'Ange', N'Karpenko', N'akarpenkog@rakuten.co.jp', N'+51 (494) 855-4726', CAST(0.48 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (18, N'Aylmer', N'Lia', N'Ruusa', N'lruusah@nba.com', N'+63 (572) 783-9658', CAST(0.69 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (19, N'Renelle', N'Wendi', N'Robertet', N'wroberteti@domainmarket.com', N'+27 (913) 403-1671', CAST(0.22 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (20, N'Sheryl', N'Kiele', N'Hilland', N'khillandj@google.com.br', N'+420 (993) 393-6864', CAST(0.16 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (21, N'Leodora', N'Clyde', N'Draper', N'cdraperk@blogs.com', N'+46 (666) 914-9461', CAST(0.24 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (22, N'Quentin', N'Abie', N'Chapman', N'achapmanl@umich.edu', N'+86 (521) 673-4962', CAST(0.58 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (23, N'Gabrielle', N'Michaelina', N'Hovert', N'mhovertm@miitbeian.gov.cn', N'+351 (566) 932-4076', CAST(0.20 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (24, N'Amby', N'Aime', N'McCullen', N'amccullenn@webs.com', N'+234 (654) 888-1230', CAST(0.38 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (25, N'Lindy', N'Sisile', N'Tonnesen', N'stonneseno@nasa.gov', N'+86 (663) 964-0824', CAST(0.38 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (26, N'Karil', N'Bartholomeo', N'Farfalameev', N'bfarfalameevp@simplemachines.org', N'+33 (292) 345-5582', CAST(0.95 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (27, N'Louise', N'Gwendolin', N'Goodey', N'ggoodeyq@hibu.com', N'+62 (330) 312-3490', CAST(0.87 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (28, N'Charla', N'Gaile', N'Clinch', N'gclinchr@smugmug.com', N'+66 (215) 475-8405', CAST(0.24 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (29, N'Lacy', N'Emmery', N'Reeken', N'ereekens@pbs.org', N'+1 (561) 603-5283', CAST(0.56 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (30, N'Reeba', N'Otto', N'Driutti', N'odriuttit@netscape.com', N'+256 (435) 697-9812', CAST(0.76 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (31, N'Norina', N'Koralle', N'Ferris', N'kferrisu@blog.com', N'+47 (186) 519-7769', CAST(0.90 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (32, N'Zondra', N'Kiah', N'Poetz', N'kpoetzv@virginia.edu', N'+54 (650) 560-7956', CAST(0.10 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (33, N'Brooke', N'Moore', N'Kurdani', N'mkurdaniw@patch.com', N'+51 (293) 188-3373', CAST(0.14 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (34, N'Raimondo', N'Heather', N'Dewsbury', N'hdewsburyx@amazonaws.com', N'+86 (655) 806-8530', CAST(0.64 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (35, N'Caril', N'Randa', N'Besse', N'rbessey@weather.com', N'+505 (327) 929-9901', CAST(0.66 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (36, N'Joceline', N'Eryn', N'Piwall', N'epiwallz@devhub.com', N'+86 (520) 504-1450', CAST(0.61 AS Decimal(2, 2)), 0)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (37, N'Cristie', N'Grantley', N'Crosoer', N'gcrosoer10@nature.com', N'+55 (859) 205-6984', CAST(0.13 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (38, N'Alethea', N'Hannie', N'Beedell', N'hbeedell11@wix.com', N'+48 (483) 548-9951', CAST(0.99 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (39, N'Jordana', N'Jerrie', N'Prendergrast', N'jprendergrast12@auda.org.au', N'+93 (356) 889-9139', CAST(0.37 AS Decimal(2, 2)), 1)
INSERT [dbo].[Clients] ([ClientID], [FirstName], [MiddleName], [LastName], [Email], [Phone], [Discount], [IsSubscribed]) VALUES (40, N'Roslyn', N'Clarisse', N'Conisbee', N'cconisbee13@slashdot.org', N'+62 (803) 984-7190', CAST(0.93 AS Decimal(2, 2)), 0)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [MiddleName], [LastName], [PositionID], [HireDate], [Gender], [Salary]) VALUES (1, N'Ranique', N'Joyous', N'Fishley', 3, CAST(N'2021-04-02' AS Date), N'F', CAST(91283.18 AS Decimal(7, 2)))
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [MiddleName], [LastName], [PositionID], [HireDate], [Gender], [Salary]) VALUES (2, N'Jere', N'Gal', N'Sandilands', 2, CAST(N'2020-10-20' AS Date), N'M', CAST(51190.12 AS Decimal(7, 2)))
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [MiddleName], [LastName], [PositionID], [HireDate], [Gender], [Salary]) VALUES (3, N'Thorin', N'Kaiser', N'Lanfere', 1, CAST(N'2022-06-10' AS Date), N'M', CAST(52425.71 AS Decimal(7, 2)))
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [MiddleName], [LastName], [PositionID], [HireDate], [Gender], [Salary]) VALUES (4, N'Marilyn', N'Christalle', N'Walburn', 1, CAST(N'2020-12-02' AS Date), N'F', CAST(44567.16 AS Decimal(7, 2)))
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [MiddleName], [LastName], [PositionID], [HireDate], [Gender], [Salary]) VALUES (5, N'Thaddus', N'Nobie', N'Janda', 1, CAST(N'2023-05-30' AS Date), N'M', CAST(60276.08 AS Decimal(7, 2)))
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [MiddleName], [LastName], [PositionID], [HireDate], [Gender], [Salary]) VALUES (6, N'Shae', N'Dannie', N'Stickells', 2, CAST(N'2020-12-07' AS Date), N'F', CAST(24906.14 AS Decimal(7, 2)))
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [MiddleName], [LastName], [PositionID], [HireDate], [Gender], [Salary]) VALUES (7, N'Dniren', N'Kitty', N'Hastler', 4, CAST(N'2023-07-03' AS Date), N'F', CAST(49233.52 AS Decimal(7, 2)))
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [MiddleName], [LastName], [PositionID], [HireDate], [Gender], [Salary]) VALUES (8, N'Hyman', N'Damian', N'Pilipyak', 3, CAST(N'2022-08-02' AS Date), N'M', CAST(91567.27 AS Decimal(7, 2)))
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [MiddleName], [LastName], [PositionID], [HireDate], [Gender], [Salary]) VALUES (9, N'Hulda', N'Tessa', N'Chinn', 4, CAST(N'2023-01-22' AS Date), N'F', CAST(48970.49 AS Decimal(7, 2)))
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [MiddleName], [LastName], [PositionID], [HireDate], [Gender], [Salary]) VALUES (10, N'Cate', N'Bobbye', N'Luckey', 2, CAST(N'2023-04-20' AS Date), N'F', CAST(36704.72 AS Decimal(7, 2)))
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [MiddleName], [LastName], [PositionID], [HireDate], [Gender], [Salary]) VALUES (11, N'Daniella', N'Jayme', N'Goodisson', 4, CAST(N'2023-11-09' AS Date), N'F', CAST(58490.68 AS Decimal(7, 2)))
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [MiddleName], [LastName], [PositionID], [HireDate], [Gender], [Salary]) VALUES (12, N'Chas', N'Claybourne', N'Becom', 1, CAST(N'2022-12-24' AS Date), N'M', CAST(86859.86 AS Decimal(7, 2)))
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Makers] ON 

INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (1, N'Hessel-Schumm', N'Belarus')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (2, N'Johnston Inc', N'Belgium')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (3, N'Roberts Group', N'Belarus')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (4, N'King LLC', N'Belgium')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (5, N'VonRueden LLC', N'Belarus')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (6, N'Bernhard LLC', N'Belgium')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (7, N'Hessel-Herzog', N'Belarus')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (8, N'Wyman, Ondricka and Huel', N'Belarus')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (9, N'Schaefer Inc', N'Belarus')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (10, N'Wyman, Parker and Jaskolski', N'Belgium')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (11, N'Koelpin, Ortiz and Dooley', N'Belarus')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (12, N'Luettgen-Zulauf', N'Belgium')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (13, N'Hickle, Cartwright and Reichel', N'Belarus')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (14, N'Rath, DuBuque and VonRueden', N'Belarus')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (15, N'Bernhard, Brakus and Harris', N'Austria')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (16, N'Gulgowski Group', N'Austria')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (17, N'Swaniawski Group', N'Austria')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (18, N'Beahan-Langosh', N'Belarus')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (19, N'Volkman and Sons', N'Belarus')
INSERT [dbo].[Makers] ([MakerID], [MakerName], [MakerCountry]) VALUES (20, N'Johnson-Simonis', N'Austria')
SET IDENTITY_INSERT [dbo].[Makers] OFF
GO
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([PositionID], [PositionName]) VALUES (1, N'Manager')
INSERT [dbo].[Positions] ([PositionID], [PositionName]) VALUES (2, N'Cashier')
INSERT [dbo].[Positions] ([PositionID], [PositionName]) VALUES (3, N'Assistant')
INSERT [dbo].[Positions] ([PositionID], [PositionName]) VALUES (4, N'Worker')
SET IDENTITY_INSERT [dbo].[Positions] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (1, N'Rubber', 2, 1236, CAST(53318.23 AS Decimal(7, 2)), CAST(53319.23 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (2, N'Vinyl', 4, 3688, CAST(59455.16 AS Decimal(7, 2)), CAST(81478.23 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (3, N'Steel', 4, 3264, CAST(90275.60 AS Decimal(7, 2)), CAST(90276.60 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (4, N'Plexiglass', 1, 1673, CAST(47413.20 AS Decimal(7, 2)), CAST(62953.99 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (5, N'Rubber', 6, 2829, CAST(4441.90 AS Decimal(7, 2)), CAST(82664.69 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (6, N'Glass', 6, 4856, CAST(14975.49 AS Decimal(7, 2)), CAST(77213.52 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (7, N'Granite', 6, 4110, CAST(61580.32 AS Decimal(7, 2)), CAST(61581.32 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (8, N'Plexiglass', 6, 3838, CAST(5489.37 AS Decimal(7, 2)), CAST(22086.58 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (9, N'Wood', 2, 3716, CAST(16270.13 AS Decimal(7, 2)), CAST(16271.13 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (10, N'Brass', 2, 417, CAST(71447.66 AS Decimal(7, 2)), CAST(71448.66 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (11, N'Plastic', 6, 960, CAST(52151.20 AS Decimal(7, 2)), CAST(52152.20 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (12, N'Rubber', 2, 999, CAST(86993.59 AS Decimal(7, 2)), CAST(94799.43 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (13, N'Wood', 2, 1200, CAST(9260.53 AS Decimal(7, 2)), CAST(64014.11 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (14, N'Plexiglass', 3, 4746, CAST(68317.95 AS Decimal(7, 2)), CAST(68318.95 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (15, N'Rubber', 2, 1193, CAST(41356.72 AS Decimal(7, 2)), CAST(96298.51 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (16, N'Stone', 4, 3543, CAST(93233.74 AS Decimal(7, 2)), CAST(93234.74 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (17, N'Steel', 2, 1540, CAST(57883.80 AS Decimal(7, 2)), CAST(57884.80 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (18, N'Wood', 4, 1012, CAST(60403.38 AS Decimal(7, 2)), CAST(60404.38 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (19, N'Plexiglass', 2, 516, CAST(78337.37 AS Decimal(7, 2)), CAST(78338.37 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (20, N'Wood', 6, 247, CAST(50108.10 AS Decimal(7, 2)), CAST(50109.10 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (21, N'Plexiglass', 2, 4795, CAST(41201.87 AS Decimal(7, 2)), CAST(72304.47 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (22, N'Steel', 4, 1601, CAST(88324.60 AS Decimal(7, 2)), CAST(88325.60 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (23, N'Wood', 2, 1780, CAST(51517.61 AS Decimal(7, 2)), CAST(51518.61 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (24, N'Granite', 2, 2352, CAST(84300.05 AS Decimal(7, 2)), CAST(84301.05 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (25, N'Wood', 5, 423, CAST(84588.06 AS Decimal(7, 2)), CAST(84589.06 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (26, N'Brass', 3, 2373, CAST(47071.53 AS Decimal(7, 2)), CAST(52571.92 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (27, N'Brass', 3, 2117, CAST(69210.33 AS Decimal(7, 2)), CAST(69211.33 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (28, N'Granite', 1, 2167, CAST(39561.93 AS Decimal(7, 2)), CAST(88957.81 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (29, N'Glass', 3, 2457, CAST(46402.52 AS Decimal(7, 2)), CAST(77000.63 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (30, N'Steel', 4, 2805, CAST(8764.00 AS Decimal(7, 2)), CAST(62190.66 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (31, N'Wood', 4, 4579, CAST(8551.99 AS Decimal(7, 2)), CAST(8552.99 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (32, N'Steel', 2, 895, CAST(32057.86 AS Decimal(7, 2)), CAST(88295.98 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (33, N'Granite', 4, 3480, CAST(47585.90 AS Decimal(7, 2)), CAST(53928.00 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (34, N'Stone', 6, 4400, CAST(34245.96 AS Decimal(7, 2)), CAST(34246.96 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (35, N'Aluminum', 2, 3084, CAST(60973.98 AS Decimal(7, 2)), CAST(98911.49 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (36, N'Plexiglass', 5, 897, CAST(9034.26 AS Decimal(7, 2)), CAST(61294.46 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (37, N'Vinyl', 2, 4895, CAST(52044.94 AS Decimal(7, 2)), CAST(52045.94 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (38, N'Granite', 2, 4081, CAST(15848.67 AS Decimal(7, 2)), CAST(15849.67 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (39, N'Vinyl', 6, 88, CAST(22353.00 AS Decimal(7, 2)), CAST(22354.00 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (40, N'Stone', 2, 1997, CAST(84056.75 AS Decimal(7, 2)), CAST(84057.75 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (41, N'Vinyl', 5, 1604, CAST(83882.85 AS Decimal(7, 2)), CAST(91191.82 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (42, N'Vinyl', 2, 2065, CAST(51186.66 AS Decimal(7, 2)), CAST(51187.66 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (43, N'Plexiglass', 5, 2185, CAST(24856.37 AS Decimal(7, 2)), CAST(67423.52 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (44, N'Granite', 1, 4230, CAST(30553.13 AS Decimal(7, 2)), CAST(30554.13 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (45, N'Wood', 1, 1751, CAST(64280.07 AS Decimal(7, 2)), CAST(64281.07 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (46, N'Brass', 5, 4807, CAST(54128.57 AS Decimal(7, 2)), CAST(62982.95 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (47, N'Vinyl', 4, 2182, CAST(17986.72 AS Decimal(7, 2)), CAST(43383.91 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (48, N'Wood', 2, 1188, CAST(46826.94 AS Decimal(7, 2)), CAST(46827.94 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (49, N'Stone', 5, 3, CAST(42194.21 AS Decimal(7, 2)), CAST(65553.58 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (50, N'Granite', 1, 3985, CAST(37389.76 AS Decimal(7, 2)), CAST(37390.76 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (51, N'Vinyl', 1, 3820, CAST(31388.39 AS Decimal(7, 2)), CAST(37162.62 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (52, N'Glass', 6, 3398, CAST(79551.82 AS Decimal(7, 2)), CAST(79552.82 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (53, N'Brass', 1, 3872, CAST(46560.81 AS Decimal(7, 2)), CAST(67228.22 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (54, N'Steel', 5, 2255, CAST(81283.33 AS Decimal(7, 2)), CAST(92991.42 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (55, N'Vinyl', 1, 4736, CAST(62323.03 AS Decimal(7, 2)), CAST(62324.03 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (56, N'Wood', 1, 1971, CAST(52326.34 AS Decimal(7, 2)), CAST(70234.50 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (57, N'Plexiglass', 2, 1668, CAST(29677.00 AS Decimal(7, 2)), CAST(74051.51 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (58, N'Glass', 4, 806, CAST(77765.07 AS Decimal(7, 2)), CAST(77766.07 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (59, N'Rubber', 6, 905, CAST(77072.68 AS Decimal(7, 2)), CAST(77073.68 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (60, N'Granite', 1, 3879, CAST(56314.38 AS Decimal(7, 2)), CAST(67305.43 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (61, N'Granite', 3, 3678, CAST(85352.34 AS Decimal(7, 2)), CAST(85353.34 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (62, N'Rubber', 2, 4987, CAST(87284.17 AS Decimal(7, 2)), CAST(87285.17 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (63, N'Aluminum', 1, 1154, CAST(74313.73 AS Decimal(7, 2)), CAST(92365.36 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (64, N'Steel', 1, 3495, CAST(31000.55 AS Decimal(7, 2)), CAST(94143.86 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (65, N'Steel', 1, 1584, CAST(25684.18 AS Decimal(7, 2)), CAST(29552.08 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (66, N'Granite', 2, 4334, CAST(61732.16 AS Decimal(7, 2)), CAST(61733.16 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (67, N'Steel', 3, 250, CAST(42382.96 AS Decimal(7, 2)), CAST(87155.06 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (68, N'Steel', 6, 95, CAST(79632.38 AS Decimal(7, 2)), CAST(87517.82 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (69, N'Plexiglass', 6, 2835, CAST(38432.75 AS Decimal(7, 2)), CAST(68998.87 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (70, N'Vinyl', 2, 3666, CAST(50352.78 AS Decimal(7, 2)), CAST(86848.24 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (71, N'Aluminum', 5, 4431, CAST(5749.61 AS Decimal(7, 2)), CAST(50926.03 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (72, N'Aluminum', 2, 781, CAST(42820.01 AS Decimal(7, 2)), CAST(42821.01 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (73, N'Vinyl', 2, 3279, CAST(50708.70 AS Decimal(7, 2)), CAST(50709.70 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (74, N'Wood', 2, 1983, CAST(46495.30 AS Decimal(7, 2)), CAST(46496.30 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (75, N'Steel', 4, 3138, CAST(29596.44 AS Decimal(7, 2)), CAST(42356.71 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (76, N'Vinyl', 5, 388, CAST(27317.75 AS Decimal(7, 2)), CAST(97697.85 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (77, N'Plastic', 2, 1107, CAST(73942.08 AS Decimal(7, 2)), CAST(80672.21 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (78, N'Brass', 1, 2492, CAST(11938.65 AS Decimal(7, 2)), CAST(61509.26 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (79, N'Vinyl', 1, 4594, CAST(34379.40 AS Decimal(7, 2)), CAST(46888.05 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (80, N'Rubber', 6, 3188, CAST(28277.95 AS Decimal(7, 2)), CAST(71162.01 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (81, N'Stone', 6, 84, CAST(58109.53 AS Decimal(7, 2)), CAST(66573.80 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (82, N'Brass', 1, 1669, CAST(67946.95 AS Decimal(7, 2)), CAST(67947.95 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (83, N'Vinyl', 2, 110, CAST(69377.27 AS Decimal(7, 2)), CAST(85404.55 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (84, N'Vinyl', 2, 4108, CAST(59373.31 AS Decimal(7, 2)), CAST(59374.31 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (85, N'Rubber', 2, 696, CAST(35863.27 AS Decimal(7, 2)), CAST(92358.20 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (86, N'Stone', 5, 4685, CAST(23707.43 AS Decimal(7, 2)), CAST(23708.43 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (87, N'Plastic', 6, 4598, CAST(96777.59 AS Decimal(7, 2)), CAST(96778.59 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (88, N'Plastic', 4, 290, CAST(61239.86 AS Decimal(7, 2)), CAST(61240.86 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (89, N'Plastic', 1, 3237, CAST(79887.40 AS Decimal(7, 2)), CAST(79888.40 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (90, N'Brass', 2, 4805, CAST(36964.18 AS Decimal(7, 2)), CAST(36965.18 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (91, N'Steel', 2, 2918, CAST(59845.12 AS Decimal(7, 2)), CAST(59846.12 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (92, N'Granite', 3, 1710, CAST(34336.07 AS Decimal(7, 2)), CAST(80772.27 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (93, N'Glass', 3, 32, CAST(61568.44 AS Decimal(7, 2)), CAST(61569.44 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (94, N'Wood', 2, 825, CAST(19002.31 AS Decimal(7, 2)), CAST(34370.26 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (95, N'Aluminum', 3, 3339, CAST(79191.90 AS Decimal(7, 2)), CAST(79192.90 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (96, N'Stone', 1, 2573, CAST(78735.66 AS Decimal(7, 2)), CAST(80529.46 AS Decimal(7, 2)), 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (97, N'Glass', 5, 1375, CAST(7229.86 AS Decimal(7, 2)), CAST(33679.93 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (98, N'Vinyl', 1, 4488, CAST(47000.46 AS Decimal(7, 2)), CAST(47001.46 AS Decimal(7, 2)), 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (99, N'Plastic', 6, 1487, CAST(52711.44 AS Decimal(7, 2)), CAST(69594.38 AS Decimal(7, 2)), 2)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [AvailableQuantity], [NetPrice], [SellPrice], [MakerID]) VALUES (100, N'Plexiglass', 4, 1185, CAST(61433.12 AS Decimal(7, 2)), CAST(73657.21 AS Decimal(7, 2)), 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (1, 7, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (1, 13, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (1, 30, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (1, 33, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (1, 39, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (2, 14, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (2, 17, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (2, 18, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (2, 29, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (2, 35, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (2, 39, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (3, 9, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (3, 26, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (3, 29, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (4, 4, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (4, 10, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (4, 12, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (4, 21, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (5, 9, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (6, 1, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (6, 8, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (6, 13, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (6, 14, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (6, 16, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (6, 20, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (7, 10, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (7, 38, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (8, 6, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (8, 26, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (9, 6, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (9, 12, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (9, 24, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (10, 1, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (10, 8, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (10, 29, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (11, 13, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (12, 8, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (12, 19, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (12, 24, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (13, 14, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (13, 22, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (13, 32, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (14, 11, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (14, 23, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (14, 29, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (14, 31, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (14, 37, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (14, 40, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (15, 17, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (15, 31, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (15, 33, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (16, 7, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (16, 11, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (16, 14, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (16, 39, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (17, 9, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (17, 19, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (17, 22, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (17, 24, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (18, 10, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (18, 11, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (18, 13, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (18, 22, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (19, 23, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (20, 27, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (21, 8, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (22, 4, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (22, 14, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (22, 27, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (23, 4, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (23, 7, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (23, 39, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (24, 7, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (24, 12, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (24, 14, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (24, 28, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (25, 4, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (25, 5, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (25, 19, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (25, 26, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (25, 27, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (25, 34, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (26, 11, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (26, 29, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (26, 37, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (27, 13, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (27, 26, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (27, 27, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (27, 36, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (28, 5, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (28, 7, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (28, 16, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (28, 18, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (28, 27, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (28, 38, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (30, 6, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (30, 36, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (31, 23, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (32, 2, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (32, 16, 2)
GO
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (32, 18, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (32, 24, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (33, 19, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (34, 23, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (35, 6, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (35, 40, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (36, 25, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (37, 23, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (37, 27, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (38, 8, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (38, 13, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (38, 23, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (38, 27, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (39, 24, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (39, 37, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (40, 3, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (40, 7, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (41, 24, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (41, 39, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (41, 40, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (42, 12, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (42, 13, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (42, 22, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (42, 30, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (42, 38, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (44, 18, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (44, 27, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (45, 16, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (45, 19, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (45, 24, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (45, 38, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (46, 3, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (46, 7, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (46, 14, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (46, 16, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (46, 19, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (46, 35, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (47, 12, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (47, 16, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (47, 22, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (48, 14, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (48, 21, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (49, 10, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (49, 18, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (49, 19, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (49, 22, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (49, 23, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (49, 27, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (50, 8, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (50, 15, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (50, 16, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (51, 11, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (51, 18, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (51, 29, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (51, 33, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (52, 15, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (52, 24, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (52, 31, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (52, 35, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (52, 38, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (53, 4, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (53, 27, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (53, 34, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (54, 4, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (54, 39, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (56, 2, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (56, 24, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (56, 26, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (56, 34, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (57, 8, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (58, 37, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (59, 6, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (59, 8, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (59, 15, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (59, 18, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (59, 25, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (59, 26, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (59, 28, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (60, 2, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (60, 21, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (60, 33, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (62, 7, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (63, 28, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (63, 33, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (63, 39, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (64, 15, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (65, 19, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (65, 22, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (65, 35, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (66, 4, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (66, 5, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (66, 37, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (67, 20, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (67, 29, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (68, 16, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (68, 26, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (68, 27, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (68, 39, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (69, 16, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (69, 19, 2)
GO
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (69, 21, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (69, 37, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (70, 22, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (70, 30, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (71, 21, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (71, 34, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (72, 4, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (72, 5, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (72, 33, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (73, 29, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (73, 30, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (74, 14, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (74, 18, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (74, 19, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (74, 25, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (75, 22, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (76, 3, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (76, 12, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (76, 20, 1)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (76, 37, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (77, 29, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (78, 31, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (78, 33, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (79, 1, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (79, 19, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (79, 33, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (79, 37, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (80, 28, 2)
INSERT [dbo].[SalersProducts] ([SaleID], [ProductID], [SaleQuantity]) VALUES (80, 37, 2)
GO
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (1, 28, 8, CAST(N'2024-01-23' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (2, 34, 7, CAST(N'2024-05-22' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (3, 19, 1, CAST(N'2023-09-18' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (4, 28, 12, CAST(N'2022-10-04' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (5, 34, 9, CAST(N'2021-01-05' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (6, 32, 8, CAST(N'2024-10-15' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (7, 15, 10, CAST(N'2023-09-22' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (8, 9, 1, CAST(N'2024-10-26' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (9, 17, 1, CAST(N'2023-09-04' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (10, 8, 5, CAST(N'2022-06-17' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (11, 39, 2, CAST(N'2023-05-22' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (12, 34, 6, CAST(N'2023-10-27' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (13, 32, 10, CAST(N'2022-10-24' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (14, 22, 12, CAST(N'2024-01-29' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (15, 1, 8, CAST(N'2023-06-26' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (16, 12, 10, CAST(N'2021-01-26' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (17, 10, 11, CAST(N'2020-09-20' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (18, 3, 7, CAST(N'2021-12-15' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (19, 28, 3, CAST(N'2020-12-17' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (20, 19, 9, CAST(N'2022-02-10' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (21, 19, 5, CAST(N'2020-10-14' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (22, 27, 9, CAST(N'2022-01-26' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (23, 14, 10, CAST(N'2020-10-31' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (24, 27, 6, CAST(N'2021-06-25' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (25, 30, 5, CAST(N'2024-06-13' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (26, 7, 12, CAST(N'2022-06-03' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (27, 3, 8, CAST(N'2020-12-06' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (28, 26, 12, CAST(N'2023-06-11' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (29, 6, 7, CAST(N'2024-05-12' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (30, 4, 6, CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (31, 5, 5, CAST(N'2020-12-03' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (32, 14, 4, CAST(N'2021-09-08' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (33, 10, 6, CAST(N'2021-02-06' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (34, 20, 12, CAST(N'2022-08-02' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (35, 26, 11, CAST(N'2024-03-14' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (36, 40, 10, CAST(N'2022-08-04' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (37, 8, 5, CAST(N'2021-06-18' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (38, 39, 5, CAST(N'2023-06-03' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (39, 1, 11, CAST(N'2023-08-09' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (40, 24, 1, CAST(N'2020-12-18' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (41, 3, 3, CAST(N'2024-06-30' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (42, 14, 9, CAST(N'2021-09-01' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (43, 20, 3, CAST(N'2022-03-20' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (44, 11, 11, CAST(N'2024-08-03' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (45, 13, 2, CAST(N'2024-02-16' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (46, 37, 10, CAST(N'2022-10-16' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (47, 11, 9, CAST(N'2021-09-07' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (48, 32, 6, CAST(N'2021-01-01' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (49, 12, 4, CAST(N'2022-09-08' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (50, 35, 6, CAST(N'2021-02-08' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (51, 12, 1, CAST(N'2022-08-21' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (52, 12, 6, CAST(N'2023-07-23' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (53, 29, 3, CAST(N'2021-12-14' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (54, 33, 3, CAST(N'2023-01-19' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (55, 32, 10, CAST(N'2021-11-27' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (56, 6, 8, CAST(N'2023-12-29' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (57, 2, 1, CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (58, 40, 1, CAST(N'2021-12-19' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (59, 38, 5, CAST(N'2024-10-16' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (60, 1, 5, CAST(N'2020-12-13' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (61, 2, 11, CAST(N'2022-01-13' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (62, 11, 1, CAST(N'2024-06-22' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (63, 30, 6, CAST(N'2020-12-02' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (64, 13, 9, CAST(N'2023-07-02' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (65, 35, 11, CAST(N'2021-04-26' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (66, 29, 9, CAST(N'2023-09-21' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (67, 16, 12, CAST(N'2022-01-22' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (68, 17, 7, CAST(N'2021-06-21' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (69, 6, 2, CAST(N'2022-02-19' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (70, 33, 7, CAST(N'2024-10-12' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (71, 33, 4, CAST(N'2021-05-30' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (72, 6, 11, CAST(N'2024-10-25' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (73, 9, 3, CAST(N'2020-10-04' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (74, 29, 2, CAST(N'2021-01-09' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (75, 33, 11, CAST(N'2021-07-29' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (76, 7, 7, CAST(N'2023-12-29' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (77, 11, 8, CAST(N'2021-07-05' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (78, 33, 8, CAST(N'2023-10-20' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (79, 10, 5, CAST(N'2024-06-23' AS Date))
INSERT [dbo].[Sales] ([SaleID], [ClientID], [EmployeeID], [SaleDate]) VALUES (80, 2, 3, CAST(N'2021-12-06' AS Date))
SET IDENTITY_INSERT [dbo].[Sales] OFF
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([PositionID])
REFERENCES [dbo].[Positions] ([PositionID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([MakerID])
REFERENCES [dbo].[Makers] ([MakerID])
GO
ALTER TABLE [dbo].[SalersProducts]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[SalersProducts]  WITH CHECK ADD FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sales] ([SaleID])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD CHECK  (([Discount]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [SportsShop] SET  READ_WRITE 
GO
