USE [master]
GO
/****** Object:  Database [Academy2]    Script Date: 29.10.2024 22:19:00 ******/
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
/****** Object:  Table [dbo].[Curators]    Script Date: 29.10.2024 22:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CuratorName] [nvarchar](max) NULL,
	[CuratorSurname] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 29.10.2024 22:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Building] [int] NULL,
	[Financing] [money] NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[FacultyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 29.10.2024 22:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacultyName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 29.10.2024 22:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](100) NULL,
	[GroupYear] [int] NOT NULL,
	[DepartmentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsCurators]    Script Date: 29.10.2024 22:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsCurators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CuratorId] [int] NULL,
	[GroupId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsLectures]    Script Date: 29.10.2024 22:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsLectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NULL,
	[LectureId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsStudents]    Script Date: 29.10.2024 22:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsStudents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NULL,
	[StudentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 29.10.2024 22:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LectureDate] [date] NOT NULL,
	[SubjectId] [int] NULL,
	[TeacherId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 29.10.2024 22:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](max) NULL,
	[StudentSurname] [nvarchar](max) NULL,
	[Rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 29.10.2024 22:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 29.10.2024 22:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [nvarchar](max) NULL,
	[TeacherSurname] [nvarchar](max) NULL,
	[IsProfessor] [bit] NULL,
	[Salary] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Curators] ON 

INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (1, N'Johannes', N'Storkes')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (2, N'Leticia', N'Labba')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (3, N'Byrle', N'McAlroy')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (4, N'Junette', N'Spavins')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (5, N'Candace', N'McGrath')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (6, N'Julissa', N'Spivie')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (7, N'Grant', N'Sellors')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (8, N'Taffy', N'Althorp')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (9, N'Lucas', N'Drinkall')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (10, N'Henrie', N'Blincko')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (11, N'Ethelbert', N'Tanswell')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (12, N'Darbie', N'Wildbore')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (13, N'Julian', N'Sitlington')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (14, N'Ignacio', N'Facchini')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (15, N'Kerstin', N'Briiginshaw')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (16, N'Francesca', N'Duddy')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (17, N'Cherish', N'Mitham')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (18, N'Nikki', N'Pergens')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (19, N'Cristionna', N'Mantz')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (20, N'Athena', N'Walczynski')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (21, N'Charlotta', N'Katt')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (22, N'Emmey', N'Fairholm')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (23, N'Benedetta', N'Hartgill')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (24, N'Mignonne', N'Hodcroft')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (25, N'Ingra', N'Tissiman')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (26, N'Brier', N'Harmond')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (27, N'Torry', N'Grigorian')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (28, N'Patsy', N'Lebell')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (29, N'Stu', N'Renney')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (30, N'Nikola', N'O''Hengerty')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (31, N'Adelbert', N'Djorevic')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (32, N'Athene', N'Gunney')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (33, N'Huberto', N'Ryce')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (34, N'Robinson', N'Topaz')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (35, N'Angela', N'Jaggi')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (36, N'Nikita', N'Eslie')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (37, N'Boonie', N'Halfpenny')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (38, N'Laughton', N'Carss')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (39, N'Verile', N'Laughrey')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (40, N'Heriberto', N'D''Errico')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (41, N'Nev', N'Clarke-Williams')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (42, N'Katina', N'Lorkings')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (43, N'Corenda', N'Yoell')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (44, N'Pauline', N'Wilbud')
INSERT [dbo].[Curators] ([Id], [CuratorName], [CuratorSurname]) VALUES (45, N'Novelia', N'Wandless')
SET IDENTITY_INSERT [dbo].[Curators] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (1, 1, 600000.0000, N'NationalHistory', 1)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (2, 3, 550000.0000, N'General History', 1)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (3, 4, 450000.0000, N'Political Science and Law', 1)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (4, 4, 550000.0000, N'Museology', 1)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (5, 2, 550000.0000, N'Religious studies', 1)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (6, 1, 350000.0000, N'Management Psychology', 4)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (7, 4, 440000.0000, N'Practical Psychology', 4)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (8, 3, 520000.0000, N'Professional Pedagogy', 4)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (9, 5, 500000.0000, N'Logic', 2)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (10, 1, 460000.0000, N'Philosophy of education', 2)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (11, 3, 430000.0000, N'Ethics', 2)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (12, 5, 580000.0000, N'Philosophy of Politics and Law', 2)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (13, 1, 520000.0000, N'World Economics', 3)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (14, 2, 470000.0000, N'Finance and Credit', 3)
INSERT [dbo].[Departments] ([Id], [Building], [Financing], [DepartmentName], [FacultyId]) VALUES (15, 4, 610000.0000, N'Statistics', 3)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([Id], [FacultyName]) VALUES (1, N'HistoryFaculty')
INSERT [dbo].[Faculties] ([Id], [FacultyName]) VALUES (2, N'PhilosophyFaculty')
INSERT [dbo].[Faculties] ([Id], [FacultyName]) VALUES (3, N'EconomyFaculty')
INSERT [dbo].[Faculties] ([Id], [FacultyName]) VALUES (4, N'PsycologyFaculty')
SET IDENTITY_INSERT [dbo].[Faculties] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (1, N'NH1', 1, 1)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (2, N'NH2', 2, 1)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (3, N'NH3', 5, 1)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (4, N'GH1', 3, 2)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (5, N'GH2', 2, 2)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (6, N'GH3', 3, 2)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (7, N'PSL1', 5, 3)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (8, N'PSL2', 4, 3)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (9, N'PSL3', 1, 3)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (10, N'MUS1', 1, 4)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (11, N'MUS2', 2, 4)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (12, N'MUS3', 2, 4)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (13, N'RS1', 3, 5)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (14, N'RS2', 3, 5)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (15, N'RS3', 1, 5)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (16, N'MP1', 2, 6)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (17, N'MP2', 3, 6)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (18, N'MP3', 4, 6)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (19, N'PRPS1', 1, 7)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (20, N'PRPS2', 5, 7)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (21, N'PRPS3', 5, 7)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (22, N'PRPE1', 2, 8)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (23, N'PRPE2', 2, 8)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (24, N'PRPE3', 4, 8)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (25, N'LOG1', 2, 9)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (26, N'LOG2', 3, 9)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (27, N'LOG3', 3, 9)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (28, N'POE1', 1, 10)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (29, N'POE2', 1, 10)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (30, N'POE3', 5, 10)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (31, N'ETH1', 3, 11)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (32, N'ETH2', 4, 11)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (33, N'ETH3', 1, 11)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (34, N'PPL1', 2, 12)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (35, N'PPL2', 1, 12)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (36, N'PPL3', 3, 12)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (37, N'WE1', 3, 13)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (38, N'WE2', 5, 13)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (39, N'WE3', 4, 13)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (40, N'FAC1', 2, 14)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (41, N'FAC2', 4, 14)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (42, N'FAC3', 1, 14)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (43, N'ST1', 4, 15)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (44, N'ST2', 3, 15)
INSERT [dbo].[Groups] ([Id], [GroupName], [GroupYear], [DepartmentId]) VALUES (45, N'ST3', 2, 15)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsCurators] ON 

INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (1, 1, 1)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (2, 2, 2)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (3, 3, 3)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (4, 4, 4)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (5, 5, 5)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (6, 6, 6)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (7, 7, 7)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (8, 8, 8)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (9, 9, 1)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (10, 10, 10)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (11, 11, 11)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (12, 12, 12)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (13, 13, 13)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (14, 14, 14)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (15, 15, 15)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (16, 16, 16)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (17, 17, 17)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (18, 18, 2)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (19, 19, 19)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (20, 20, 20)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (21, 21, 21)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (22, 22, 22)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (23, 23, 23)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (24, 24, 24)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (25, 25, 1)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (26, 26, 26)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (27, 27, 27)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (28, 28, 28)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (29, 29, 29)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (30, 30, 30)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (31, 31, 31)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (32, 32, 32)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (33, 33, 33)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (34, 34, 34)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (35, 35, 1)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (36, 36, 36)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (37, 37, 37)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (38, 38, 38)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (39, 39, 39)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (40, 40, 40)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (41, 41, 41)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (42, 42, 42)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (43, 43, 2)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (44, 44, 44)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (45, 45, 45)
SET IDENTITY_INSERT [dbo].[GroupsCurators] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsLectures] ON 

INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (1, 44, 16)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (2, 32, 16)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (3, 9, 25)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (4, 2, 2)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (5, 15, 5)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (6, 17, 7)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (7, 29, 17)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (8, 8, 9)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (9, 24, 2)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (10, 5, 30)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (11, 17, 28)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (12, 30, 19)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (13, 12, 29)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (14, 19, 10)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (15, 43, 13)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (16, 5, 8)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (17, 22, 19)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (18, 22, 26)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (19, 32, 23)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (20, 18, 11)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (21, 10, 21)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (22, 3, 10)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (23, 24, 3)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (24, 22, 26)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (25, 25, 18)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (26, 34, 19)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (27, 20, 22)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (28, 21, 21)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (29, 33, 14)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (30, 23, 27)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (31, 40, 14)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (32, 28, 5)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (33, 15, 28)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (34, 17, 11)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (35, 32, 5)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (36, 18, 28)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (37, 8, 11)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (38, 32, 5)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (39, 35, 9)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (40, 15, 19)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (41, 16, 26)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (42, 43, 24)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (43, 18, 14)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (44, 38, 19)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (45, 3, 16)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (46, 2, 14)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (47, 39, 14)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (48, 24, 8)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (49, 31, 8)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (50, 33, 6)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (51, 40, 29)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (52, 34, 23)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (53, 12, 17)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (54, 4, 20)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (55, 5, 26)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (56, 43, 7)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (57, 40, 11)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (58, 30, 30)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (59, 38, 4)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (60, 7, 4)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (61, 4, 9)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (62, 30, 3)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (63, 13, 27)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (64, 5, 25)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (65, 38, 4)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (66, 8, 10)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (67, 37, 6)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (68, 5, 14)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (69, 11, 17)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (70, 25, 14)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (71, 13, 4)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (72, 43, 19)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (73, 10, 17)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (74, 20, 14)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (75, 30, 12)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (76, 12, 12)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (77, 43, 25)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (78, 40, 7)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (79, 39, 18)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (80, 28, 26)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (81, 5, 20)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (82, 36, 3)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (83, 2, 21)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (84, 14, 15)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (85, 9, 10)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (86, 3, 18)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (87, 28, 10)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (88, 7, 7)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (89, 15, 15)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (90, 13, 17)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (91, 34, 12)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (92, 12, 20)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (93, 1, 29)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (94, 31, 6)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (95, 23, 2)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (96, 22, 13)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (97, 5, 27)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (98, 26, 7)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (99, 19, 24)
GO
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (100, 36, 30)
SET IDENTITY_INSERT [dbo].[GroupsLectures] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsStudents] ON 

INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (1, 32, 1)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (2, 39, 2)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (3, 2, 3)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (4, 25, 4)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (5, 1, 5)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (6, 2, 6)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (7, 22, 7)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (8, 7, 8)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (9, 39, 9)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (10, 5, 10)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (11, 2, 11)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (12, 22, 12)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (13, 27, 13)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (14, 15, 14)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (15, 19, 15)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (16, 38, 16)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (17, 45, 17)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (18, 8, 18)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (19, 30, 19)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (20, 1, 20)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (21, 41, 21)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (22, 31, 22)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (23, 17, 23)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (24, 1, 24)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (25, 17, 25)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (26, 19, 26)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (27, 28, 27)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (28, 28, 28)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (29, 19, 29)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (30, 30, 30)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (31, 31, 31)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (32, 42, 32)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (33, 42, 33)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (34, 39, 34)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (35, 13, 35)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (36, 10, 36)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (37, 40, 37)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (38, 34, 38)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (39, 5, 39)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (40, 34, 40)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (41, 26, 41)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (42, 6, 42)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (43, 11, 43)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (44, 38, 44)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (45, 10, 45)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (46, 23, 46)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (47, 27, 47)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (48, 32, 48)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (49, 11, 49)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (50, 19, 50)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (51, 26, 51)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (52, 1, 52)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (53, 3, 53)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (54, 5, 54)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (55, 6, 55)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (56, 45, 56)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (57, 8, 57)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (58, 14, 58)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (59, 45, 59)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (60, 22, 60)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (61, 41, 61)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (62, 24, 62)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (63, 4, 63)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (64, 2, 64)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (65, 12, 65)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (66, 4, 66)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (67, 10, 67)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (68, 10, 68)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (69, 2, 69)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (70, 19, 70)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (71, 45, 71)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (72, 38, 72)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (73, 6, 73)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (74, 19, 74)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (75, 3, 75)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (76, 25, 76)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (77, 24, 77)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (78, 1, 78)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (79, 14, 79)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (80, 18, 80)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (81, 2, 81)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (82, 39, 82)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (83, 40, 83)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (84, 27, 84)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (85, 15, 85)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (86, 11, 86)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (87, 16, 87)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (88, 34, 88)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (89, 45, 89)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (90, 41, 90)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (91, 10, 91)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (92, 27, 92)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (93, 21, 93)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (94, 45, 94)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (95, 32, 95)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (96, 35, 96)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (97, 26, 97)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (98, 18, 98)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (99, 25, 99)
GO
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (100, 5, 100)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (101, 16, 101)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (102, 22, 102)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (103, 5, 103)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (104, 34, 104)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (105, 13, 105)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (106, 43, 106)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (107, 29, 107)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (108, 9, 108)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (109, 26, 109)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (110, 7, 110)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (111, 23, 111)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (112, 39, 112)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (113, 35, 113)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (114, 39, 114)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (115, 40, 115)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (116, 33, 116)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (117, 9, 117)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (118, 4, 118)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (119, 11, 119)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (120, 12, 120)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (121, 24, 121)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (122, 44, 122)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (123, 15, 123)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (124, 31, 124)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (125, 22, 125)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (126, 40, 126)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (127, 22, 127)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (128, 24, 128)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (129, 22, 129)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (130, 35, 130)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (131, 4, 131)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (132, 2, 132)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (133, 25, 133)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (134, 42, 134)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (135, 29, 135)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (136, 39, 136)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (137, 33, 137)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (138, 8, 138)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (139, 43, 139)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (140, 6, 140)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (141, 26, 141)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (142, 3, 142)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (143, 18, 143)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (144, 27, 144)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (145, 21, 145)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (146, 37, 146)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (147, 24, 147)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (148, 41, 148)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (149, 35, 149)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (150, 33, 150)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (151, 43, 151)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (152, 40, 152)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (153, 28, 153)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (154, 6, 154)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (155, 22, 155)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (156, 8, 156)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (157, 34, 157)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (158, 12, 158)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (159, 28, 159)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (160, 19, 160)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (161, 37, 161)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (162, 36, 162)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (163, 37, 163)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (164, 13, 164)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (165, 3, 165)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (166, 26, 166)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (167, 23, 167)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (168, 45, 168)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (169, 22, 169)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (170, 22, 170)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (171, 16, 171)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (172, 44, 172)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (173, 17, 173)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (174, 20, 174)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (175, 29, 175)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (176, 11, 176)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (177, 28, 177)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (178, 12, 178)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (179, 28, 179)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (180, 10, 180)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (181, 38, 181)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (182, 21, 182)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (183, 7, 183)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (184, 24, 184)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (185, 40, 185)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (186, 6, 186)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (187, 40, 187)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (188, 24, 188)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (189, 37, 189)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (190, 29, 190)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (191, 24, 191)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (192, 34, 192)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (193, 22, 193)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (194, 39, 194)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (195, 32, 195)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (196, 28, 196)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (197, 9, 197)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (198, 41, 198)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (199, 10, 199)
GO
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (200, 32, 200)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (201, 15, 201)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (202, 26, 202)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (203, 23, 203)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (204, 19, 204)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (205, 26, 205)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (206, 13, 206)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (207, 28, 207)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (208, 36, 208)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (209, 22, 209)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (210, 13, 210)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (211, 10, 211)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (212, 21, 212)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (213, 45, 213)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (214, 2, 214)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (215, 38, 215)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (216, 8, 216)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (217, 32, 217)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (218, 16, 218)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (219, 8, 219)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (220, 39, 220)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (221, 19, 221)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (222, 4, 222)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (223, 45, 223)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (224, 25, 224)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (225, 4, 225)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (226, 38, 226)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (227, 6, 227)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (228, 8, 228)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (229, 30, 229)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (230, 5, 230)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (231, 40, 231)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (232, 43, 232)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (233, 33, 233)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (234, 9, 234)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (235, 5, 235)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (236, 36, 236)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (237, 30, 237)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (238, 15, 238)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (239, 21, 239)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (240, 44, 240)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (241, 12, 241)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (242, 26, 242)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (243, 27, 243)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (244, 40, 244)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (245, 13, 245)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (246, 11, 246)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (247, 16, 247)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (248, 36, 248)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (249, 7, 249)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (250, 21, 250)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (251, 15, 251)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (252, 12, 252)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (253, 28, 253)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (254, 34, 254)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (255, 34, 255)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (256, 9, 256)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (257, 30, 257)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (258, 13, 258)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (259, 21, 259)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (260, 9, 260)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (261, 33, 261)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (262, 10, 262)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (263, 4, 263)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (264, 42, 264)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (265, 28, 265)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (266, 3, 266)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (267, 16, 267)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (268, 21, 268)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (269, 5, 269)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (270, 1, 270)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (271, 36, 271)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (272, 13, 272)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (273, 30, 273)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (274, 12, 274)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (275, 13, 275)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (276, 41, 276)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (277, 4, 277)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (278, 24, 278)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (279, 23, 279)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (280, 27, 280)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (281, 32, 281)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (282, 27, 282)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (283, 12, 283)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (284, 42, 284)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (285, 42, 285)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (286, 16, 286)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (287, 24, 287)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (288, 1, 288)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (289, 42, 289)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (290, 25, 290)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (291, 32, 291)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (292, 19, 292)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (293, 27, 293)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (294, 3, 294)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (295, 6, 295)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (296, 43, 296)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (297, 26, 297)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (298, 21, 298)
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (299, 2, 299)
GO
INSERT [dbo].[GroupsStudents] ([Id], [GroupId], [StudentId]) VALUES (300, 10, 300)
SET IDENTITY_INSERT [dbo].[GroupsStudents] OFF
GO
SET IDENTITY_INSERT [dbo].[Lectures] ON 

INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (2, CAST(N'2024-12-14' AS Date), 9, 12)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (3, CAST(N'2024-04-16' AS Date), 14, 12)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (4, CAST(N'2024-11-10' AS Date), 19, 17)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (5, CAST(N'2024-06-08' AS Date), 17, 15)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (6, CAST(N'2024-02-09' AS Date), 12, 2)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (7, CAST(N'2024-06-13' AS Date), 10, 5)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (8, CAST(N'2024-07-28' AS Date), 15, 20)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (9, CAST(N'2024-05-21' AS Date), 18, 20)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (10, CAST(N'2024-01-12' AS Date), 16, 11)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (11, CAST(N'2024-05-06' AS Date), 1, 6)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (12, CAST(N'2024-02-03' AS Date), 16, 11)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (13, CAST(N'2024-12-19' AS Date), 20, 8)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (14, CAST(N'2024-05-02' AS Date), 11, 14)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (15, CAST(N'2024-08-17' AS Date), 15, 8)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (16, CAST(N'2024-11-24' AS Date), 6, 4)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (17, CAST(N'2024-01-27' AS Date), 14, 17)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (18, CAST(N'2024-03-04' AS Date), 11, 2)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (19, CAST(N'2024-04-21' AS Date), 6, 1)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (20, CAST(N'2024-01-14' AS Date), 9, 15)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (21, CAST(N'2024-02-03' AS Date), 7, 3)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (22, CAST(N'2024-07-21' AS Date), 7, 5)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (23, CAST(N'2024-07-31' AS Date), 11, 9)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (24, CAST(N'2024-07-09' AS Date), 2, 6)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (25, CAST(N'2024-02-06' AS Date), 7, 15)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (26, CAST(N'2024-04-13' AS Date), 5, 6)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (27, CAST(N'2024-09-02' AS Date), 15, 3)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (28, CAST(N'2024-11-04' AS Date), 12, 16)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (29, CAST(N'2024-03-18' AS Date), 7, 14)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (30, CAST(N'2024-12-20' AS Date), 14, 10)
INSERT [dbo].[Lectures] ([Id], [LectureDate], [SubjectId], [TeacherId]) VALUES (31, CAST(N'2024-05-03' AS Date), 15, 6)
SET IDENTITY_INSERT [dbo].[Lectures] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (1, N'Lian', N'Giacaponi', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (2, N'Keeley', N'Cramp', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (3, N'Pen', N'Joinsey', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (4, N'Astrix', N'Einchcombe', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (5, N'Alethea', N'Fairpo', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (6, N'Quint', N'Orringe', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (7, N'Rorie', N'Janota', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (8, N'Georgie', N'Nowlan', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (9, N'Symon', N'Wolstencroft', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (10, N'Corey', N'Droghan', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (11, N'Yolande', N'Lindmark', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (12, N'Kimberly', N'Wilshire', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (13, N'Javier', N'Utton', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (14, N'Laney', N'Breeds', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (15, N'Merrie', N'Addington', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (16, N'Barri', N'Vreede', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (17, N'Manfred', N'Lindenberg', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (18, N'Emerson', N'Arsnell', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (19, N'Kassie', N'Trimble', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (20, N'Kaleena', N'Mandres', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (21, N'Austen', N'Dable', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (22, N'Justine', N'Orford', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (23, N'Stephie', N'Haselgrove', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (24, N'Malvin', N'Yuryaev', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (25, N'Fulvia', N'Van der Baaren', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (26, N'Alli', N'Bladon', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (27, N'Nathan', N'Dyshart', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (28, N'Ysabel', N'Tanti', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (29, N'Natalina', N'Hutcheon', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (30, N'Kira', N'Marflitt', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (31, N'Fonzie', N'Glide', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (32, N'Devin', N'Fazzioli', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (33, N'Pierrette', N'Amber', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (34, N'Krisha', N'Dani', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (35, N'Vale', N'Yglesia', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (36, N'Roxie', N'Merrill', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (37, N'Odessa', N'Dedney', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (38, N'Shae', N'Simmonett', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (39, N'Adler', N'Gascoyen', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (40, N'Myrah', N'Carslake', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (41, N'Jolynn', N'Loughead', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (42, N'Shea', N'Clewer', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (43, N'Marris', N'Sandercock', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (44, N'Savina', N'Say', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (45, N'Burgess', N'Elcy', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (46, N'Sancho', N'Manchett', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (47, N'Serene', N'Dilland', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (48, N'Stephani', N'Fiddymont', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (49, N'Annice', N'McFee', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (50, N'Dall', N'Johann', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (51, N'Hanna', N'Mulrooney', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (52, N'Peyton', N'Roycraft', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (53, N'Kimberlee', N'Ettritch', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (54, N'Shirlee', N'Hebard', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (55, N'Hartley', N'Ponder', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (56, N'Marj', N'Letty', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (57, N'Thia', N'Wickmann', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (58, N'Trumaine', N'Balloch', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (59, N'Pauli', N'Perris', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (60, N'Smitty', N'Akers', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (61, N'Billi', N'Leppard', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (62, N'Kiley', N'Ciobotaro', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (63, N'Nina', N'Klaaassen', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (64, N'Warner', N'Janiak', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (65, N'Victor', N'Radborn', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (66, N'Mureil', N'Ashfold', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (67, N'Samara', N'Perrins', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (68, N'Arthur', N'Crambie', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (69, N'Didi', N'Torra', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (70, N'Riley', N'Caukill', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (71, N'Zelda', N'Pennaman', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (72, N'Fredra', N'Keepe', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (73, N'Hasty', N'Zettoi', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (74, N'Farica', N'Pidgeon', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (75, N'Yancey', N'Bodiam', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (76, N'Kari', N'Shiel', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (77, N'Rosette', N'Wavell', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (78, N'Keane', N'Capitano', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (79, N'Dorella', N'Le Sarr', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (80, N'Devlen', N'Woodvine', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (81, N'Des', N'Harman', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (82, N'Idelle', N'Poyner', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (83, N'Cymbre', N'Colthurst', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (84, N'Belia', N'Kain', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (85, N'Myca', N'Stone', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (86, N'Ferd', N'Goldstraw', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (87, N'Meridel', N'Sirl', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (88, N'Doyle', N'Olyonov', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (89, N'Francesco', N'Fannon', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (90, N'Mikael', N'Santacrole', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (91, N'Bonni', N'Aim', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (92, N'Wini', N'Wollaston', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (93, N'Ceciley', N'Smidmor', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (94, N'Cordelie', N'Abbotts', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (95, N'Aveline', N'Emmett', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (96, N'Christabel', N'Snookes', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (97, N'Jaquith', N'Gadd', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (98, N'Vick', N'Lowde', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (99, N'Price', N'Cheshir', 2)
GO
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (100, N'Lula', N'Sprigings', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (101, N'Aurea', N'Nusche', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (102, N'Dunn', N'Felten', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (103, N'Willie', N'Cakes', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (104, N'Sherill', N'Jickles', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (105, N'Bank', N'Benfell', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (106, N'Wildon', N'Penhaligon', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (107, N'Merna', N'Stansfield', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (108, N'Norton', N'Bothbie', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (109, N'Tuesday', N'Fynes', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (110, N'Tonia', N'Lamzed', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (111, N'Sophi', N'Curnick', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (112, N'Pinchas', N'Dafydd', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (113, N'Jase', N'Jeacock', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (114, N'Zebedee', N'Trippick', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (115, N'Jonas', N'Mouncey', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (116, N'Angie', N'Purrington', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (117, N'Terri', N'MacKey', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (118, N'Braden', N'Avent', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (119, N'Perice', N'Tozer', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (120, N'Ellsworth', N'Boughey', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (121, N'Ina', N'Hatch', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (122, N'Irvin', N'Tyt', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (123, N'Templeton', N'Mahood', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (124, N'Angelico', N'Hazeup', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (125, N'Iggy', N'Abry', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (126, N'Rory', N'Bolan', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (127, N'Mara', N'Grealey', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (128, N'Clayborne', N'Scryne', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (129, N'Faydra', N'Paradin', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (130, N'Priscella', N'Breckwell', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (131, N'Flora', N'Reyes', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (132, N'Risa', N'Shard', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (133, N'Twyla', N'Predohl', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (134, N'Gertie', N'Neame', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (135, N'Miltie', N'Jasiak', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (136, N'Carmelina', N'Sickamore', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (137, N'Kimberly', N'Ginnety', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (138, N'Igor', N'Valsler', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (139, N'Rosamund', N'Spedroni', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (140, N'Terrill', N'MacEntee', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (141, N'Rosina', N'Golda', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (142, N'Coleman', N'Drable', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (143, N'Lorrin', N'Filyaev', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (144, N'Towney', N'Mowles', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (145, N'Kerrill', N'Nulty', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (146, N'Douglas', N'Sarsons', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (147, N'Malinda', N'Oddy', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (148, N'Karol', N'Kolakowski', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (149, N'Lammond', N'Janc', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (150, N'Joelie', N'Flegg', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (151, N'Jacqueline', N'McGarry', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (152, N'Benito', N'Alldis', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (153, N'Anett', N'Peers', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (154, N'Byrle', N'Godard', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (155, N'Beryle', N'Bernhard', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (156, N'Clementine', N'Breedy', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (157, N'Marina', N'Esson', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (158, N'Myrna', N'Corbitt', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (159, N'Corilla', N'Salling', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (160, N'Julian', N'Whatman', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (161, N'Reginauld', N'Castenda', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (162, N'Benetta', N'Bracci', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (163, N'Charles', N'Di Biagio', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (164, N'Alejandrina', N'Durber', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (165, N'Phedra', N'Garbutt', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (166, N'Pru', N'Kenaway', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (167, N'Eb', N'Gaskarth', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (168, N'Michaella', N'Allom', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (169, N'Lorianna', N'Towsey', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (170, N'Kristi', N'Kilner', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (171, N'Dorothee', N'Flew', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (172, N'Janetta', N'Pouton', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (173, N'Marylinda', N'Willoughby', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (174, N'Jerrie', N'Donnel', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (175, N'Tremaine', N'Rigby', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (176, N'Merv', N'Hammerstone', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (177, N'Kelsey', N'Boughtwood', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (178, N'Humbert', N'Spratley', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (179, N'Trstram', N'Cathrall', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (180, N'Barbabra', N'Rapley', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (181, N'Panchito', N'Jobson', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (182, N'Rosabel', N'Connett', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (183, N'Emlyn', N'Horning', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (184, N'Amata', N'Abendroth', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (185, N'Larisa', N'Stuffins', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (186, N'Paulita', N'Liddicoat', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (187, N'Maible', N'Ever', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (188, N'Richie', N'Kings', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (189, N'Babbette', N'Burdon', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (190, N'Ellette', N'Townson', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (191, N'Lucia', N'Caulfield', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (192, N'Cully', N'Brothwell', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (193, N'Clementine', N'Clemett', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (194, N'Derward', N'Iacovini', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (195, N'Nevile', N'Sanpher', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (196, N'Artair', N'Madine', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (197, N'Kara-lynn', N'Holyard', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (198, N'Billi', N'Sambedge', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (199, N'Nata', N'Dyson', 4)
GO
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (200, N'Lindsay', N'Crangle', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (201, N'Ferrel', N'Gilstoun', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (202, N'Matilda', N'Sedman', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (203, N'Michel', N'Jones', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (204, N'Wendel', N'Gregolin', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (205, N'Oliver', N'Armand', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (206, N'Elga', N'Truman', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (207, N'Gabriell', N'Orviss', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (208, N'Hailee', N'Wallach', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (209, N'Lina', N'Vuitte', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (210, N'Temple', N'Blayd', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (211, N'Erny', N'D''Agostino', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (212, N'Kleon', N'O'' Driscoll', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (213, N'Aron', N'Doige', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (214, N'Kailey', N'Jantet', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (215, N'Shannen', N'Gammill', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (216, N'Mill', N'Bonnier', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (217, N'Madlen', N'Longrigg', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (218, N'Faunie', N'Barizeret', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (219, N'Jonas', N'Cosbee', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (220, N'George', N'Glen', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (221, N'Salome', N'Milne', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (222, N'Tadeo', N'Pilbeam', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (223, N'Andre', N'Daugherty', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (224, N'Nicoline', N'Perri', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (225, N'Wenona', N'Fortnon', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (226, N'Agatha', N'Meletti', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (227, N'Gregorius', N'Bauduin', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (228, N'Tabina', N'Hardiman', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (229, N'Colette', N'Eilhermann', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (230, N'Matteo', N'Cello', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (231, N'Ario', N'Morrowe', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (232, N'Gwenore', N'Varley', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (233, N'Roscoe', N'Jorczyk', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (234, N'Ardine', N'Breadmore', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (235, N'Nevin', N'Esselen', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (236, N'Silvanus', N'Hannabus', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (237, N'Polly', N'Mathes', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (238, N'Derby', N'Joplin', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (239, N'Auberta', N'Tyt', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (240, N'Fredra', N'Symcoxe', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (241, N'Shadow', N'Vasishchev', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (242, N'Georgianne', N'Barltrop', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (243, N'Leonanie', N'Pirrey', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (244, N'Ferguson', N'Dowsing', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (245, N'Tabor', N'Hundy', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (246, N'Reinaldos', N'Stinchcombe', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (247, N'Michail', N'Crichley', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (248, N'Tabitha', N'Lebbon', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (249, N'Scott', N'Davenell', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (250, N'Linoel', N'Egle', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (251, N'Raynard', N'Flanders', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (252, N'Reynolds', N'Beckhurst', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (253, N'Stevana', N'Simcoe', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (254, N'Kirby', N'Thoday', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (255, N'Sunshine', N'Clissell', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (256, N'Whitney', N'Clemencon', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (257, N'Alphonse', N'Jone', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (258, N'Homere', N'Faithfull', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (259, N'Gonzalo', N'Bondy', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (260, N'Beau', N'MacDowal', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (261, N'Evan', N'Van den Bosch', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (262, N'Teddie', N'Perrinchief', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (263, N'Linnell', N'Bissell', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (264, N'Lamont', N'Caisley', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (265, N'Alan', N'Searchwell', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (266, N'Eva', N'Pope', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (267, N'Maegan', N'Pennycock', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (268, N'Jacquelynn', N'Antuk', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (269, N'Suzette', N'Attoe', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (270, N'Ardis', N'Eslemont', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (271, N'Culver', N'Gommey', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (272, N'Tim', N'De Angelis', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (273, N'Veradis', N'Aldhous', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (274, N'Correy', N'Farguhar', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (275, N'Olga', N'Cestard', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (276, N'Ahmad', N'McAuslene', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (277, N'Melisenda', N'Bonnett', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (278, N'Mahalia', N'Brobyn', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (279, N'Cullie', N'Purdom', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (280, N'Ky', N'Braiden', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (281, N'Saundra', N'Jarrett', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (282, N'Goran', N'Gretton', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (283, N'Franchot', N'Tomankowski', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (284, N'Jordain', N'Tremblet', 0)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (285, N'Heather', N'Dymick', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (286, N'Lindsay', N'Turn', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (287, N'Ilaire', N'Owthwaite', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (288, N'Leonard', N'McCallion', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (289, N'Moyna', N'Normabell', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (290, N'Sheridan', N'Shutt', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (291, N'Lind', N'Braycotton', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (292, N'Fred', N'Sandbrook', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (293, N'Dalt', N'Randell', 5)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (294, N'Julianna', N'Calley', 1)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (295, N'Vito', N'Olech', 3)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (296, N'Evey', N'Oke', 4)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (297, N'Reginald', N'Keane', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (298, N'Horst', N'Palfery', 2)
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (299, N'Elton', N'Fassam', 5)
GO
INSERT [dbo].[Students] ([Id], [StudentName], [StudentSurname], [Rating]) VALUES (300, N'Sissie', N'Shepland', 5)
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (1, N'Smartphones')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (2, N'OS X')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (3, N'Team Leadership')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (4, N'Vector NTI')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (5, N'VJ')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (6, N'Eclipse')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (7, N'Food Processing')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (8, N'EOS')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (9, N'Data Mining')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (10, N'Beverage Industry')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (11, N'Twitter Marketing')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (12, N'iBatis')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (13, N'Google Analytics')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (14, N'HTML Scripting')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (15, N'SRT')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (16, N'HTML5')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (17, N'Loan Servicing')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (18, N'Electronic Payments')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (19, N'Mental Health')
INSERT [dbo].[Subjects] ([Id], [SubjectName]) VALUES (20, N'VGA')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (1, N'Jedidiah', N'Keijser', 0, 80606.2700)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (2, N'Janna', N'Antonchik', 0, 52843.0500)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (3, N'Linda', N'Fripp', 0, 38764.9100)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (4, N'Willis', N'Folshom', 1, 98243.2600)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (5, N'Bambi', N'Craster', 1, 56621.0500)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (6, N'Suzann', N'Speddin', 1, 99739.0200)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (7, N'Annis', N'Braunds', 1, 93637.6200)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (8, N'Kelcie', N'O''Lenane', 0, 62254.1500)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (9, N'Gwenni', N'Robbel', 1, 78361.7400)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (10, N'Lazarus', N'Jancy', 1, 84105.2900)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (11, N'Arielle', N'Sharpless', 1, 44409.9300)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (12, N'Elberta', N'Uglow', 1, 36209.4200)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (13, N'Carmencita', N'Gooda', 0, 73728.2200)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (14, N'Sukey', N'Crocetto', 1, 80620.3900)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (15, N'Linn', N'Perico', 0, 29667.2500)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (16, N'Vitoria', N'Quigley', 0, 53962.6400)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (17, N'Berny', N'Fairchild', 1, 81966.9800)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (18, N'Corbin', N'Droghan', 0, 94159.8300)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (19, N'Rosella', N'Hawkin', 0, 84714.7200)
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname], [IsProfessor], [Salary]) VALUES (20, N'Wilbur', N'Wooldridge', 0, 91082.7900)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ('0') FOR [IsProfessor]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([Id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[GroupsCurators]  WITH CHECK ADD FOREIGN KEY([CuratorId])
REFERENCES [dbo].[Curators] ([Id])
GO
ALTER TABLE [dbo].[GroupsCurators]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectures]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectures]  WITH CHECK ADD FOREIGN KEY([LectureId])
REFERENCES [dbo].[Lectures] ([Id])
GO
ALTER TABLE [dbo].[GroupsStudents]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupsStudents]  WITH CHECK ADD FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD CHECK  (([Building]>=(1) AND [Building]<=(5)))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([GroupYear]>=(1) AND [GroupYear]<=(5)))
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD CHECK  (([Rating]>=(0) AND [Rating]<=(5)))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Salary]>(0)))
GO
USE [master]
GO
ALTER DATABASE [Academy2] SET  READ_WRITE 
GO
