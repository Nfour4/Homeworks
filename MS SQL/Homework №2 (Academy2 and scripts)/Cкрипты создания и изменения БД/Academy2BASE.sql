USE [master]
GO
/****** Object:  Database [Academy2]    Script Date: 20.10.2024 20:40:06 ******/
CREATE DATABASE [Academy2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Academy2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Academy2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Academy2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Academy2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Academy2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Academy2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Academy2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Academy2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Academy2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Academy2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Academy2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Academy2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Academy2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Academy2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Academy2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Academy2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Academy2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Academy2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Academy2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Academy2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Academy2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Academy2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Academy2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Academy2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Academy2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Academy2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Academy2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Academy2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Academy2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Academy2] SET  MULTI_USER 
GO
ALTER DATABASE [Academy2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Academy2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Academy2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Academy2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Academy2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Academy2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Academy2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Academy2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Academy2]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 20.10.2024 20:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[Financy] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 20.10.2024 20:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[FacultyID] [int] IDENTITY(1,1) NOT NULL,
	[Dean] [nvarchar](max) NOT NULL,
	[FacultyName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FacultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 20.10.2024 20:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](10) NOT NULL,
	[Rating] [int] NOT NULL,
	[Course] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 20.10.2024 20:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[EmploymentDate] [date] NOT NULL,
	[IsAssistant] [bit] NOT NULL,
	[IsProfessor] [bit] NOT NULL,
	[TeacherName] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Position] [nvarchar](max) NOT NULL,
	[Premium] [money] NOT NULL,
	[Salary] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Financy]) VALUES (1, N'PhysicsDept', 400000.0000)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Financy]) VALUES (2, N'ITDept', 500000.0000)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Financy]) VALUES (3, N'HistoryDept', 450000.0000)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Financy]) VALUES (4, N'GeographicDept', 350000.0000)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Financy]) VALUES (5, N'LanguagesDept', 250000.0000)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Financy]) VALUES (6, N'MechanicDept', 300000.0000)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [Financy]) VALUES (7, N'PoliticalDept', 600000.0000)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([FacultyID], [Dean], [FacultyName]) VALUES (1, N'Jack Black', N'IT-PhysicsFac')
