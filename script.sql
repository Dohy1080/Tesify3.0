USE [master]
GO
/****** Object:  Database [testify3]    Script Date: 02/04/2025 3:05:55 CH ******/
CREATE DATABASE [testify3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testify3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\testify3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'testify3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\testify3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [testify3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testify3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testify3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testify3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testify3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testify3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testify3] SET ARITHABORT OFF 
GO
ALTER DATABASE [testify3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [testify3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testify3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testify3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testify3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testify3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testify3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testify3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testify3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testify3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [testify3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testify3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testify3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testify3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testify3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testify3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testify3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testify3] SET RECOVERY FULL 
GO
ALTER DATABASE [testify3] SET  MULTI_USER 
GO
ALTER DATABASE [testify3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testify3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [testify3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [testify3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [testify3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [testify3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'testify3', N'ON'
GO
ALTER DATABASE [testify3] SET QUERY_STORE = OFF
GO
USE [testify3]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[ID] [uniqueidentifier] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Incorrect] [bit] NOT NULL,
	[QuestionID] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[TotalStudent] [int] NOT NULL,
	[GradeID] [uniqueidentifier] NULL,
	[StudentID] [uniqueidentifier] NULL,
	[Year] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class_Quiz]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Quiz](
	[ClassID] [uniqueidentifier] NOT NULL,
	[QuizID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [uniqueidentifier] NOT NULL,
	[InParent] [bit] NOT NULL,
	[ParentID] [uniqueidentifier] NULL,
	[AnswerTime] [datetime] NOT NULL,
	[TeacherID] [uniqueidentifier] NULL,
	[StudentID] [uniqueidentifier] NULL,
	[SubjectID] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[ID] [uniqueidentifier] NOT NULL,
	[Context] [nvarchar](max) NOT NULL,
	[Time] [datetime] NOT NULL,
	[StudentID] [uniqueidentifier] NULL,
	[TeacherID] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[ID] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[QuizID] [uniqueidentifier] NULL,
	[TimeLimit] [datetime] NULL,
	[Score] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[ID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[duration] [time](7) NULL,
	[Description] [nvarchar](500) NULL,
	[Deadline] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
	[RoleCode] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Score]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[ID] [uniqueidentifier] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[StudentID] [uniqueidentifier] NULL,
	[QuizID] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Mail] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Image] [nvarchar](255) NULL,
	[FirstLogin] [datetime] NOT NULL,
	[SubjectID] [uniqueidentifier] NULL,
	[StudentCode] [nvarchar](50) NOT NULL,
	[ClassID] [uniqueidentifier] NULL,
	[ClassName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAnswer]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAnswer](
	[StudentID] [uniqueidentifier] NOT NULL,
	[AnswerID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students_Teachers]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students_Teachers](
	[TeacherID] [uniqueidentifier] NOT NULL,
	[StudentID] [uniqueidentifier] NOT NULL,
	[TeacherStudentID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Students_Teachers] PRIMARY KEY CLUSTERED 
(
	[TeacherStudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[SubjectID] [uniqueidentifier] NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Image] [nvarchar](255) NULL,
	[FirstLogin] [datetime] NOT NULL,
	[phoneNumber] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher_Class]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_Class](
	[TeacherID] [uniqueidentifier] NOT NULL,
	[ClassID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC,
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher_Student]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_Student](
	[TeacherID] [uniqueidentifier] NOT NULL,
	[StudentID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Teacher_Student] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 02/04/2025 3:05:55 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'26d8004d-8c42-438e-9fe7-04b0299c30c0', N'China', 0, N'aa4d250d-08c6-471e-908e-a4c622d5c4b0')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'0d037f92-037e-4c12-87bc-1136707b47d0', N'Da Nang', 0, N'0d037f92-037e-4c12-87bc-1136707b47d0')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'8c985ac1-27a0-4a6f-8114-26759c59f4f0', N'Coal', 0, N'cc8cc1b7-d5ea-454e-a5db-cec5719d906a')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'2d0ba1a8-7f89-4f41-8ea4-340e5525ef7f', N'Both A and C', 1, N'3f8c40f6-fada-43bb-a8cb-ddead7433140')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'2684278c-45de-42e0-b638-36088d7cb580', N'Ho Chi Minh City', 0, N'0d037f92-037e-4c12-87bc-1136707b47d0')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'305a608e-5ec0-4c54-82f9-3728254a0d38', N'Hanoi', 1, N'0d037f92-037e-4c12-87bc-1136707b47d0')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'6e236116-5c3f-47d5-ace5-4b38653a56b6', N'Both A and B', 1, N'cc8cc1b7-d5ea-454e-a5db-cec5719d906a')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'bc690986-cec0-429f-a7ae-4d367c621ce5', N'Dispersion', 0, N'3f8c40f6-fada-43bb-a8cb-ddead7433140')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'ffd90268-a5a7-4998-bd4f-53853692b79b', N'Both A and B', 1, N'cc8cc1b7-d5ea-454e-a5db-cec5719d906a')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'1f1b49aa-7666-4682-b9cb-55a0f980642d', N'China', 0, N'aa4d250d-08c6-471e-908e-a4c622d5c4b0')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'227870c1-daf7-441d-9c96-57787554123a', N'Graphite', 0, N'cc8cc1b7-d5ea-454e-a5db-cec5719d906a')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'9911ffff-7870-4a06-894d-582870e52fa7', N'United States', 0, N'aa4d250d-08c6-471e-908e-a4c622d5c4b0')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'bc29fa1b-5b8a-4d9f-ae95-5b48cff27d70', N'Russia', 1, N'aa4d250d-08c6-471e-908e-a4c622d5c4b0')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'dd06370d-9bec-4aa9-8b7b-61095af51cc0', N'Reflection', 0, N'3f8c40f6-fada-43bb-a8cb-ddead7433140')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'2f827763-51f7-4f84-8748-6a729e6e7c46', N'United States', 0, N'aa4d250d-08c6-471e-908e-a4c622d5c4b0')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'9bc9b3d9-60c3-4999-adc2-701e48e85199', N' Nha Trang', 0, N'0d037f92-037e-4c12-87bc-1136707b47d0')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'eca55df0-57f1-430b-bab1-731cd11ff570', N'Tố Hữu', 0, N'fb5403ec-e588-4133-88c8-32a0e2419a30')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'4b0fba4d-07e8-42ce-9b48-768fad317e11', N'Graphite', 0, N'cc8cc1b7-d5ea-454e-a5db-cec5719d906a')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'd4d6d1e6-2955-4610-8fbe-7aa3c7f294d2', N'Both A and C', 1, N'3f8c40f6-fada-43bb-a8cb-ddead7433140')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'b25f223c-dcef-405d-a362-7c3b5d658f68', N'Quang Dũng', 1, N'fb5403ec-e588-4133-88c8-32a0e2419a30')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'4a9d3f5f-2632-4512-b938-848dc2496bd9', N'Refraction', 0, N'3f8c40f6-fada-43bb-a8cb-ddead7433140')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'3a9eef32-3b2e-4091-a51b-8d3c320d0b3f', N'Canada', 0, N'aa4d250d-08c6-471e-908e-a4c622d5c4b0')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'53152333-ac24-4188-b3e5-8dc33c4bc785', N'Coal', 0, N'cc8cc1b7-d5ea-454e-a5db-cec5719d906a')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'ba08ea1d-0226-4c8c-afd3-97d09219f202', N'Reflection', 0, N'3f8c40f6-fada-43bb-a8cb-ddead7433140')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'184de89a-0dc6-45b5-b83f-9e4da96a42d8', N'Canada', 0, N'aa4d250d-08c6-471e-908e-a4c622d5c4b0')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'90a9a4ff-da2f-4662-ba57-a90f4e014a5d', N'Xuân Diệu', 0, N'fb5403ec-e588-4133-88c8-32a0e2419a30')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'3feb95d4-dccb-4dc6-9ab9-b1e5b5b0e8d9', N'Dispersion', 0, N'3f8c40f6-fada-43bb-a8cb-ddead7433140')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'51213eb5-94c9-466d-ace5-b88fbe85f8ea', N'Refraction', 0, N'3f8c40f6-fada-43bb-a8cb-ddead7433140')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'c7269c7b-a239-44be-ad5f-c8eb5ecb17b8', N'Huy Cận', 0, N'fb5403ec-e588-4133-88c8-32a0e2419a30')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'50baa8b4-112a-4c3e-a13e-d387667b978b', N'Mars', 0, N'aa4d250d-08c6-471e-908e-a4c622d5c4b0')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'55e746e6-b5e4-4756-93b9-e1877a9098f7', N'Diamond', 0, N'cc8cc1b7-d5ea-454e-a5db-cec5719d906a')
