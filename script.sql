USE [master]
GO
/****** Object:  Database [RFUniversityDB]    Script Date: 2/16/2016 2:53:16 AM ******/
CREATE DATABASE [RFUniversityDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RFUniversityDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\RFUniversityDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RFUniversityDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\RFUniversityDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RFUniversityDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RFUniversityDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RFUniversityDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RFUniversityDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RFUniversityDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RFUniversityDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RFUniversityDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RFUniversityDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RFUniversityDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [RFUniversityDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RFUniversityDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RFUniversityDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RFUniversityDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RFUniversityDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RFUniversityDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RFUniversityDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RFUniversityDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RFUniversityDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RFUniversityDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RFUniversityDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RFUniversityDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RFUniversityDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RFUniversityDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RFUniversityDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [RFUniversityDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RFUniversityDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RFUniversityDB] SET  MULTI_USER 
GO
ALTER DATABASE [RFUniversityDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RFUniversityDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RFUniversityDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RFUniversityDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [RFUniversityDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/16/2016 2:53:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClassRoomAllocations]    Script Date: 2/16/2016 2:53:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassRoomAllocations](
	[AllocationId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[Day] [nvarchar](max) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[IsAllocated] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.ClassRoomAllocations] PRIMARY KEY CLUSTERED 
(
	[AllocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2/16/2016 2:53:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [nvarchar](1000) NOT NULL,
	[CourseName] [nvarchar](max) NOT NULL,
	[CourseCredit] [float] NOT NULL,
	[CourseDescription] [nvarchar](max) NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
	[TeacherId] [int] NULL,
	[IsAssigned] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2/16/2016 2:53:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](max) NOT NULL,
	[DepartmentCode] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_dbo.Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Designations]    Script Date: 2/16/2016 2:53:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designations](
	[DesignationId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Designations] PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 2/16/2016 2:53:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 2/16/2016 2:53:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semesters](
	[SemesterId] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Semesters] PRIMARY KEY CLUSTERED 
(
	[SemesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentEnrolledCourses]    Script Date: 2/16/2016 2:53:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentEnrolledCourses](
	[EnrolledId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[StudentName] [nvarchar](max) NOT NULL,
	[StudentEmail] [nvarchar](max) NOT NULL,
	[StudentDepartment] [nvarchar](max) NOT NULL,
	[CourseId] [int] NOT NULL,
	[EnrolledDate] [datetime] NOT NULL,
	[GradeLetter] [nvarchar](max) NULL,
	[IsEnrolled] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.StudentEnrolledCourses] PRIMARY KEY CLUSTERED 
(
	[EnrolledId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 2/16/2016 2:53:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](max) NOT NULL,
	[StudentEmail] [nvarchar](max) NOT NULL,
	[StudentContactNo] [nvarchar](max) NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[DepartmentId] [int] NOT NULL,
	[StudentRegistrationNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 2/16/2016 2:53:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [nvarchar](max) NOT NULL,
	[TeacherAddress] [nvarchar](max) NOT NULL,
	[TeacherEmail] [nvarchar](max) NOT NULL,
	[TeacherContactNo] [nvarchar](max) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherTakenCredit] [float] NOT NULL,
	[RemainingCredit] [float] NOT NULL,
 CONSTRAINT [PK_dbo.Teachers] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId], [TeacherId], [IsAssigned]) VALUES (1, N'CSE101', N'Programming Language-I', 3, NULL, 1, 1, NULL, 0)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId], [TeacherId], [IsAssigned]) VALUES (2, N'CSE102', N'Programming Language-I Lab', 1.5, NULL, 1, 1, NULL, 0)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId], [TeacherId], [IsAssigned]) VALUES (3, N'CSE108', N'Inroduction to Computer Systems', 1.5, NULL, 1, 1, NULL, 0)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId], [TeacherId], [IsAssigned]) VALUES (4, N'MATH115', N'Mathematics-I', 3, NULL, 1, 1, NULL, 0)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId], [TeacherId], [IsAssigned]) VALUES (5, N'PHY115', N'Physics', 3, NULL, 1, 1, NULL, 0)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId], [TeacherId], [IsAssigned]) VALUES (6, N'CSE100', N'Software Development-I', 0.75, NULL, 1, 2, NULL, 0)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId], [TeacherId], [IsAssigned]) VALUES (7, N'CSE103', N'Discrete Mathmatics', 3, NULL, 1, 2, NULL, 0)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId], [TeacherId], [IsAssigned]) VALUES (8, N'EEE107', N'Basic Electrical Engineering', 3, NULL, 2, 1, NULL, 0)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId], [TeacherId], [IsAssigned]) VALUES (9, N'EEE108', N'Basic Electrical Engineering Lab', 1.5, NULL, 2, 1, NULL, 0)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId], [TeacherId], [IsAssigned]) VALUES (10, N'EEE211', N'Electronic Devices & Circuits', 3, NULL, 2, 2, NULL, 0)
