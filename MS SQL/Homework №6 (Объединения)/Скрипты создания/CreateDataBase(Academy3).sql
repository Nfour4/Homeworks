USE [master]
GO
/****** Object:  Database [Academy3]    Script Date: 03.11.2024 18:08:29 ******/
CREATE DATABASE [Academy3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Academy3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Academy3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Academy3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Academy3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Academy3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Academy3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Academy3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Academy3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Academy3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Academy3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Academy3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Academy3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Academy3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Academy3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Academy3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Academy3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Academy3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Academy3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Academy3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Academy3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Academy3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Academy3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Academy3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Academy3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Academy3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Academy3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Academy3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Academy3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Academy3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Academy3] SET  MULTI_USER 
GO
ALTER DATABASE [Academy3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Academy3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Academy3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Academy3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Academy3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Academy3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Academy3] SET QUERY_STORE = ON
GO
ALTER DATABASE [Academy3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Academy3]
GO
/****** Object:  Table [dbo].[Assistants]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assistants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curators]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deans]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Building] [int] NULL,
	[DName] [nvarchar](100) NOT NULL,
	[FacultyId] [int] NOT NULL,
	[HeadId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Building] [int] NOT NULL,
	[FName] [nvarchar](100) NOT NULL,
	[DeanId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](10) NOT NULL,
	[GYear] [int] NOT NULL,
	[DepartmrntId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsCurators]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsCurators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CuratorId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsLectures]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsLectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[LectureId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Heads]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Heads](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LectureRooms]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LectureRooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Building] [int] NULL,
	[Name] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Class] [int] NOT NULL,
	[SDayOFWeek] [int] NOT NULL,
	[SWeek] [int] NOT NULL,
	[LectureId] [int] NOT NULL,
	[LectureRoomId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 03.11.2024 18:08:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [nvarchar](max) NOT NULL,
	[TeacherSurname] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assistants] ON 

INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (1, 1)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (2, 2)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (3, 3)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (4, 4)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (5, 5)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (6, 6)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (7, 7)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (8, 8)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (9, 9)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (10, 10)
SET IDENTITY_INSERT [dbo].[Assistants] OFF
GO
SET IDENTITY_INSERT [dbo].[Curators] ON 

INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (1, 11)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (2, 12)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (3, 13)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (4, 14)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (5, 15)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (6, 16)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (7, 17)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (8, 18)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (9, 19)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (10, 20)
SET IDENTITY_INSERT [dbo].[Curators] OFF
GO
SET IDENTITY_INSERT [dbo].[Deans] ON 

INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (1, 21)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (2, 22)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (3, 23)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (4, 24)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (5, 25)
SET IDENTITY_INSERT [dbo].[Deans] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (1, 1, N'NationalHistory', 1, 1)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (2, 3, N'General History', 1, 2)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (3, 4, N'Political Science and Law', 1, 3)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (4, 4, N'Museology', 1, 4)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (5, 2, N'Religious studies', 2, 5)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (6, 1, N'Management Psychology', 5, 6)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (7, 4, N'Practical Psychology', 5, 7)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (8, 3, N'Professional Pedagogy', 5, 8)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (9, 5, N'Logic', 2, 9)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (10, 1, N'Philosophy of education', 2, 10)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (11, 3, N'Ethics', 2, 11)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (12, 5, N'Philosophy of Politics and Law', 2, 12)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (13, 1, N'World Economics', 4, 13)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (14, 2, N'Finance and Credit', 4, 14)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (15, 4, N'Statistics', 4, 15)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (16, 1, N'Medical Physics', 3, 16)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (17, 3, N'General Physics', 3, 17)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (18, 4, N'Cosmology Physics', 3, 18)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (19, 1, N'Biological Physics', 3, 19)
INSERT [dbo].[Departments] ([Id], [Building], [DName], [FacultyId], [HeadId]) VALUES (20, 5, N'Theoretical Physics', 3, 20)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([Id], [Building], [FName], [DeanId]) VALUES (1, 2, N'HistoryFaculty', 1)
INSERT [dbo].[Faculties] ([Id], [Building], [FName], [DeanId]) VALUES (2, 3, N'PhilosophyFaculty', 2)
INSERT [dbo].[Faculties] ([Id], [Building], [FName], [DeanId]) VALUES (3, 1, N'PhysicsFaculty', 3)
INSERT [dbo].[Faculties] ([Id], [Building], [FName], [DeanId]) VALUES (4, 5, N'EconomyFaculty', 4)
INSERT [dbo].[Faculties] ([Id], [Building], [FName], [DeanId]) VALUES (5, 4, N'PsicologicalFaculty', 5)
SET IDENTITY_INSERT [dbo].[Faculties] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (103, N'NH1', 1, 1)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (104, N'NH2', 2, 1)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (105, N'NH3', 5, 1)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (106, N'GH1', 3, 2)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (107, N'GH2', 2, 2)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (108, N'GH3', 3, 2)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (109, N'PSL1', 5, 3)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (110, N'PSL2', 4, 3)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (111, N'PSL3', 1, 3)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (112, N'MUS1', 1, 4)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (113, N'MUS2', 2, 4)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (114, N'MUS3', 2, 4)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (115, N'RS1', 3, 5)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (116, N'RS2', 3, 5)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (117, N'RS3', 1, 5)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (118, N'MP1', 2, 6)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (119, N'MP2', 3, 6)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (120, N'MP3', 4, 6)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (121, N'PRPS1', 1, 7)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (122, N'PRPS2', 5, 7)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (123, N'PRPS3', 5, 7)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (124, N'PRPE1', 2, 8)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (125, N'PRPE2', 2, 8)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (126, N'PRPE3', 4, 8)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (127, N'LOG1', 2, 9)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (128, N'LOG2', 3, 9)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (129, N'LOG3', 3, 9)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (130, N'POE1', 1, 10)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (131, N'POE2', 1, 10)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (132, N'POE3', 5, 10)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (133, N'ETH1', 3, 11)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (134, N'ETH2', 4, 11)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (135, N'ETH3', 1, 11)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (136, N'PPL1', 2, 12)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (137, N'PPL2', 1, 12)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (138, N'PPL3', 3, 12)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (139, N'WE1', 3, 13)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (140, N'WE2', 5, 13)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (141, N'WE3', 4, 13)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (142, N'FAC1', 2, 14)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (143, N'FAC2', 4, 14)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (144, N'FAC3', 1, 14)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (145, N'ST1', 4, 15)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (146, N'ST2', 3, 15)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (147, N'ST3', 2, 15)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (148, N'MPh1', 4, 16)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (149, N'MPh2', 3, 16)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (150, N'MPh3', 1, 16)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (151, N'GP1', 2, 17)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (152, N'GP2', 3, 17)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (153, N'GP3', 3, 17)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (154, N'CP1', 4, 18)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (155, N'CP2', 5, 18)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (156, N'CP3', 2, 18)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (157, N'BP1', 5, 19)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (158, N'BP2', 1, 19)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (159, N'BP3', 3, 19)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (160, N'TP1', 4, 20)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (161, N'TP2', 1, 20)
INSERT [dbo].[Groups] ([Id], [GroupName], [GYear], [DepartmrntId]) VALUES (162, N'TP3', 3, 20)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsCurators] ON 

INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (1, 3, 103)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (2, 2, 104)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (3, 7, 105)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (4, 5, 106)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (5, 9, 107)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (6, 5, 108)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (7, 3, 109)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (8, 8, 110)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (9, 10, 111)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (10, 3, 112)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (11, 1, 113)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (12, 2, 114)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (13, 6, 115)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (14, 10, 116)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (15, 1, 117)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (16, 10, 118)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (17, 3, 119)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (18, 1, 120)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (19, 1, 121)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (20, 7, 122)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (21, 7, 123)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (22, 3, 124)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (23, 6, 125)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (24, 5, 126)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (25, 8, 127)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (26, 3, 128)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (27, 9, 129)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (28, 3, 130)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (29, 2, 131)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (30, 2, 132)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (31, 5, 133)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (32, 5, 134)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (33, 3, 135)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (34, 4, 136)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (35, 9, 137)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (36, 3, 138)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (37, 3, 139)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (38, 9, 140)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (39, 2, 141)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (40, 3, 142)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (41, 5, 143)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (42, 2, 144)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (43, 2, 145)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (44, 3, 146)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (45, 7, 147)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (46, 1, 148)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (47, 9, 149)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (48, 9, 150)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (49, 9, 151)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (50, 3, 152)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (51, 2, 153)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (52, 1, 154)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (53, 2, 155)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (54, 5, 156)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (55, 10, 157)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (56, 8, 158)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (57, 4, 159)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (58, 7, 160)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (59, 1, 161)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (60, 1, 162)
SET IDENTITY_INSERT [dbo].[GroupsCurators] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsLectures] ON 

INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (1, 154, 28)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (2, 160, 32)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (3, 134, 17)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (4, 132, 7)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (5, 103, 28)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (6, 129, 21)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (7, 154, 28)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (8, 157, 1)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (9, 140, 8)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (10, 127, 41)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (11, 112, 18)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (12, 147, 14)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (13, 104, 36)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (14, 145, 28)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (15, 137, 19)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (16, 154, 46)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (17, 111, 31)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (18, 113, 11)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (19, 127, 34)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (20, 142, 33)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (21, 145, 30)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (22, 149, 14)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (23, 112, 40)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (24, 103, 49)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (25, 147, 46)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (26, 159, 17)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (27, 132, 48)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (28, 140, 13)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (29, 143, 42)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (30, 139, 5)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (31, 103, 44)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (32, 162, 33)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (33, 150, 41)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (34, 160, 13)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (35, 115, 27)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (36, 134, 35)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (37, 133, 2)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (38, 134, 31)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (39, 147, 11)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (40, 160, 12)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (41, 160, 50)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (42, 162, 46)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (43, 138, 21)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (44, 105, 46)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (45, 119, 18)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (46, 134, 8)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (47, 122, 6)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (48, 128, 44)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (49, 107, 21)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (50, 150, 34)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (51, 147, 17)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (52, 155, 15)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (53, 155, 18)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (54, 154, 7)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (55, 122, 37)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (56, 158, 38)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (57, 152, 44)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (58, 120, 50)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (59, 134, 41)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (60, 103, 18)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (61, 128, 20)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (62, 155, 8)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (63, 118, 40)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (64, 154, 39)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (65, 130, 11)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (66, 119, 20)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (67, 118, 43)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (68, 113, 46)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (69, 131, 45)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (70, 105, 35)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (71, 133, 9)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (72, 155, 50)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (73, 156, 33)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (74, 125, 50)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (75, 111, 35)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (76, 140, 38)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (77, 104, 22)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (78, 130, 41)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (79, 132, 18)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (80, 146, 49)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (81, 135, 40)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (82, 159, 5)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (83, 149, 21)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (84, 128, 2)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (85, 120, 11)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (86, 134, 22)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (87, 140, 42)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (88, 142, 43)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (89, 103, 11)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (90, 145, 10)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (91, 143, 34)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (92, 123, 27)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (93, 130, 41)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (94, 159, 32)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (95, 109, 5)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (96, 119, 43)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (97, 108, 19)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (98, 111, 17)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (99, 104, 27)
GO
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (100, 139, 33)
SET IDENTITY_INSERT [dbo].[GroupsLectures] OFF
GO
SET IDENTITY_INSERT [dbo].[Heads] ON 

INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (1, 26)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (2, 27)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (3, 28)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (4, 29)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (5, 30)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (6, 31)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (7, 32)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (8, 33)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (9, 34)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (10, 35)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (11, 36)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (12, 37)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (13, 38)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (14, 39)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (15, 40)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (16, 41)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (17, 42)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (18, 43)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (19, 44)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (20, 45)
SET IDENTITY_INSERT [dbo].[Heads] OFF
GO
SET IDENTITY_INSERT [dbo].[LectureRooms] ON 

INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (1, 5, N'Room1')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (2, 2, N'Room2')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (3, 3, N'Room3')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (4, 1, N'Room4')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (5, 4, N'Room5')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (6, 1, N'Room6')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (7, 2, N'Room7')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (8, 1, N'Room8')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (9, 1, N'Room9')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (10, 4, N'Room10')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (11, 4, N'Room11')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (12, 1, N'Room12')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (13, 4, N'Room13')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (14, 3, N'Room14')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (15, 2, N'Room15')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (16, 2, N'Room16')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (17, 5, N'Room17')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (18, 1, N'Room18')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (19, 5, N'Room19')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (20, 1, N'Room20')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (21, 4, N'Room21')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (22, 4, N'Room22')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (23, 2, N'Room23')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (24, 3, N'Room24')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (25, 3, N'Room25')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (26, 4, N'Room26')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (27, 3, N'Room27')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (28, 3, N'Room28')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (29, 2, N'Room29')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (30, 1, N'Room30')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (31, 4, N'Room31')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (32, 2, N'Room32')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (33, 5, N'Room33')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (34, 3, N'Room34')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (35, 4, N'Room35')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (36, 5, N'Room36')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (37, 2, N'Room37')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (38, 2, N'Room38')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (39, 2, N'Room39')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (40, 3, N'Room40')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (41, 2, N'Room41')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (42, 5, N'Room42')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (43, 3, N'Room43')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (44, 5, N'Room44')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (45, 3, N'Room45')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (46, 3, N'Room46')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (47, 1, N'Room47')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (48, 3, N'Room48')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (49, 4, N'Room49')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (50, 2, N'Room50')
SET IDENTITY_INSERT [dbo].[LectureRooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Lectures] ON 

INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (1, 5, 43)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (2, 2, 13)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (3, 19, 10)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (4, 18, 34)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (5, 4, 39)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (6, 7, 42)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (7, 12, 43)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (8, 7, 45)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (9, 15, 26)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (10, 8, 15)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (11, 3, 43)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (12, 19, 40)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (13, 2, 17)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (14, 19, 1)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (15, 5, 30)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (16, 4, 18)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (17, 3, 13)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (18, 20, 21)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (19, 3, 10)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (20, 1, 36)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (21, 15, 29)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (22, 20, 14)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (23, 13, 13)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (24, 3, 45)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (25, 10, 10)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (26, 18, 29)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (27, 6, 15)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (28, 17, 16)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (29, 13, 7)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (30, 16, 12)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (31, 10, 18)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (32, 7, 31)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (33, 4, 6)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (34, 8, 28)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (35, 4, 39)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (36, 16, 36)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (37, 4, 39)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (38, 15, 19)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (39, 4, 37)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (40, 12, 44)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (41, 15, 35)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (42, 17, 45)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (43, 3, 33)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (44, 8, 20)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (45, 9, 4)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (46, 16, 28)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (47, 2, 26)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (48, 1, 4)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (49, 13, 23)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (50, 19, 44)
SET IDENTITY_INSERT [dbo].[Lectures] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (1, 2, 5, 16, 11, 21)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (2, 2, 5, 46, 39, 47)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (3, 7, 5, 43, 16, 14)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (4, 7, 1, 5, 8, 24)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (5, 7, 7, 50, 19, 43)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (6, 6, 2, 25, 14, 22)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (7, 2, 4, 31, 2, 36)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (8, 6, 1, 48, 38, 14)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (9, 5, 5, 35, 38, 35)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (10, 3, 4, 11, 26, 41)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (11, 2, 7, 5, 43, 4)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (12, 8, 7, 45, 20, 4)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (13, 1, 3, 28, 11, 38)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (14, 4, 7, 14, 3, 6)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (15, 7, 1, 29, 39, 50)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (16, 2, 4, 30, 22, 5)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (17, 4, 2, 42, 5, 37)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (18, 2, 7, 49, 20, 2)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (19, 1, 6, 48, 14, 40)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (20, 7, 5, 44, 44, 27)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (21, 8, 2, 23, 22, 36)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (22, 1, 4, 40, 44, 12)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (23, 7, 5, 46, 8, 41)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (24, 2, 3, 10, 27, 48)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (25, 6, 2, 27, 15, 7)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (26, 3, 7, 15, 17, 22)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (27, 4, 7, 16, 40, 5)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (28, 5, 7, 49, 44, 37)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (29, 4, 7, 41, 14, 28)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (30, 5, 4, 43, 45, 8)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (31, 8, 4, 45, 37, 38)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (32, 3, 4, 14, 44, 26)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (33, 6, 5, 45, 9, 46)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (34, 5, 2, 44, 19, 27)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (35, 5, 2, 13, 11, 32)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (36, 4, 5, 9, 12, 23)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (37, 3, 2, 27, 22, 27)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (38, 7, 4, 33, 16, 39)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (39, 2, 5, 50, 34, 23)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (40, 5, 4, 50, 1, 33)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (41, 8, 2, 51, 1, 32)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (42, 4, 1, 2, 38, 4)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (43, 4, 7, 39, 49, 34)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (44, 8, 7, 2, 3, 31)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (45, 1, 7, 3, 37, 17)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (46, 6, 5, 34, 39, 1)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (47, 1, 5, 3, 42, 41)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (48, 6, 7, 9, 26, 32)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (49, 6, 5, 29, 31, 28)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (50, 2, 7, 12, 24, 20)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (51, 5, 3, 52, 29, 4)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (52, 4, 7, 33, 44, 41)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (53, 6, 6, 8, 38, 14)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (54, 7, 2, 42, 19, 13)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (55, 3, 3, 38, 27, 31)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (56, 5, 6, 16, 44, 35)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (57, 3, 4, 42, 24, 28)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (58, 2, 7, 26, 22, 45)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (59, 8, 3, 48, 16, 19)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (60, 6, 4, 39, 29, 16)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (61, 3, 2, 46, 19, 25)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (62, 5, 5, 32, 26, 20)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (63, 2, 5, 15, 31, 45)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (64, 8, 2, 19, 1, 28)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (65, 5, 4, 13, 23, 33)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (66, 4, 6, 45, 17, 24)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (67, 5, 4, 4, 12, 49)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (68, 8, 6, 18, 13, 36)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (69, 6, 5, 39, 30, 19)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (70, 3, 4, 17, 48, 45)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (71, 5, 2, 51, 44, 32)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (72, 5, 5, 18, 14, 34)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (73, 2, 5, 4, 10, 22)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (74, 6, 6, 19, 4, 9)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (75, 5, 5, 11, 34, 34)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (76, 3, 3, 44, 12, 46)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (77, 7, 7, 22, 39, 48)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (78, 6, 4, 25, 12, 34)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (79, 8, 5, 20, 47, 9)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (80, 6, 3, 43, 24, 10)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (81, 4, 7, 9, 41, 48)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (82, 2, 7, 34, 35, 49)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (83, 1, 6, 27, 28, 10)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (84, 4, 4, 6, 1, 37)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (85, 6, 6, 22, 33, 2)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (86, 6, 6, 34, 28, 38)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (87, 2, 5, 20, 27, 36)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (88, 4, 2, 34, 42, 19)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (89, 3, 4, 22, 42, 10)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (90, 7, 5, 16, 37, 36)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (91, 7, 3, 26, 8, 19)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (92, 2, 7, 38, 41, 44)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (93, 4, 5, 52, 14, 16)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (94, 6, 5, 33, 16, 17)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (95, 3, 7, 28, 50, 1)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (96, 8, 2, 6, 31, 40)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (97, 8, 4, 52, 19, 44)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (98, 2, 7, 7, 18, 47)
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (99, 7, 6, 15, 30, 46)
GO
INSERT [dbo].[Schedules] ([Id], [Class], [SDayOFWeek], [SWeek], [LectureId], [LectureRoomId]) VALUES (100, 2, 4, 25, 6, 34)
SET IDENTITY_INSERT [dbo].[Schedules] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (10, N'Beverage Industry')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (9, N'Data Mining')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (6, N'Eclipse')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (18, N'Electronic Payments')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (8, N'EOS')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (7, N'Food Processing')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (13, N'Google Analytics')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (14, N'HTML Scripting')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (16, N'HTML5')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (12, N'iBatis')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (17, N'Loan Servicing')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (19, N'Mental Health')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (2, N'OS X')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (1, N'Smartphones')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (15, N'SRT')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (3, N'Team Leadership')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (11, N'Twitter Marketing')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (4, N'Vector NTI')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (20, N'VGA')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (5, N'VJ')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (1, N'Adriana', N'Castanares')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (2, N'Suellen', N'Arnecke')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (3, N'Reinold', N'Siddons')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (4, N'Maddie', N'Moffett')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (5, N'Rachel', N'Simonds')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (6, N'Wernher', N'Ciccarelli')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (7, N'Hill', N'Chadbourne')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (8, N'Sutherland', N'Tilte')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (9, N'Zebadiah', N'Hyams')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (10, N'Codie', N'Facchini')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (11, N'Celle', N'Fury')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (12, N'Montgomery', N'Fermor')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (13, N'Gert', N'O''Kane')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (14, N'Anabal', N'Erasmus')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (15, N'Mirabelle', N'Stubbes')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (16, N'Joyous', N'Blasgen')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (17, N'Bearnard', N'Dulson')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (18, N'Jenda', N'Jeppe')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (19, N'Garrett', N'Tilte')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (20, N'Gordie', N'Greenhalf')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (21, N'Fonsie', N'Maruska')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (22, N'Mead', N'Woodyer')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (23, N'Chet', N'Gerhardt')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (24, N'Shirlene', N'Miebes')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (25, N'Wildon', N'Rainy')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (26, N'Orrin', N'Lillow')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (27, N'Aldis', N'Wortt')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (28, N'Dorthea', N'Orpyne')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (29, N'Sofia', N'Dutch')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (30, N'Ray', N'Poile')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (31, N'Paulie', N'Axelbey')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (32, N'Minnie', N'Brenton')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (33, N'Farica', N'Goneau')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (34, N'Kirstin', N'Mulrooney')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (35, N'Astrid', N'Damsell')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (36, N'Denyse', N'Bousquet')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (37, N'Giordano', N'Wimpenny')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (38, N'Krishna', N'Leftley')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (39, N'Vite', N'Brunsen')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (40, N'Glynis', N'Brearley')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (41, N'Dorie', N'Treby')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (42, N'Kary', N'Mayor')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (43, N'Demetris', N'Bovey')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (44, N'Linnie', N'Martine')
INSERT [dbo].[Teachers] ([Id], [TeacherName], [TeacherSurname]) VALUES (45, N'Sande', N'Luxford')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__48779E0BAE995A7D]    Script Date: 03.11.2024 18:08:30 ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[DName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Facultie__86942634B7D902D4]    Script Date: 03.11.2024 18:08:30 ******/
ALTER TABLE [dbo].[Faculties] ADD UNIQUE NONCLUSTERED 
(
	[FName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Groups__6EFCD434DC7FC6D6]    Script Date: 03.11.2024 18:08:30 ******/
ALTER TABLE [dbo].[Groups] ADD UNIQUE NONCLUSTERED 
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LectureR__737584F64FBE5E0F]    Script Date: 03.11.2024 18:08:30 ******/
ALTER TABLE [dbo].[LectureRooms] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Subjects__737584F65C4770C6]    Script Date: 03.11.2024 18:08:30 ******/
ALTER TABLE [dbo].[Subjects] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departments] ADD  DEFAULT ('DepartmentName') FOR [DName]
GO
ALTER TABLE [dbo].[Faculties] ADD  DEFAULT ('FacultyName') FOR [FName]
GO
ALTER TABLE [dbo].[Groups] ADD  DEFAULT ('GroupName') FOR [GroupName]
GO
ALTER TABLE [dbo].[LectureRooms] ADD  DEFAULT ('LectureRoomName') FOR [Name]
GO
ALTER TABLE [dbo].[Subjects] ADD  DEFAULT ('SubjectName') FOR [Name]
GO
ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ('TeacherName') FOR [TeacherName]
GO
ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ('TeacherSurname') FOR [TeacherSurname]
GO
ALTER TABLE [dbo].[Assistants]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Curators]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Deans]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([Id])
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD FOREIGN KEY([HeadId])
REFERENCES [dbo].[Heads] ([Id])
GO
ALTER TABLE [dbo].[Faculties]  WITH CHECK ADD FOREIGN KEY([DeanId])
REFERENCES [dbo].[Deans] ([Id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([DepartmrntId])
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
ALTER TABLE [dbo].[Heads]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([LectureId])
REFERENCES [dbo].[Lectures] ([Id])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([LectureRoomId])
REFERENCES [dbo].[LectureRooms] ([Id])
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD CHECK  (([Building]>=(1) AND [Building]<=(5)))
GO
ALTER TABLE [dbo].[Faculties]  WITH CHECK ADD CHECK  (([Building]>=(1) AND [Building]<=(5)))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([GYear]>=(1) AND [GYear]<=(5)))
GO
ALTER TABLE [dbo].[LectureRooms]  WITH CHECK ADD CHECK  (([Building]>=(1) AND [Building]<=(5)))
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD CHECK  (([Class]>=(1) AND [Class]<=(8)))
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD CHECK  (([SDayOFWeek]>=(1) AND [SDayOFWeek]<=(7)))
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD CHECK  (([SWeek]>=(1) AND [SWeek]<=(52)))
GO
USE [master]
GO
ALTER DATABASE [Academy3] SET  READ_WRITE 
GO