INSERT [dbo].[Faculties] ([FacultyID], [Dean], [FacultyName]) VALUES (2, N'Paul Rosenberg', N'History-GeographicFac')
INSERT [dbo].[Faculties] ([FacultyID], [Dean], [FacultyName]) VALUES (3, N'Nick Fury', N'Political-LanguagesFac')
INSERT [dbo].[Faculties] ([FacultyID], [Dean], [FacultyName]) VALUES (4, N'Linda Marlen', N'Mecanical-TechnicalFac')
SET IDENTITY_INSERT [dbo].[Faculties] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([GroupID], [GroupName], [Rating], [Course]) VALUES (1, N'First', 5, 1)
INSERT [dbo].[Groups] ([GroupID], [GroupName], [Rating], [Course]) VALUES (2, N'Second', 3, 5)
INSERT [dbo].[Groups] ([GroupID], [GroupName], [Rating], [Course]) VALUES (3, N'Third', 4, 2)
INSERT [dbo].[Groups] ([GroupID], [GroupName], [Rating], [Course]) VALUES (4, N'Foutrh', 4, 3)
INSERT [dbo].[Groups] ([GroupID], [GroupName], [Rating], [Course]) VALUES (5, N'Fifth', 5, 2)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (1, CAST(N'1995-01-02' AS Date), 0, 1, N'John', N'Smith', N'HistoryProfessor', 15000.0000, 60000.0000)
INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (2, CAST(N'2020-03-24' AS Date), 1, 0, N'Jane', N'Johnson', N'HistoryAssistant', 5000.0000, 20000.0000)
INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (3, CAST(N'2001-02-23' AS Date), 0, 1, N'Emily', N'Williams', N'PhysicsProfessor', 12000.0000, 55000.0000)
INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (4, CAST(N'2021-04-11' AS Date), 1, 0, N'David', N'Brown', N'PhysicsAssistant', 3000.0000, 24000.0000)
INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (5, CAST(N'1995-07-13' AS Date), 0, 1, N'Sarah', N'Jones', N'GeographyProfessor', 11000.0000, 57000.0000)
INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (6, CAST(N'2022-10-15' AS Date), 1, 0, N'Thomas', N'Miller', N'GeographyAssistant', 4000.0000, 21000.0000)
INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (7, CAST(N'1991-12-12' AS Date), 0, 1, N'Jennifer', N'Davis', N'ITProfessor', 11000.0000, 61000.0000)
INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (8, CAST(N'2020-11-05' AS Date), 1, 0, N'Michael', N'Wilson', N'ITAssistant', 1500.0000, 29000.0000)
INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (9, CAST(N'2023-11-18' AS Date), 1, 0, N'Ashley', N'Taylor', N'LanguagesAssistant', 14500.0000, 50000.0000)
INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (10, CAST(N'1997-05-11' AS Date), 0, 1, N'Jack', N'Black', N'LanguagesProfessor', 2000.0000, 24000.0000)
INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (11, CAST(N'1998-11-27' AS Date), 0, 1, N'Marlin', N'Manson', N'PoliticProfessor', 17000.0000, 65000.0000)
INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (12, CAST(N'2024-02-10' AS Date), 1, 0, N'Rick', N'Ross', N'PoliticAssistant', 7000.0000, 28000.0000)
INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (13, CAST(N'2000-08-14' AS Date), 0, 1, N'Conor', N'Greath', N'MechanicProfessor', 13000.0000, 55000.0000)
INSERT [dbo].[Teachers] ([TeacherID], [EmploymentDate], [IsAssistant], [IsProfessor], [TeacherName], [Surname], [Position], [Premium], [Salary]) VALUES (14, CAST(N'2021-10-11' AS Date), 1, 0, N'Nick', N'Fury', N'MechanicAssistant', 1800.0000, 25000.0000)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__D949CC34D01F3AC3]    Script Date: 20.10.2024 20:40:06 ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Facultie__BFD889E16905D5D4]    Script Date: 20.10.2024 20:40:06 ******/
ALTER TABLE [dbo].[Faculties] ADD UNIQUE NONCLUSTERED 
(
	[FacultyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Groups__6EFCD4348DD13FE2]    Script Date: 20.10.2024 20:40:06 ******/
ALTER TABLE [dbo].[Groups] ADD UNIQUE NONCLUSTERED 
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departments] ADD  DEFAULT ('Name') FOR [DepartmentName]
GO
ALTER TABLE [dbo].[Departments] ADD  DEFAULT ((0)) FOR [Financy]
GO
ALTER TABLE [dbo].[Faculties] ADD  DEFAULT ('Dean') FOR [Dean]
GO
ALTER TABLE [dbo].[Faculties] ADD  DEFAULT ('Name') FOR [FacultyName]
GO
ALTER TABLE [dbo].[Groups] ADD  DEFAULT ('Name') FOR [GroupName]
GO
ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ((0)) FOR [IsAssistant]
GO
ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ((0)) FOR [IsProfessor]
GO
ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ('Name') FOR [TeacherName]
GO
ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ('Surname') FOR [Surname]
GO
ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ('Position') FOR [Position]
GO
ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ((0)) FOR [Premium]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD CHECK  (([Financy]>=(0)))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([Course]>(0) AND [Course]<=(5)))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([Rating]>=(0) AND [Rating]<=(5)))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([EmploymentDate]>='1990-01-01'))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Premium]>=(0)))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Salary]>(0)))
GO
USE [master]
GO
ALTER DATABASE [Academy2] SET  READ_WRITE 
GO