INSERT [dbo].[Courses] ([CourseId], [CourseCode], [CourseName], [CourseCredit], [CourseDescription], [DepartmentId], [SemesterId], [TeacherId], [IsAssigned]) VALUES (11, N'EEE212', N'Electronic Devices & Circuits Lab', 1.5, NULL, 1, 2, NULL, 0)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName], [DepartmentCode]) VALUES (1, N'Computer Science & Engineering', N'CSE-26')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName], [DepartmentCode]) VALUES (2, N'Electrical & Electronics Engineering', N'EEE-26')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName], [DepartmentCode]) VALUES (3, N'Civil Engineering', N'CE-26')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Designations] ON 

INSERT [dbo].[Designations] ([DesignationId], [DesignationName]) VALUES (1, N'Professor')
INSERT [dbo].[Designations] ([DesignationId], [DesignationName]) VALUES (2, N'Lecturer')
INSERT [dbo].[Designations] ([DesignationId], [DesignationName]) VALUES (3, N'Assistant')
SET IDENTITY_INSERT [dbo].[Designations] OFF
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (1, N'A-200')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (2, N'A-201')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (3, N'A-202')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (4, N'A-203')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (5, N'A-204')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (6, N'B-200')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (7, N'B-201')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (8, N'B-202')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (9, N'B-203')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (10, N'B-204')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (11, N'C-300')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (12, N'C-301')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (13, N'C-302')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (14, N'C-303')
INSERT [dbo].[Rooms] ([RoomId], [RoomNo]) VALUES (15, N'C-304')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
SET IDENTITY_INSERT [dbo].[Semesters] ON 

INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (1, N'1st Year 1st Semester')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (2, N'1st Year 2nd Semester')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (3, N'2nd Year 1st Semester')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (4, N'2nd Year 2nd Semester')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (5, N'3rd Year 1st Semester')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (6, N'3rd Year 2nd Semester')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (7, N'4th Year 1st Semester')
INSERT [dbo].[Semesters] ([SemesterId], [SemesterName]) VALUES (8, N'4th Year 2nd Semester')
SET IDENTITY_INSERT [dbo].[Semesters] OFF
SET IDENTITY_INSERT [dbo].[StudentEnrolledCourses] ON 