INSERT [dbo].[Answer] ([ID], [Text], [Incorrect], [QuestionID]) VALUES (N'd081f5f5-c815-4e4c-804b-ff550093ea3f', N'Russia', 1, N'aa4d250d-08c6-471e-908e-a4c622d5c4b0')
GO
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'337f4ff1-38d4-4d47-bb09-0583d33ecacc', N'Class 1A', 34, N'1fc9cb28-217c-4f97-bbd3-132874e05f8e', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'3e2249a2-217d-4cf1-aff2-1981d2a492dd', N'Class 1B', 36, N'1fc9cb28-217c-4f97-bbd3-132874e05f8e', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'0a711335-a426-42c0-934e-285f078dfe26', N'Class 1C', 30, N'1fc9cb28-217c-4f97-bbd3-132874e05f8e', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'f87c483c-b580-4427-8a46-3ffb2ac7c681', N'Class 1D', 29, N'1fc9cb28-217c-4f97-bbd3-132874e05f8e', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'3e63eccc-10c1-49c2-a434-412d4d18f52a', N'Class 2A', 26, N'22f9f94d-d316-4315-93d5-298620649e78', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'6a056894-d2c3-43d2-aeee-42c0deeb7783', N'Class 2B', 23, N'22f9f94d-d316-4315-93d5-298620649e78', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'e4f4821b-9eda-42a1-a30a-50af81594559', N'Class 2C', 20, N'22f9f94d-d316-4315-93d5-298620649e78', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'411dafe0-1c5d-4b65-9a2f-53453f9b5a74', N'Class 2D', 35, N'22f9f94d-d316-4315-93d5-298620649e78', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'0912dc98-18ca-4f0f-8e2a-5c1e1c53849e', N'Class 3A', 22, N'da3e2b3f-7368-48d1-a0ed-3984f6c6b5cd', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'5e84b660-f526-44c3-85ca-5d2c4509c63a', N'Class 3B', 31, N'da3e2b3f-7368-48d1-a0ed-3984f6c6b5cd', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'bfa18a5f-eb35-4e44-8599-700a41983957', N'Class 3C', 22, N'da3e2b3f-7368-48d1-a0ed-3984f6c6b5cd', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'88479bd9-604b-4fe3-b4a4-7c34c7049f6d', N'Class 3D', 30, N'da3e2b3f-7368-48d1-a0ed-3984f6c6b5cd', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'6e80bdb6-8253-48be-a846-9ae52c1c7e90', N'Class 4A', 28, N'a118a4cc-ae28-4058-8be8-63c26a01f34f', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'382dc1d9-fd8f-4947-b80a-9c5bf9509a63', N'Class 4B', 27, N'a118a4cc-ae28-4058-8be8-63c26a01f34f', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'1a7004c2-1f31-4c52-9903-ae0ce000efdc', N'Class 4C', 30, N'a118a4cc-ae28-4058-8be8-63c26a01f34f', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'1843c635-a521-437e-8aef-b83e31aa3c7d', N'Class 4D', 29, N'a118a4cc-ae28-4058-8be8-63c26a01f34f', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'3198cd4b-6fe8-40cb-b7e8-c040ddd1cfd5', N'Class 5A', 25, N'c05062fc-b219-491b-b2d6-8d5c9ea289be', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'ca1772bb-e6d9-447b-840f-c980c4b01055', N'Class 5B', 28, N'c05062fc-b219-491b-b2d6-8d5c9ea289be', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'1d5f1906-ef0a-4206-8fe4-ef6f7eb47527', N'Class 5C', 24, N'c05062fc-b219-491b-b2d6-8d5c9ea289be', NULL, N'2025')
INSERT [dbo].[Class] ([ID], [Name], [TotalStudent], [GradeID], [StudentID], [Year]) VALUES (N'2f279c96-c811-4c11-a428-f0e3c38d4459', N'Class 5D', 32, N'c05062fc-b219-491b-b2d6-8d5c9ea289be', NULL, N'2025')
GO
INSERT [dbo].[Feedback] ([ID], [InParent], [ParentID], [AnswerTime], [TeacherID], [StudentID], [SubjectID]) VALUES (N'136c7e6b-18f8-49f4-8859-04e0f74c9a22', 1, NULL, CAST(N'2025-03-21T10:05:47.080' AS DateTime), N'd30a460b-ff55-446f-8179-7ccf21d45e7a', N'c4c680e8-0f44-45b6-8f65-334fe52c0d71', N'dac2c658-569b-468e-834b-66c5c848ba0b')
INSERT [dbo].[Feedback] ([ID], [InParent], [ParentID], [AnswerTime], [TeacherID], [StudentID], [SubjectID]) VALUES (N'4af1d332-d1af-497c-950b-0ea94551b447', 1, NULL, CAST(N'2025-03-21T10:05:47.080' AS DateTime), N'71bc6fcf-73d8-415e-b255-921e89caa317', N'13dcc272-55bc-4b2b-abe9-4ae019e7cef5', N'1a6855b1-6202-4d13-a788-71a379bebc0b')
INSERT [dbo].[Feedback] ([ID], [InParent], [ParentID], [AnswerTime], [TeacherID], [StudentID], [SubjectID]) VALUES (N'aee3c981-2a55-4598-a4fe-5386c938ec6d', 1, NULL, CAST(N'2025-03-21T10:05:47.080' AS DateTime), N'60f9de47-2ade-4891-b783-4adfddd74b4c', N'560c9d89-2c78-4596-8cfa-165585bf94cf', N'95706071-9614-4b4d-aa7d-2e072af5cf76')
INSERT [dbo].[Feedback] ([ID], [InParent], [ParentID], [AnswerTime], [TeacherID], [StudentID], [SubjectID]) VALUES (N'c562008b-3b45-490a-896c-5418439e4a45', 0, NULL, CAST(N'2025-03-21T10:05:47.080' AS DateTime), N'32238b3d-f414-4672-9619-8f9025702f5e', N'43f03dca-0d18-4fda-82e7-4133a91c071e', N'1a6855b1-6202-4d13-a788-71a379bebc0b')
INSERT [dbo].[Feedback] ([ID], [InParent], [ParentID], [AnswerTime], [TeacherID], [StudentID], [SubjectID]) VALUES (N'74114896-275e-40c2-a330-726e025afc26', 0, NULL, CAST(N'2025-03-21T10:05:47.080' AS DateTime), N'd421d04d-a993-4edf-832b-8a068fb60542', N'592691fb-7f88-46c9-896e-411c79c98a08', N'dac2c658-569b-468e-834b-66c5c848ba0b')
INSERT [dbo].[Feedback] ([ID], [InParent], [ParentID], [AnswerTime], [TeacherID], [StudentID], [SubjectID]) VALUES (N'f2248d48-d198-4f93-a375-78422792112d', 0, NULL, CAST(N'2025-03-21T10:05:47.080' AS DateTime), N'd5295b62-2e8a-481a-af9c-5de6dce35b9b', N'88679e4b-a691-4992-888e-18b2ffb6507a', N'452b9447-3ef4-4dab-81fe-592fa51222e3')
INSERT [dbo].[Feedback] ([ID], [InParent], [ParentID], [AnswerTime], [TeacherID], [StudentID], [SubjectID]) VALUES (N'23e3a9d4-5918-4467-81db-784fca4b1926', 0, NULL, CAST(N'2025-03-21T10:05:47.080' AS DateTime), N'0a262f41-3baf-4430-a6a5-97253b2f95c9', N'7bf750cd-67b8-4eba-af22-5b42323665c5', N'fde72cae-96cd-4d3e-8b9e-f71f9eeff40c')
INSERT [dbo].[Feedback] ([ID], [InParent], [ParentID], [AnswerTime], [TeacherID], [StudentID], [SubjectID]) VALUES (N'dfada43d-3c37-42ce-868d-8587ced9c4d5', 0, NULL, CAST(N'2025-03-21T10:05:47.080' AS DateTime), N'd5295b62-2e8a-481a-af9c-5de6dce35b9b', N'952cf10e-fd12-4ff1-9f11-30ee5674176e', N'452b9447-3ef4-4dab-81fe-592fa51222e3')
INSERT [dbo].[Feedback] ([ID], [InParent], [ParentID], [AnswerTime], [TeacherID], [StudentID], [SubjectID]) VALUES (N'cf9b210c-f018-410a-9b61-90ef3372f7f3', 0, NULL, CAST(N'2025-03-21T10:05:47.080' AS DateTime), N'60f9de47-2ade-4891-b783-4adfddd74b4c', N'd06e870d-526a-4123-a7b5-0726afc8b347', N'95706071-9614-4b4d-aa7d-2e072af5cf76')
INSERT [dbo].[Feedback] ([ID], [InParent], [ParentID], [AnswerTime], [TeacherID], [StudentID], [SubjectID]) VALUES (N'7b69af3d-eb87-4f99-a1b5-f0625fe5d082', 0, NULL, CAST(N'2025-03-21T10:05:47.080' AS DateTime), N'f8f7facb-f580-4da7-ab4b-92448b0d1b52', N'7f4f64be-0e74-4669-9069-5271528681b7', N'fde72cae-96cd-4d3e-8b9e-f71f9eeff40c')
GO
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (N'1fc9cb28-217c-4f97-bbd3-132874e05f8e', N'khoi 1')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (N'22f9f94d-d316-4315-93d5-298620649e78', N'Khoi 2')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (N'da3e2b3f-7368-48d1-a0ed-3984f6c6b5cd', N'Khoi 3')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (N'a118a4cc-ae28-4058-8be8-63c26a01f34f', N'Khoi 4')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (N'c05062fc-b219-491b-b2d6-8d5c9ea289be', N'Khoi 5')
GO
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'707436ba-c616-4aa1-91b9-1202911391dc', N'Notification 4: Upcoming exam on Friday.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'43f03dca-0d18-4fda-82e7-4133a91c071e', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'b276a948-959e-461b-8d95-2440c4c41478', N'Notification 8: Parent-teacher meeting scheduled.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'7a7b8590-7780-47dd-901f-5ea71283a6f6', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'd228ffe3-24b0-434b-a803-3d3c898fd4d6', N'Notification 7: Group project guidelines released.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'7bf750cd-67b8-4eba-af22-5b42323665c5', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'4f191da2-63ec-4f81-9691-40b2fb652f5d', N'Notification 6: New materials have been uploaded.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'7f4f64be-0e74-4669-9069-5271528681b7', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'e92136b4-90c1-480b-b169-43cdbe3ccca1', N'Notification 19: Health and safety training.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'1363bebe-1eb0-47e4-b1ca-e57dcbdef626', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'734d1d08-9625-4e20-bb6f-50aeee84e824', N'Notification 13: Reminder: Library books are due.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'01bd0978-0559-4eca-a8cd-948f1650a54a', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'cd07a6ce-49fc-440e-891d-62dabc12cf1a', N'Notification 9: Extra credit opportunity available.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'465c00c9-1b40-4359-9405-683240b9f58e', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'e1b36dbc-3036-44da-a0a9-892031b92747', N'Notification 18: Scholarship applications open.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'dd856b9f-4166-45b9-a1d3-d891a4fb9905', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'f97ddfc7-7343-4538-9f9e-9d0250dff93a', N'Notification 17: Guest speaker next week.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'35a0db1f-3d89-480d-b299-d774b526add4', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'c2916535-e359-4da6-b022-9f5875ad3620', N'Notification 10: Field trip next month.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'93fb68c8-3659-4bb5-862d-74b31d32123d', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'7ad0fda6-02d9-4d29-8299-a7f665bb2269', N'Notification 14: Club meetings every Monday.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'22483812-1673-402c-916a-9c6b9db23286', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'2daf51f3-56eb-46e5-a40f-d22b145403b2', N'Notification 15: Sports day is approaching!', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'bc1fa14e-4b4b-4211-9a45-c28f7d8216b8', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'ea10d4a8-5786-45bf-8f67-d75846beed9a', N'Notification 12: Check your grades online.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'e683c9e9-1422-40b8-9cd6-8ad39e27c37e', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'08e264fb-3bb2-4a08-b99f-da7105e5f115', N'Notification 20: Feedback on the last project is ready.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'1363bebe-1eb0-47e4-b1ca-e57dcbdef626', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'5f24bb23-fa66-45e7-b7b1-de8f9d647936', N'Notification 3: Class canceled next week.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'c4c680e8-0f44-45b6-8f65-334fe52c0d71', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'9a29c5f1-c367-4b4c-95cd-e603e3b4959b', N'Notification 5: Please check your emails regularly.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'13dcc272-55bc-4b2b-abe9-4ae019e7cef5', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'923bf402-7ee1-46d9-808a-e86b73be5c76', N'Notification 1: Welcome to the class!', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'952cf10e-fd12-4ff1-9f11-30ee5674176e', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'8983a762-06dc-4a30-abb7-f177f6254eea', N'Notification 11: Please submit your projects.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'84dff094-d87b-44f0-9c9c-7efdb5aa3e9b', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'899b264c-5ab5-4ff0-9057-fc746f462c4a', N'Notification 16: New semester starts soon.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'2e447032-4600-495b-8a0c-d11262dd69e9', NULL)
INSERT [dbo].[Notification] ([ID], [Context], [Time], [StudentID], [TeacherID]) VALUES (N'0c873f89-7391-4b0f-8f23-fdff3008fa00', N'Notification 2: Homework is due tomorrow.', CAST(N'2025-03-12T14:34:31.800' AS DateTime), N'c4c680e8-0f44-45b6-8f65-334fe52c0d71', NULL)
GO
INSERT [dbo].[Question] ([ID], [Content], [QuizID], [TimeLimit], [Score]) VALUES (N'0d037f92-037e-4c12-87bc-1136707b47d0', N'What is the capital of Vietnam?', N'7992d529-dd25-4680-b949-12f0450510b3', NULL, N'1')
INSERT [dbo].[Question] ([ID], [Content], [QuizID], [TimeLimit], [Score]) VALUES (N'fb5403ec-e588-4133-88c8-32a0e2419a30', N'Who is the author of the poem "Tây Tiến"?', N'7992d529-dd25-4680-b949-12f0450510b3', NULL, N'1')
INSERT [dbo].[Question] ([ID], [Content], [QuizID], [TimeLimit], [Score]) VALUES (N'aa4d250d-08c6-471e-908e-a4c622d5c4b0', N'Which country has the largest area in the world?', N'7992d529-dd25-4680-b949-12f0450510b3', NULL, N'1')
INSERT [dbo].[Question] ([ID], [Content], [QuizID], [TimeLimit], [Score]) VALUES (N'cc8cc1b7-d5ea-454e-a5db-cec5719d906a', N'Which crystal is known as a form of carbon?', N'7992d529-dd25-4680-b949-12f0450510b3', NULL, N'1')
INSERT [dbo].[Question] ([ID], [Content], [QuizID], [TimeLimit], [Score]) VALUES (N'3f8c40f6-fada-43bb-a8cb-ddead7433140', N'What phenomenon occurs when light passes through a prism?', N'7992d529-dd25-4680-b949-12f0450510b3', NULL, N'1')
GO
INSERT [dbo].[Quiz] ([ID], [Title], [duration], [Description], [Deadline]) VALUES (N'7992d529-dd25-4680-b949-12f0450510b3', N'Quiz 1', CAST(N'00:40:00' AS Time), NULL, NULL)
INSERT [dbo].[Quiz] ([ID], [Title], [duration], [Description], [Deadline]) VALUES (N'3a4e6b2f-6b8e-4e2b-8f3d-1e5c7f9a2e8d', N'Quiz 2', CAST(N'00:55:00' AS Time), NULL, NULL)
INSERT [dbo].[Quiz] ([ID], [Title], [duration], [Description], [Deadline]) VALUES (N'9f2b1a4e-3e4b-4e1c-a5d6-1f2e3c6b7d8e', N'Quiz 3', CAST(N'01:15:00' AS Time), NULL, NULL)
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleCode]) VALUES (N'314d4cb1-5267-4768-a6fc-20578977b948', N'User', N'USER')
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleCode]) VALUES (N'35d7ca33-6080-4318-acc2-aaaf90a70ed9', N'Admin', N'ADMIN')
GO
INSERT [dbo].[Score] ([ID], [StartTime], [EndTime], [Status], [StudentID], [QuizID]) VALUES (N'48331f1e-b2f2-4ce2-8594-cd816fae8147', CAST(N'2025-03-20T11:00:00.000' AS DateTime), CAST(N'2025-03-20T11:45:00.000' AS DateTime), N'In Progress', N'560c9d89-2c78-4596-8cfa-165585bf94cf', N'3a4e6b2f-6b8e-4e2b-8f3d-1e5c7f9a2e8d')
INSERT [dbo].[Score] ([ID], [StartTime], [EndTime], [Status], [StudentID], [QuizID]) VALUES (N'6e536fe3-d236-4f59-b973-d83879c9fdc8', CAST(N'2025-03-20T12:00:00.000' AS DateTime), CAST(N'2025-03-20T12:30:00.000' AS DateTime), N'Not Started', N'88679e4b-a691-4992-888e-18b2ffb6507a', N'9f2b1a4e-3e4b-4e1c-a5d6-1f2e3c6b7d8e')
INSERT [dbo].[Score] ([ID], [StartTime], [EndTime], [Status], [StudentID], [QuizID]) VALUES (N'7ee089f2-5de0-4696-ad6c-fbd7f2135652', CAST(N'2025-03-20T10:00:00.000' AS DateTime), CAST(N'2025-03-20T10:30:00.000' AS DateTime), N'Completed', N'd06e870d-526a-4123-a7b5-0726afc8b347', N'7992d529-dd25-4680-b949-12f0450510b3')
GO
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'd06e870d-526a-4123-a7b5-0726afc8b347', N'Đỗ Thị K', N'Male', N'dothik@example.com', N'0911444555', CAST(N'2000-09-10' AS Date), N'default.png', CAST(N'2025-03-06T08:45:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST010', N'337f4ff1-38d4-4d47-bb09-0583d33ecacc', N'Class 1A')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'560c9d89-2c78-4596-8cfa-165585bf94cf', N'Võ Thị Q', N'Female', N'vothiq@example.com', N'0922777888', CAST(N'2002-02-22' AS Date), N'default.png', CAST(N'2025-03-06T09:15:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST016', N'337f4ff1-38d4-4d47-bb09-0583d33ecacc', N'Class 1A')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'88679e4b-a691-4992-888e-18b2ffb6507a', N'Cao Văn P', N'Male', N'caovanp@example.com', N'0977666888', CAST(N'2003-05-07' AS Date), N'default.png', CAST(N'2025-03-06T09:10:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST015', N'337f4ff1-38d4-4d47-bb09-0583d33ecacc', N'Class 1A')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'952cf10e-fd12-4ff1-9f11-30ee5674176e', N'huy', N'Male', N'huy@gmail.com', N'0123456789', CAST(N'2025-03-11' AS Date), N'string', CAST(N'2025-03-11T07:23:01.880' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'huy01', N'337f4ff1-38d4-4d47-bb09-0583d33ecacc', N'Class 1A')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'c4c680e8-0f44-45b6-8f65-334fe52c0d71', N'Phạm Văn C', N'Male', N'phamvanc@example.com', N'0912345678', CAST(N'2000-11-10' AS Date), N'default.png', CAST(N'2025-03-06T08:10:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST003', N'3e2249a2-217d-4cf1-aff2-1981d2a492dd', N'Class 1B')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'592691fb-7f88-46c9-896e-411c79c98a08', N'Lê Thị D', N'Female', N'lethid@example.com', N'0965432187', CAST(N'2001-07-25' AS Date), N'default.png', CAST(N'2025-03-06T08:15:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST004', N'3e2249a2-217d-4cf1-aff2-1981d2a492dd', N'Class 1B')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'43f03dca-0d18-4fda-82e7-4133a91c071e', N'Lương Thị S', N'Male', N'luongthis@example.com', N'0966555777', CAST(N'2001-11-15' AS Date), N'default.png', CAST(N'2025-03-06T09:25:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST018', N'3e2249a2-217d-4cf1-aff2-1981d2a492dd', N'Class 1B')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'13dcc272-55bc-4b2b-abe9-4ae019e7cef5', N'Hoàng Văn E', N'Male', N'hoangvane@example.com', N'0932111222', CAST(N'2003-02-18' AS Date), N'default.png', CAST(N'2025-03-06T08:20:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST005', N'3e2249a2-217d-4cf1-aff2-1981d2a492dd', N'Class 1B')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'7f4f64be-0e74-4669-9069-5271528681b7', N'Trương Thị O', N'Female', N'truongthio@example.com', N'0933444555', CAST(N'2001-10-05' AS Date), N'default.png', CAST(N'2025-03-06T09:05:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST014', N'0a711335-a426-42c0-934e-285f078dfe26', N'Class 1C')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'7bf750cd-67b8-4eba-af22-5b42323665c5', N'Ngô Văn I', N'Male', N'ngovanii@example.com', N'0922333444', CAST(N'2001-01-21' AS Date), N'default.png', CAST(N'2025-03-06T08:40:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST009', N'0a711335-a426-42c0-934e-285f078dfe26', N'Class 1C')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'7a7b8590-7780-47dd-901f-5ea71283a6f6', N'Châu Văn T', N'Male', N'chauvant@example.com', N'0988222111', CAST(N'2003-01-09' AS Date), N'default.png', CAST(N'2025-03-06T09:30:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST019', N'0a711335-a426-42c0-934e-285f078dfe26', N'Class 1C')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'a62e9a2d-daa7-4a05-9650-64267a2dbed5', N'Do thuy huong ', N'Female', N'huong1234@gmail.com', N'0123456789', CAST(N'2004-03-27' AS Date), N'url', CAST(N'2025-03-27T07:47:55.867' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'hUONG0810', N'0a711335-a426-42c0-934e-285f078dfe26', N'Class 1C')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'465c00c9-1b40-4359-9405-683240b9f58e', N'Nguyễn Văn A', N'Male', N'nguyenvana@example.com', N'0987654321', CAST(N'2001-05-15' AS Date), N'default.png', CAST(N'2025-03-06T08:00:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST001', N'f87c483c-b580-4427-8a46-3ffb2ac7c681', N'Class 1D')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'93fb68c8-3659-4bb5-862d-74b31d32123d', N'Phan Văn L', N'Female', N'phanvanl@example.com', N'0955666777', CAST(N'2003-03-08' AS Date), N'default.png', CAST(N'2025-03-06T08:50:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST011', N'f87c483c-b580-4427-8a46-3ffb2ac7c681', N'Class 1D')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'84dff094-d87b-44f0-9c9c-7efdb5aa3e9b', N'Bùi Thị H', N'Male', N'buithih@example.com', N'0988111222', CAST(N'2002-06-14' AS Date), N'default.png', CAST(N'2025-03-06T08:35:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST008', N'f87c483c-b580-4427-8a46-3ffb2ac7c681', N'Class 1D')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'e683c9e9-1422-40b8-9cd6-8ad39e27c37e', N'Tống Thị M', N'Female', N'tongthim@example.com', N'0944555666', CAST(N'2002-08-29' AS Date), N'default.png', CAST(N'2025-03-06T08:55:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST012', N'f87c483c-b580-4427-8a46-3ffb2ac7c681', N'Class 1D')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'01bd0978-0559-4eca-a8cd-948f1650a54a', N'Vũ Văn G', N'Male', N'vuvang@example.com', N'0909090909', CAST(N'2001-12-05' AS Date), N'default.png', CAST(N'2025-03-06T08:30:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST007', N'f87c483c-b580-4427-8a46-3ffb2ac7c681', N'Class 1D')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'22483812-1673-402c-916a-9c6b9db23286', N'Truong Dan Huy', N'Male', N'danhuy@gmail.com', N'021545414521', CAST(N'2004-01-01' AS Date), N'url', CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'452b9447-3ef4-4dab-81fe-592fa51222e3', N'SE4845', N'3e63eccc-10c1-49c2-a434-412d4d18f52a', N'Class 2A')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'bc1fa14e-4b4b-4211-9a45-c28f7d8216b8', N'Trần Thị B', N'Male', N'tranthib@example.com', N'0978123456', CAST(N'2002-09-20' AS Date), N'default.png', CAST(N'2025-03-06T08:05:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST002', N'3e63eccc-10c1-49c2-a434-412d4d18f52a', N'Class 2A')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'2e447032-4600-495b-8a0c-d11262dd69e9', N'Nguyễn Văn N', N'Male', N'nguyenvann@example.com', N'0911222333', CAST(N'2000-12-12' AS Date), N'default.png', CAST(N'2025-03-06T09:00:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST013', N'3e63eccc-10c1-49c2-a434-412d4d18f52a', N'Class 2A')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'35a0db1f-3d89-480d-b299-d774b526add4', N'Đinh Văn R', N'Female', N'dinhvanr@example.com', N'0903334444', CAST(N'2000-07-30' AS Date), N'default.png', CAST(N'2025-03-06T09:20:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST017', N'3e63eccc-10c1-49c2-a434-412d4d18f52a', N'Class 2A')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'dd856b9f-4166-45b9-a1d3-d891a4fb9905', N'Đặng Thị F', N'Female', N'dangthif@example.com', N'0944333444', CAST(N'2000-04-30' AS Date), N'default.png', CAST(N'2025-03-06T08:25:00.000' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'ST006', N'6a056894-d2c3-43d2-aeee-42c0deeb7783', N'Class 2B')
INSERT [dbo].[Student] ([ID], [Name], [Gender], [Mail], [PhoneNumber], [BirthDate], [Image], [FirstLogin], [SubjectID], [StudentCode], [ClassID], [ClassName]) VALUES (N'1363bebe-1eb0-47e4-b1ca-e57dcbdef626', N'string', N'Male', N'string', N'string', CAST(N'2025-03-07' AS Date), N'string', CAST(N'2025-03-07T03:04:54.140' AS DateTime), N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'string', N'6a056894-d2c3-43d2-aeee-42c0deeb7783', N'Class 2B')
GO
INSERT [dbo].[Subject] ([ID], [Name], [Image]) VALUES (N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'Toán', N'url')
INSERT [dbo].[Subject] ([ID], [Name], [Image]) VALUES (N'452b9447-3ef4-4dab-81fe-592fa51222e3', N'Math', N'url')
INSERT [dbo].[Subject] ([ID], [Name], [Image]) VALUES (N'dac2c658-569b-468e-834b-66c5c848ba0b', N'Anh', N'url')
INSERT [dbo].[Subject] ([ID], [Name], [Image]) VALUES (N'1a6855b1-6202-4d13-a788-71a379bebc0b', N'Ð?a lý', N'url')
INSERT [dbo].[Subject] ([ID], [Name], [Image]) VALUES (N'fde72cae-96cd-4d3e-8b9e-f71f9eeff40c', N'Van', N'url')
INSERT [dbo].[Subject] ([ID], [Name], [Image]) VALUES (N'05739701-f23f-4efb-b7e6-fa7e608e1ec8', N'L?ch s?', N'url')
GO
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'60f9de47-2ade-4891-b783-4adfddd74b4c', N'Lê Van U', CAST(N'1986-06-22' AS Date), N'u@example.com', N'fde72cae-96cd-4d3e-8b9e-f71f9eeff40c', N'male', N'url_to_image_U', CAST(N'2023-11-01T00:00:00.000' AS DateTime), N'0123456799')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'd5295b62-2e8a-481a-af9c-5de6dce35b9b', N'Nguy?n Van W', CAST(N'1983-03-03' AS Date), N'w@example.com', N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'male', N'url_to_image_W', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'0123456701')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'd30a460b-ff55-446f-8179-7ccf21d45e7a', N'Nguy?n Van O', CAST(N'1981-09-10' AS Date), N'o@example.com', N'fde72cae-96cd-4d3e-8b9e-f71f9eeff40c', N'male', N'url_to_image_O', CAST(N'2023-05-01T00:00:00.000' AS DateTime), N'0123456793')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'd421d04d-a993-4edf-832b-8a068fb60542', N'Ph?m Th? V', CAST(N'1991-04-28' AS Date), N'v@example.com', N'05739701-f23f-4efb-b7e6-fa7e608e1ec8', N'female', N'url_to_image_V', CAST(N'2023-12-01T00:00:00.000' AS DateTime), N'0123456700')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'32238b3d-f414-4672-9619-8f9025702f5e', N'Tr?n Th? L', CAST(N'1989-03-15' AS Date), N'l@example.com', N'452b9447-3ef4-4dab-81fe-592fa51222e3', N'female', N'url_to_image_L', CAST(N'2023-02-01T00:00:00.000' AS DateTime), N'0123456790')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'71bc6fcf-73d8-415e-b255-921e89caa317', N'Nguy?n Van E', CAST(N'1982-09-10' AS Date), N'e@example.com', N'fde72cae-96cd-4d3e-8b9e-f71f9eeff40c', N'male', N'url_to_image_E', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'0123456783')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'f8f7facb-f580-4da7-ab4b-92448b0d1b52', N'Ph?m Th? R', CAST(N'1994-11-25' AS Date), N'r@example.com', N'452b9447-3ef4-4dab-81fe-592fa51222e3', N'female', N'url_to_image_R', CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'0123456796')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'0a262f41-3baf-4430-a6a5-97253b2f95c9', N'Tr?n Th? F', CAST(N'1992-12-05' AS Date), N'f@example.com', N'05739701-f23f-4efb-b7e6-fa7e608e1ec8', N'female', N'url_to_image_F', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'0123456784')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'3576cd46-4cb9-40d3-8e16-9d0943e91d1c', N'Ph?m Th? N', CAST(N'1992-01-30' AS Date), N'n@example.com', N'1a6855b1-6202-4d13-a788-71a379bebc0b', N'female', N'url_to_image_N', CAST(N'2023-04-01T00:00:00.000' AS DateTime), N'0123456792')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'34857279-8cef-4826-8074-a31ba3674619', N'Lê Van Q', CAST(N'1988-08-18' AS Date), N'q@example.com', N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'male', N'url_to_image_Q', CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'0123456795')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'92fcf14d-c47c-4896-915c-acbd1abf570d', N'Nguy?n Van K', CAST(N'1984-02-20' AS Date), N'k@example.com', N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'male', N'url_to_image_K', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'0123456789')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'f3555684-a1fe-499e-8ec4-af7ca12f467b', N'Lê Van M', CAST(N'1995-07-25' AS Date), N'm@example.com', N'dac2c658-569b-468e-834b-66c5c848ba0b', N'male', N'url_to_image_M', CAST(N'2023-03-01T00:00:00.000' AS DateTime), N'0123456791')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'8dba2fea-8afb-4000-a49a-b01f3be52fe8', N'Lê Van C', CAST(N'1988-07-25' AS Date), N'c@example.com', N'dac2c658-569b-468e-834b-66c5c848ba0b', N'male', N'url_to_image_C', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'0123456781')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'39fc79cd-e79c-4a63-9ba5-be3432024336', N'Nguy?n Van S', CAST(N'1987-05-30' AS Date), N's@example.com', N'dac2c658-569b-468e-834b-66c5c848ba0b', N'male', N'url_to_image_S', CAST(N'2023-09-01T00:00:00.000' AS DateTime), N'0123456797')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'826b13bf-35b4-4307-92f7-c13b195f4e2b', N'Lê Van Y', CAST(N'1990-05-15' AS Date), N'y@example.com', N'dac2c658-569b-468e-834b-66c5c848ba0b', N'male', N'url_to_image_Y', CAST(N'2023-03-01T00:00:00.000' AS DateTime), N'0123456703')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'7e045801-01d1-4e33-98a8-c4901c9ddbe2', N'Ph?m Th? Z', CAST(N'1992-11-30' AS Date), N'z@example.com', N'1a6855b1-6202-4d13-a788-71a379bebc0b', N'female', N'url_to_image_Z', CAST(N'2023-04-01T00:00:00.000' AS DateTime), N'0123456704')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'f3e9c78c-de30-4c3a-b938-d13d85ea6b20', N'Tr?n Th? X', CAST(N'1985-12-12' AS Date), N'x@example.com', N'452b9447-3ef4-4dab-81fe-592fa51222e3', N'female', N'url_to_image_X', CAST(N'2023-02-01T00:00:00.000' AS DateTime), N'0123456702')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'070561e0-7d63-4c1a-8654-d891aa940c4c', N'Tr?n Th? T', CAST(N'1993-10-14' AS Date), N't@example.com', N'1a6855b1-6202-4d13-a788-71a379bebc0b', N'female', N'url_to_image_T', CAST(N'2023-10-01T00:00:00.000' AS DateTime), N'0123456798')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'9ee05ad9-8b87-4ae7-a265-f190ef22579d', N'Nguy?n Van A', CAST(N'1985-05-20' AS Date), N'a@example.com', N'95706071-9614-4b4d-aa7d-2e072af5cf76', N'male', N'url_to_image_A', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'0123456789')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'd2911d46-289e-4f69-acce-f1a088ceacce', N'Tr?n Th? B', CAST(N'1990-03-15' AS Date), N'b@example.com', N'452b9447-3ef4-4dab-81fe-592fa51222e3', N'female', N'url_to_image_B', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'0123456780')
INSERT [dbo].[Teacher] ([ID], [Name], [BirthDate], [Email], [SubjectID], [Gender], [Image], [FirstLogin], [phoneNumber]) VALUES (N'170c05fa-7875-40b3-8d70-fe880fabf184', N'Tr?n Th? P', CAST(N'1990-12-05' AS Date), N'p@example.com', N'05739701-f23f-4efb-b7e6-fa7e608e1ec8', N'female', N'url_to_image_P', CAST(N'2023-06-01T00:00:00.000' AS DateTime), N'0123456794')
GO
INSERT [dbo].[UserLogin] ([UserId], [UserName], [Password], [RoleId]) VALUES (N'7f64f7dd-f4f9-4952-9738-49089cfc785b', N'adminUser', N'hashed_password_here', N'35d7ca33-6080-4318-acc2-aaaf90a70ed9')
INSERT [dbo].[UserLogin] ([UserId], [UserName], [Password], [RoleId]) VALUES (N'f7896888-7c32-473c-96a4-6f421983af32', N'Anh', N'1234566@b', N'314d4cb1-5267-4768-a6fc-20578977b948')
INSERT [dbo].[UserLogin] ([UserId], [UserName], [Password], [RoleId]) VALUES (N'4e1757d4-43ba-46e8-b090-8dd882f2ff3f', N'normalUser', N'hashed_password_here', N'314d4cb1-5267-4768-a6fc-20578977b948')
INSERT [dbo].[UserLogin] ([UserId], [UserName], [Password], [RoleId]) VALUES (N'd5c6c595-6e4e-40f0-9519-db8f0c9abbd1', N'HUY', N'123456@a', N'35d7ca33-6080-4318-acc2-aaaf90a70ed9')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Role__D62CB59C3EDD6881]    Script Date: 02/04/2025 3:05:55 CH ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Student__1FC88604C9A6B29A]    Script Date: 02/04/2025 3:05:55 CH ******/
ALTER TABLE [dbo].[Student] ADD UNIQUE NONCLUSTERED 
(
	[StudentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Student__2724B2D16E24B519]    Script Date: 02/04/2025 3:05:55 CH ******/
ALTER TABLE [dbo].[Student] ADD UNIQUE NONCLUSTERED 
(
	[Mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Teacher__A9D1053484637759]    Script Date: 02/04/2025 3:05:55 CH ******/
ALTER TABLE [dbo].[Teacher] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserLogi__C9F28456D19D1F1B]    Script Date: 02/04/2025 3:05:55 CH ******/
ALTER TABLE [dbo].[UserLogin] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[UserLogin] ADD  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Grade] FOREIGN KEY([GradeID])
REFERENCES [dbo].[Grade] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Grade]
GO
ALTER TABLE [dbo].[Class_Quiz]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ID])
GO
ALTER TABLE [dbo].[Class_Quiz]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([ID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Student]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Subject]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Teacher]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Student]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Teacher]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Class]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Subject]
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD FOREIGN KEY([AnswerID])
REFERENCES [dbo].[Answer] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Students_Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Students_Teachers_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Students_Teachers] CHECK CONSTRAINT [FK_Students_Teachers_Student]
GO
ALTER TABLE [dbo].[Students_Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Students_Teachers_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[Students_Teachers] CHECK CONSTRAINT [FK_Students_Teachers_Teacher]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Teacher_Class]  WITH CHECK ADD FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teacher_Class]  WITH CHECK ADD FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teacher_Student]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Student_Student] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Teacher_Student] CHECK CONSTRAINT [FK_Teacher_Student_Student]
GO
ALTER TABLE [dbo].[Teacher_Student]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Student_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[Teacher_Student] CHECK CONSTRAINT [FK_Teacher_Student_Teacher]
GO
ALTER TABLE [dbo].[UserLogin]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD CHECK  (([Status]='Not Started' OR [Status]='In Progress' OR [Status]='Completed'))
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD CHECK  (([Gender]='Other' OR [Gender]='Female' OR [Gender]='Male'))
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD CHECK  (([Gender]='Other' OR [Gender]='Female' OR [Gender]='Male'))
GO
USE [master]
GO
ALTER DATABASE [testify3] SET  READ_WRITE 
GO
