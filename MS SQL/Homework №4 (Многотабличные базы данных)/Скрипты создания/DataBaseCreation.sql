USE [master]
GO
/****** Object:  Database [Academy]    Script Date: 27.10.2024 20:47:00 ******/
CREATE DATABASE [Academy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Academy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Academy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Academy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Academy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Academy] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Academy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Academy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Academy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Academy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Academy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Academy] SET ARITHABORT OFF 
GO
ALTER DATABASE [Academy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Academy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Academy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Academy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Academy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Academy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Academy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Academy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Academy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Academy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Academy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Academy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Academy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Academy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Academy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Academy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Academy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Academy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Academy] SET  MULTI_USER 
GO
ALTER DATABASE [Academy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Academy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Academy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Academy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Academy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Academy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Academy] SET QUERY_STORE = ON
GO
ALTER DATABASE [Academy] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Academy]
GO
/****** Object:  Table [dbo].[Curators]    Script Date: 27.10.2024 20:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curators](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CuratorName] [nvarchar](max) NOT NULL,
	[CuratorSurname] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 27.10.2024 20:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Financing] [money] NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[FacultyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 27.10.2024 20:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FacultyName] [nvarchar](100) NOT NULL,
	[Financing] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupLectures]    Script Date: 27.10.2024 20:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupLectures](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LDayOfWeek] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
	[LectureID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 27.10.2024 20:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](100) NOT NULL,
	[GroupYear] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsCurators]    Script Date: 27.10.2024 20:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsCurators](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CuratorID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 27.10.2024 20:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LectureRoom] [nvarchar](max) NOT NULL,
	[SubjectID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 27.10.2024 20:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 27.10.2024 20:47:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [nvarchar](max) NOT NULL,
	[TeacherSurname] [nvarchar](max) NOT NULL,
	[Salary] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Curators] ON 

INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (1, N'Johannes', N'Storkes')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (2, N'Leticia', N'Labba')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (3, N'Byrle', N'McAlroy')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (4, N'Junette', N'Spavins')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (5, N'Candace', N'McGrath')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (6, N'Julissa', N'Spivie')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (7, N'Grant', N'Sellors')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (8, N'Taffy', N'Althorp')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (9, N'Lucas', N'Drinkall')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (10, N'Henrie', N'Blincko')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (11, N'Ethelbert', N'Tanswell')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (12, N'Darbie', N'Wildbore')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (13, N'Julian', N'Sitlington')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (14, N'Ignacio', N'Facchini')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (15, N'Kerstin', N'Briiginshaw')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (16, N'Francesca', N'Duddy')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (17, N'Cherish', N'Mitham')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (18, N'Nikki', N'Pergens')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (19, N'Cristionna', N'Mantz')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (20, N'Athena', N'Walczynski')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (21, N'Charlotta', N'Katt')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (22, N'Emmey', N'Fairholm')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (23, N'Benedetta', N'Hartgill')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (24, N'Mignonne', N'Hodcroft')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (25, N'Ingra', N'Tissiman')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (26, N'Brier', N'Harmond')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (27, N'Torry', N'Grigorian')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (28, N'Patsy', N'Lebell')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (29, N'Stu', N'Renney')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (30, N'Nikola', N'O''Hengerty')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (31, N'Adelbert', N'Djorevic')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (32, N'Athene', N'Gunney')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (33, N'Huberto', N'Ryce')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (34, N'Robinson', N'Topaz')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (35, N'Angela', N'Jaggi')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (36, N'Nikita', N'Eslie')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (37, N'Boonie', N'Halfpenny')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (38, N'Laughton', N'Carss')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (39, N'Verile', N'Laughrey')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (40, N'Heriberto', N'D''Errico')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (41, N'Nev', N'Clarke-Williams')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (42, N'Katina', N'Lorkings')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (43, N'Corenda', N'Yoell')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (44, N'Pauline', N'Wilbud')
INSERT [dbo].[Curators] ([id], [CuratorName], [CuratorSurname]) VALUES (45, N'Novelia', N'Wandless')
SET IDENTITY_INSERT [dbo].[Curators] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (1, 600000.0000, N'NationalHistory', 1)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (2, 550000.0000, N'General History', 1)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (3, 450000.0000, N'Political Science and Law', 1)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (4, 550000.0000, N'Museology', 1)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (5, 550000.0000, N'Religious studies', 1)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (6, 350000.0000, N'Management Psychology', 4)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (7, 440000.0000, N'Practical Psychology', 4)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (8, 520000.0000, N'Professional Pedagogy', 4)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (9, 500000.0000, N'Logic', 2)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (10, 460000.0000, N'Philosophy of education', 2)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (11, 430000.0000, N'Ethics', 2)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (12, 580000.0000, N'Philosophy of Politics and Law', 2)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (13, 520000.0000, N'World Economics', 3)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (14, 470000.0000, N'Finance and Credit', 3)
INSERT [dbo].[Departments] ([id], [Financing], [DepartmentName], [FacultyID]) VALUES (15, 610000.0000, N'Statistics', 3)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([id], [FacultyName], [Financing]) VALUES (1, N'HistoryFaculty', 2436000.0000)
INSERT [dbo].[Faculties] ([id], [FacultyName], [Financing]) VALUES (2, N'PhilosophyFaculty', 3648000.0000)
INSERT [dbo].[Faculties] ([id], [FacultyName], [Financing]) VALUES (3, N'EconomyFaculty', 2512000.0000)
INSERT [dbo].[Faculties] ([id], [FacultyName], [Financing]) VALUES (4, N'PsycologyFaculty', 3597000.0000)
SET IDENTITY_INSERT [dbo].[Faculties] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupLectures] ON 

INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (1, 7, 42, 22)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (2, 6, 33, 10)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (3, 5, 16, 29)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (4, 4, 35, 12)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (5, 7, 18, 36)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (6, 3, 31, 37)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (7, 3, 45, 21)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (8, 1, 25, 6)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (9, 6, 27, 9)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (10, 3, 39, 10)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (11, 2, 38, 3)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (12, 5, 19, 37)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (13, 2, 58, 25)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (14, 1, 37, 26)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (15, 4, 38, 14)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (16, 4, 27, 4)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (17, 6, 60, 40)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (18, 2, 43, 6)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (19, 5, 30, 7)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (20, 4, 30, 35)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (21, 1, 27, 3)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (22, 4, 22, 32)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (23, 1, 39, 24)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (24, 4, 50, 4)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (25, 6, 33, 11)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (26, 7, 47, 6)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (27, 4, 27, 1)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (28, 1, 22, 26)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (29, 6, 30, 27)
INSERT [dbo].[GroupLectures] ([id], [LDayOfWeek], [GroupID], [LectureID]) VALUES (30, 6, 35, 10)
SET IDENTITY_INSERT [dbo].[GroupLectures] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (16, N'NH1', 1, 1)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (17, N'NH2', 2, 1)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (18, N'NH3', 5, 1)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (19, N'GH1', 3, 2)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (20, N'GH2', 2, 2)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (21, N'GH3', 3, 2)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (22, N'PSL1', 5, 3)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (23, N'PSL2', 4, 3)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (24, N'PSL3', 1, 3)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (25, N'MUS1', 1, 4)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (26, N'MUS2', 2, 4)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (27, N'MUS3', 2, 4)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (28, N'RS1', 3, 5)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (29, N'RS2', 3, 5)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (30, N'RS3', 1, 5)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (31, N'MP1', 2, 6)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (32, N'MP2', 3, 6)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (33, N'MP3', 4, 6)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (34, N'PRPS1', 1, 7)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (35, N'PRPS2', 5, 7)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (36, N'PRPS3', 5, 7)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (37, N'PRPE1', 2, 8)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (38, N'PRPE2', 2, 8)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (39, N'PRPE3', 4, 8)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (40, N'LOG1', 2, 9)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (41, N'LOG2', 3, 9)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (42, N'LOG3', 3, 9)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (43, N'POE1', 1, 10)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (44, N'POE2', 1, 10)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (45, N'POE3', 5, 10)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (46, N'ETH1', 3, 11)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (47, N'ETH2', 4, 11)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (48, N'ETH3', 1, 11)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (49, N'PPL1', 2, 12)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (50, N'PPL2', 1, 12)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (51, N'PPL3', 3, 12)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (52, N'WE1', 3, 13)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (53, N'WE2', 5, 13)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (54, N'WE3', 4, 13)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (55, N'FAC1', 2, 14)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (56, N'FAC2', 4, 14)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (57, N'FAC3', 1, 14)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (58, N'ST1', 4, 15)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (59, N'ST2', 3, 15)
INSERT [dbo].[Groups] ([id], [GroupName], [GroupYear], [DepartmentID]) VALUES (60, N'ST3', 2, 15)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsCurators] ON 

INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (1, 1, 16)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (2, 2, 17)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (3, 3, 18)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (4, 4, 19)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (5, 5, 20)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (6, 6, 21)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (7, 7, 22)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (8, 8, 23)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (9, 9, 24)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (10, 10, 25)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (11, 11, 26)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (12, 12, 27)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (13, 13, 28)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (14, 14, 29)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (15, 15, 30)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (16, 16, 31)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (17, 17, 32)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (18, 18, 33)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (19, 19, 34)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (20, 20, 35)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (21, 21, 36)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (22, 22, 37)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (23, 23, 38)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (24, 24, 39)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (25, 25, 40)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (26, 26, 41)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (27, 27, 42)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (28, 28, 43)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (29, 29, 44)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (30, 30, 45)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (31, 31, 46)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (32, 32, 47)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (33, 33, 48)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (34, 34, 49)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (35, 35, 50)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (36, 36, 51)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (37, 37, 52)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (38, 38, 53)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (39, 39, 54)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (40, 40, 55)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (41, 41, 56)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (42, 42, 57)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (43, 43, 58)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (44, 44, 59)
INSERT [dbo].[GroupsCurators] ([id], [CuratorID], [GroupID]) VALUES (45, 45, 60)
SET IDENTITY_INSERT [dbo].[GroupsCurators] OFF
GO
SET IDENTITY_INSERT [dbo].[Lectures] ON 

INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (1, N'Room1', 18, 3)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (2, N'Room2', 1, 18)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (3, N'Room3', 17, 5)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (4, N'Room4', 17, 16)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (5, N'Room5', 14, 15)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (6, N'Room6', 15, 17)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (7, N'Room7', 13, 16)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (8, N'Room8', 19, 4)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (9, N'Room9', 7, 15)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (10, N'Room10', 19, 14)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (11, N'Room11', 6, 6)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (12, N'Room12', 17, 10)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (13, N'Room13', 19, 11)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (14, N'Room14', 17, 8)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (15, N'Room15', 19, 5)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (16, N'Room16', 20, 11)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (17, N'Room17', 19, 12)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (18, N'Room18', 5, 1)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (19, N'Room19', 11, 9)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (20, N'Room20', 8, 14)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (21, N'Room21', 7, 5)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (22, N'Room22', 5, 10)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (23, N'Room23', 8, 19)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (24, N'Room24', 15, 13)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (25, N'Room25', 2, 3)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (26, N'Room26', 20, 17)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (27, N'Room27', 7, 2)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (28, N'Room28', 13, 12)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (29, N'Room29', 19, 19)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (30, N'Room30', 14, 13)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (31, N'Room31', 6, 16)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (32, N'Room32', 3, 18)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (33, N'Room33', 2, 8)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (34, N'Room34', 4, 4)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (35, N'Room35', 16, 9)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (36, N'Room36', 19, 9)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (37, N'Room37', 19, 11)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (38, N'Room38', 8, 19)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (39, N'Room39', 15, 2)
INSERT [dbo].[Lectures] ([id], [LectureRoom], [SubjectID], [TeacherID]) VALUES (40, N'Room40', 3, 14)
SET IDENTITY_INSERT [dbo].[Lectures] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (10, N'Beverage Industry')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (9, N'Data Mining')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (6, N'Eclipse')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (18, N'Electronic Payments')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (8, N'EOS')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (7, N'Food Processing')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (13, N'Google Analytics')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (14, N'HTML Scripting')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (16, N'HTML5')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (12, N'iBatis')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (17, N'Loan Servicing')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (19, N'Mental Health')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (2, N'OS X')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (1, N'Smartphones')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (15, N'SRT')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (3, N'Team Leadership')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (11, N'Twitter Marketing')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (4, N'Vector NTI')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (20, N'VGA')
INSERT [dbo].[Subjects] ([id], [SubjectName]) VALUES (5, N'VJ')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (1, N'Christan', N'Dadley', 41952.0801)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (2, N'Ann-marie', N'Vecard', 97331.1038)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (3, N'Jacenta', N'Kharchinski', 91485.5038)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (4, N'Rosalie', N'Roloff', 74137.0039)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (5, N'Magda', N'Docharty', 31039.7433)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (6, N'Elinore', N'Peizer', 45647.6678)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (7, N'Shannon', N'Tilby', 75967.1493)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (8, N'Maure', N'Raddenbury', 42051.3375)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (9, N'Katerina', N'Oppy', 28966.2934)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (10, N'Matias', N'Spurrier', 90589.3235)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (11, N'Gayler', N'Totton', 83175.5840)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (12, N'Channa', N'Dyble', 70595.5873)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (13, N'Evie', N'Studman', 94232.2225)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (14, N'Kerby', N'Edards', 85293.5779)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (15, N'Englebert', N'Holley', 62278.2230)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (16, N'Chickie', N'Nesby', 98301.9527)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (17, N'Cristal', N'Mercer', 57698.2900)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (18, N'Anne-corinne', N'Dodding', 81328.4972)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (19, N'Trina', N'Hursey', 54039.8607)
INSERT [dbo].[Teachers] ([id], [TeacherName], [TeacherSurname], [Salary]) VALUES (20, N'Belle', N'McKeown', 85863.9432)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__D949CC342DF77904]    Script Date: 27.10.2024 20:47:00 ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Facultie__BFD889E163E18C22]    Script Date: 27.10.2024 20:47:00 ******/
ALTER TABLE [dbo].[Faculties] ADD UNIQUE NONCLUSTERED 
(
	[FacultyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Groups__6EFCD434B3E28EC7]    Script Date: 27.10.2024 20:47:00 ******/
ALTER TABLE [dbo].[Groups] ADD UNIQUE NONCLUSTERED 
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Subjects__4C5A7D554BCD6C70]    Script Date: 27.10.2024 20:47:00 ******/
ALTER TABLE [dbo].[Subjects] ADD UNIQUE NONCLUSTERED 
(
	[SubjectName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Curators] ADD  DEFAULT ('CuratorName') FOR [CuratorName]
GO
ALTER TABLE [dbo].[Curators] ADD  DEFAULT ('CuratorSurname') FOR [CuratorSurname]
GO
ALTER TABLE [dbo].[Departments] ADD  DEFAULT ((0)) FOR [Financing]
GO
ALTER TABLE [dbo].[Departments] ADD  DEFAULT ('DepartmentName') FOR [DepartmentName]
GO
ALTER TABLE [dbo].[Faculties] ADD  DEFAULT ('FacultyName') FOR [FacultyName]
GO
ALTER TABLE [dbo].[Faculties] ADD  DEFAULT ((0)) FOR [Financing]
GO
ALTER TABLE [dbo].[Groups] ADD  DEFAULT ('GroupName') FOR [GroupName]
GO
ALTER TABLE [dbo].[Lectures] ADD  DEFAULT ('LectureRoom') FOR [LectureRoom]
GO
ALTER TABLE [dbo].[Subjects] ADD  DEFAULT ('SubjectName') FOR [SubjectName]
GO
ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ('Teacher"s name') FOR [TeacherName]
GO
ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ('Teacher"s surname') FOR [TeacherSurname]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD FOREIGN KEY([FacultyID])
REFERENCES [dbo].[Faculties] ([id])
GO
ALTER TABLE [dbo].[GroupLectures]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[GroupLectures]  WITH CHECK ADD FOREIGN KEY([LectureID])
REFERENCES [dbo].[Lectures] ([id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[GroupsCurators]  WITH CHECK ADD FOREIGN KEY([CuratorID])
REFERENCES [dbo].[Curators] ([id])
GO
ALTER TABLE [dbo].[GroupsCurators]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([id])
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD CHECK  (([Financing]>=(0)))
GO
ALTER TABLE [dbo].[Faculties]  WITH CHECK ADD CHECK  (([Financing]>=(0)))
GO
ALTER TABLE [dbo].[GroupLectures]  WITH CHECK ADD CHECK  (([LDayOfWeek]>(0) AND [LDayOfWeek]<=(7)))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([GroupYear]>(0) AND [GroupYear]<=(5)))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Salary]>(0)))
GO
USE [master]
GO
ALTER DATABASE [Academy] SET  READ_WRITE 
GO