INSERT [dbo].[StudentEnrolledCourses] ([EnrolledId], [StudentId], [StudentName], [StudentEmail], [StudentDepartment], [CourseId], [EnrolledDate], [GradeLetter], [IsEnrolled]) VALUES (1, 1, N'Kazi Nafis Ishtiaque', N'nafisisty@gmail.com', N'Computer Science & Engineering', 1, CAST(0x0000A5AE00000000 AS DateTime), N'A+', 1)
INSERT [dbo].[StudentEnrolledCourses] ([EnrolledId], [StudentId], [StudentName], [StudentEmail], [StudentDepartment], [CourseId], [EnrolledDate], [GradeLetter], [IsEnrolled]) VALUES (2, 1, N'Kazi Nafis Ishtiaque', N'nafisisty@gmail.com', N'Computer Science & Engineering', 4, CAST(0x0000A5AE00000000 AS DateTime), N'A', 1)
INSERT [dbo].[StudentEnrolledCourses] ([EnrolledId], [StudentId], [StudentName], [StudentEmail], [StudentDepartment], [CourseId], [EnrolledDate], [GradeLetter], [IsEnrolled]) VALUES (3, 1, N'Kazi Nafis Ishtiaque', N'nafisisty@gmail.com', N'Computer Science & Engineering', 6, CAST(0x0000A5AE00000000 AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[StudentEnrolledCourses] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [StudentName], [StudentEmail], [StudentContactNo], [RegistrationDate], [Address], [DepartmentId], [StudentRegistrationNumber]) VALUES (1, N'Kazi Nafis Ishtiaque', N'nafisisty@gmail.com', N'01675764290', CAST(0x0000A5AE00000000 AS DateTime), N'Mirpur, Dhaka', 1, N'CSE-26-2016-001')
INSERT [dbo].[Students] ([StudentId], [StudentName], [StudentEmail], [StudentContactNo], [RegistrationDate], [Address], [DepartmentId], [StudentRegistrationNumber]) VALUES (2, N'Ariful Haque', N'arif@live.com', N'01715408265', CAST(0x0000A5AE00000000 AS DateTime), N'Dhaka', 1, N'CSE-26-2016-002')
INSERT [dbo].[Students] ([StudentId], [StudentName], [StudentEmail], [StudentContactNo], [RegistrationDate], [Address], [DepartmentId], [StudentRegistrationNumber]) VALUES (3, N'Alauddin Al Amin', N'amin@hotmail.com', N'01814759652', CAST(0x0000A5AE00000000 AS DateTime), N'Dhaka', 2, N'EEE-26-2016-001')
INSERT [dbo].[Students] ([StudentId], [StudentName], [StudentEmail], [StudentContactNo], [RegistrationDate], [Address], [DepartmentId], [StudentRegistrationNumber]) VALUES (4, N'Frodo Baggins', N'frodo@live.com', N'01545896221', CAST(0x0000A5AE00000000 AS DateTime), N'Kaoranbazar', 2, N'EEE-26-2016-002')
INSERT [dbo].[Students] ([StudentId], [StudentName], [StudentEmail], [StudentContactNo], [RegistrationDate], [Address], [DepartmentId], [StudentRegistrationNumber]) VALUES (5, N'Ant-Man', N'anti@gmail.com', N'01478529632', CAST(0x0000A5AE00000000 AS DateTime), N'Motijheel', 3, N'CE-26-2016-001')
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [TeacherTakenCredit], [RemainingCredit]) VALUES (1, N'Md Tayabur Rahman', N'Dhaka', N'tayabur@gmail.com', N'01675897456', 1, 1, 20, 20)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [TeacherTakenCredit], [RemainingCredit]) VALUES (2, N'Sakib Al Hasan', N'Dhaka', N'shishir@yahoo.com', N'01715426358', 2, 1, 6, 6)
INSERT [dbo].[Teachers] ([TeacherId], [TeacherName], [TeacherAddress], [TeacherEmail], [TeacherContactNo], [DesignationId], [DepartmentId], [TeacherTakenCredit], [RemainingCredit]) VALUES (3, N'Barak Obama', N'Puran Dhaka', N'obama@live.com', N'01478596255', 3, 2, 10, 10)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
/****** Object:  Index [IX_CourseId]    Script Date: 2/16/2016 2:53:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_CourseId] ON [dbo].[ClassRoomAllocations]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DepartmentId]    Script Date: 2/16/2016 2:53:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_DepartmentId] ON [dbo].[ClassRoomAllocations]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoomId]    Script Date: 2/16/2016 2:53:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoomId] ON [dbo].[ClassRoomAllocations]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DepartmentId]    Script Date: 2/16/2016 2:53:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_DepartmentId] ON [dbo].[Courses]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SemesterId]    Script Date: 2/16/2016 2:53:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_SemesterId] ON [dbo].[Courses]
(
	[SemesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeacherId]    Script Date: 2/16/2016 2:53:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_TeacherId] ON [dbo].[Courses]
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseId]    Script Date: 2/16/2016 2:53:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_CourseId] ON [dbo].[StudentEnrolledCourses]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentId]    Script Date: 2/16/2016 2:53:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_StudentId] ON [dbo].[StudentEnrolledCourses]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DepartmentId]    Script Date: 2/16/2016 2:53:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_DepartmentId] ON [dbo].[Students]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DepartmentId]    Script Date: 2/16/2016 2:53:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_DepartmentId] ON [dbo].[Teachers]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DesignationId]    Script Date: 2/16/2016 2:53:16 AM ******/
CREATE NONCLUSTERED INDEX [IX_DesignationId] ON [dbo].[Teachers]
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ClassRoomAllocations] ADD  DEFAULT ((0)) FOR [IsAllocated]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [IsAssigned]
GO
ALTER TABLE [dbo].[StudentEnrolledCourses] ADD  DEFAULT ((0)) FOR [IsEnrolled]
GO
ALTER TABLE [dbo].[Teachers] ADD  DEFAULT ((0)) FOR [RemainingCredit]
GO
ALTER TABLE [dbo].[ClassRoomAllocations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClassRoomAllocations_dbo.Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClassRoomAllocations] CHECK CONSTRAINT [FK_dbo.ClassRoomAllocations_dbo.Courses_CourseId]
GO
ALTER TABLE [dbo].[ClassRoomAllocations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClassRoomAllocations_dbo.Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[ClassRoomAllocations] CHECK CONSTRAINT [FK_dbo.ClassRoomAllocations_dbo.Departments_DepartmentId]
GO
ALTER TABLE [dbo].[ClassRoomAllocations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ClassRoomAllocations_dbo.Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([RoomId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClassRoomAllocations] CHECK CONSTRAINT [FK_dbo.ClassRoomAllocations_dbo.Rooms_RoomId]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Courses_dbo.Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_dbo.Courses_dbo.Departments_DepartmentId]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Courses_dbo.Semesters_SemesterId] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semesters] ([SemesterId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_dbo.Courses_dbo.Semesters_SemesterId]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Courses_dbo.Teachers_TeacherId] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([TeacherId])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_dbo.Courses_dbo.Teachers_TeacherId]
GO
ALTER TABLE [dbo].[StudentEnrolledCourses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StudentEnrolledCourses_dbo.Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentEnrolledCourses] CHECK CONSTRAINT [FK_dbo.StudentEnrolledCourses_dbo.Courses_CourseId]
GO
ALTER TABLE [dbo].[StudentEnrolledCourses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StudentEnrolledCourses_dbo.Students_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[StudentEnrolledCourses] CHECK CONSTRAINT [FK_dbo.StudentEnrolledCourses_dbo.Students_StudentId]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Students_dbo.Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_dbo.Students_dbo.Departments_DepartmentId]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Teachers_dbo.Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_dbo.Teachers_dbo.Departments_DepartmentId]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Teachers_dbo.Designations_DesignationId] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designations] ([DesignationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_dbo.Teachers_dbo.Designations_DesignationId]
GO
USE [master]
GO
ALTER DATABASE [RFUniversityDB] SET  READ_WRITE 
GO
