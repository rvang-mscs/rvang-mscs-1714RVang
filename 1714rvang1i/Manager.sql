USE [master]
GO
/****** Object:  Database [1I Project]    Script Date: 9/27/2019 4:06:05 PM ******/
CREATE DATABASE [1I Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'1H Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\1H Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'1H Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\1H Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [1I Project] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [1I Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [1I Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [1I Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [1I Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [1I Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [1I Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [1I Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [1I Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [1I Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [1I Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [1I Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [1I Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [1I Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [1I Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [1I Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [1I Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [1I Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [1I Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [1I Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [1I Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [1I Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [1I Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [1I Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [1I Project] SET RECOVERY FULL 
GO
ALTER DATABASE [1I Project] SET  MULTI_USER 
GO
ALTER DATABASE [1I Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [1I Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [1I Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [1I Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [1I Project] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'1I Project', N'ON'
GO
ALTER DATABASE [1I Project] SET QUERY_STORE = OFF
GO
USE [1I Project]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 9/27/2019 4:06:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](10) NOT NULL,
	[LastName] [nchar](10) NOT NULL,
	[Age] [int] NOT NULL,
	[PhoneNumber] [nchar](15) NULL,
	[Email] [nchar](20) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Practice]    Script Date: 9/27/2019 4:06:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice](
	[PersonId] [int] NOT NULL,
	[Oppenent] [nchar](20) NOT NULL,
	[Vs] [nchar](10) NOT NULL,
	[Gamemodes] [nchar](15) NOT NULL,
	[PracticeDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Practice] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/27/2019 4:06:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[PersonId] [int] NOT NULL,
	[Role] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournment]    Script Date: 9/27/2019 4:06:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournment](
	[TournmentId] [int] IDENTITY(1,1) NOT NULL,
	[TournmentName] [nvarchar](50) NOT NULL,
	[TournmentDate] [smalldatetime] NOT NULL,
	[Location] [nchar](20) NOT NULL,
	[EntryFee] [int] NOT NULL,
 CONSTRAINT [PK_Tournment] PRIMARY KEY CLUSTERED 
(
	[TournmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Age], [PhoneNumber], [Email]) VALUES (1, N'Josh      ', N'Rich      ', 19, N'507-185-6215   ', N'josh.R@email.com    ')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Age], [PhoneNumber], [Email]) VALUES (2, N'Rich      ', N'Verk      ', 20, N'507-597-5846   ', N'Rich.V@email.com    ')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Age], [PhoneNumber], [Email]) VALUES (4, N'Zach      ', N'Simmions  ', 18, N'507-597-8559   ', N'Null                ')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Age], [PhoneNumber], [Email]) VALUES (5, N'Kelly     ', N'Genvar    ', 22, N'507-995-4882   ', N'Kelly.G@email.com   ')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Age], [PhoneNumber], [Email]) VALUES (6, N'Zach      ', N'Rock      ', 22, N'507-514-9443   ', N'Zach.R@email.com    ')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Age], [PhoneNumber], [Email]) VALUES (7, N'Gust      ', N'Tow       ', 18, N'507-485-5448   ', N'Null                ')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Age], [PhoneNumber], [Email]) VALUES (8, N'Caitlyn   ', N'Herman    ', 22, N'507-498-8331   ', N'Cait.H@email.com    ')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Age], [PhoneNumber], [Email]) VALUES (9, N'Jerry     ', N'Snoll     ', 18, N'Null           ', N'Jerry.S@email.com   ')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Age], [PhoneNumber], [Email]) VALUES (10, N'Nade      ', N'Shot      ', 24, N'507-777-4883   ', N'Nade.S@email.com    ')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Age], [PhoneNumber], [Email]) VALUES (11, N'Karma     ', N'Kim       ', 23, N'507-884-2265   ', N'Karma.K@email.com   ')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [Age], [PhoneNumber], [Email]) VALUES (13, N'Herobrine ', N'Notch     ', 19, N'980-666-6496   ', N'Hero.N@email.com    ')
SET IDENTITY_INSERT [dbo].[Person] OFF
INSERT [dbo].[Practice] ([PersonId], [Oppenent], [Vs], [Gamemodes], [PracticeDate]) VALUES (1, N'Team Envy           ', N'1 Vs 1    ', N'S&D            ', CAST(N'2019-10-02T00:00:00' AS SmallDateTime))
INSERT [dbo].[Practice] ([PersonId], [Oppenent], [Vs], [Gamemodes], [PracticeDate]) VALUES (4, N'Team Envy           ', N'1 Vs 1    ', N'S&D            ', CAST(N'2019-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[Practice] ([PersonId], [Oppenent], [Vs], [Gamemodes], [PracticeDate]) VALUES (7, N'Cloud9              ', N'1 Vs 1    ', N'S&D            ', CAST(N'2019-10-05T00:00:00' AS SmallDateTime))
INSERT [dbo].[Practice] ([PersonId], [Oppenent], [Vs], [Gamemodes], [PracticeDate]) VALUES (9, N'Rise Nation         ', N'1 Vs 1    ', N'S&D            ', CAST(N'2019-10-06T00:00:00' AS SmallDateTime))
INSERT [dbo].[Practice] ([PersonId], [Oppenent], [Vs], [Gamemodes], [PracticeDate]) VALUES (13, N'Rise Nation         ', N'1 Vs 1    ', N'S&D            ', CAST(N'2019-10-06T00:00:00' AS SmallDateTime))
INSERT [dbo].[Role] ([PersonId], [Role]) VALUES (1, N'Player              ')
INSERT [dbo].[Role] ([PersonId], [Role]) VALUES (2, N'IT                  ')
INSERT [dbo].[Role] ([PersonId], [Role]) VALUES (4, N'Player              ')
INSERT [dbo].[Role] ([PersonId], [Role]) VALUES (5, N'IT                  ')
INSERT [dbo].[Role] ([PersonId], [Role]) VALUES (6, N'Content Creator     ')
INSERT [dbo].[Role] ([PersonId], [Role]) VALUES (7, N'Player              ')
INSERT [dbo].[Role] ([PersonId], [Role]) VALUES (8, N'Content Creator     ')
INSERT [dbo].[Role] ([PersonId], [Role]) VALUES (9, N'Player              ')
INSERT [dbo].[Role] ([PersonId], [Role]) VALUES (10, N'Coach               ')
INSERT [dbo].[Role] ([PersonId], [Role]) VALUES (11, N'Assisstant Coach    ')
INSERT [dbo].[Role] ([PersonId], [Role]) VALUES (13, N'Player              ')
SET IDENTITY_INSERT [dbo].[Tournment] ON 

INSERT [dbo].[Tournment] ([TournmentId], [TournmentName], [TournmentDate], [Location], [EntryFee]) VALUES (2, N'CWL Anaheim', CAST(N'2019-06-14T00:00:00' AS SmallDateTime), N'Columbus, OH        ', 300)
INSERT [dbo].[Tournment] ([TournmentId], [TournmentName], [TournmentDate], [Location], [EntryFee]) VALUES (6, N'CWL London', CAST(N'2019-05-03T00:00:00' AS SmallDateTime), N'Copper Box, London  ', 200)
INSERT [dbo].[Tournment] ([TournmentId], [TournmentName], [TournmentDate], [Location], [EntryFee]) VALUES (8, N'CWL Pro League', CAST(N'2019-02-04T00:00:00' AS SmallDateTime), N'Columbus, OH        ', 250)
SET IDENTITY_INSERT [dbo].[Tournment] OFF
USE [master]
GO
ALTER DATABASE [1I Project] SET  READ_WRITE 
GO
