USE [master]
GO
/****** Object:  Database [ArenaGestorDB]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE DATABASE [ArenaGestorDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ArenaGestorDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ArenaGestorDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ArenaGestorDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ArenaGestorDB_log.ldf' , SIZE = 8512KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ArenaGestorDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ArenaGestorDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ArenaGestorDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ArenaGestorDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ArenaGestorDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ArenaGestorDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ArenaGestorDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ArenaGestorDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ArenaGestorDB] SET  MULTI_USER 
GO
ALTER DATABASE [ArenaGestorDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ArenaGestorDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ArenaGestorDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ArenaGestorDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ArenaGestorDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ArenaGestorDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ArenaGestorDB] SET QUERY_STORE = OFF
GO
USE [ArenaGestorDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[ArtistId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Artist] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistBand]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistBand](
	[ArtistId] [int] NOT NULL,
	[MusicalProtagonistId] [int] NOT NULL,
	[RoleArtistId] [int] NOT NULL,
 CONSTRAINT [PK_ArtistBand] PRIMARY KEY CLUSTERED 
(
	[ArtistId] ASC,
	[MusicalProtagonistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Band]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Band](
	[MusicalProtagonistId] [int] NOT NULL,
 CONSTRAINT [PK_Band] PRIMARY KEY CLUSTERED 
(
	[MusicalProtagonistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Concert]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concert](
	[ConcertId] [int] IDENTITY(1,1) NOT NULL,
	[TourName] [nvarchar](50) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[LocationId] [int] NOT NULL,
 CONSTRAINT [PK_Concert] PRIMARY KEY CLUSTERED 
(
	[ConcertId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConcertProtagonist]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConcertProtagonist](
	[ConcertId] [int] NOT NULL,
	[MusicalProtagonistId] [int] NOT NULL,
 CONSTRAINT [PK_ConcertProtagonist] PRIMARY KEY CLUSTERED 
(
	[ConcertId] ASC,
	[MusicalProtagonistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countrys]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countrys](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Countrys] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[Place] [nvarchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Street] [nvarchar](500) NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusicalProtagonist]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusicalProtagonist](
	[MusicalProtagonistId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[GenderId] [int] NOT NULL,
 CONSTRAINT [PK_MusicalProtagonist] PRIMARY KEY CLUSTERED 
(
	[MusicalProtagonistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleArtist]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleArtist](
	[RoleArtistId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RoleArtist] PRIMARY KEY CLUSTERED 
(
	[RoleArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleUser]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUser](
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_RoleUser] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionId] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](max) NULL,
	[Created] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Snack]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Snack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_Snack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Soloist]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Soloist](
	[MusicalProtagonistId] [int] NOT NULL,
	[ArtistId] [int] NOT NULL,
	[RoleArtistId] [int] NOT NULL,
 CONSTRAINT [PK_Soloist] PRIMARY KEY CLUSTERED 
(
	[MusicalProtagonistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketId] [uniqueidentifier] NOT NULL,
	[TicketStatusId] [int] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[ConcertId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketSnack]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketSnack](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[TicketId] [uniqueidentifier] NOT NULL,
	[SnackId] [int] NOT NULL,
 CONSTRAINT [PK_TicketSnack] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketStatus]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketStatus](
	[TicketStatusId] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TicketStatus] PRIMARY KEY CLUSTERED 
(
	[TicketStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/2/2023 7:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220508231847_initial', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220509021308_check-migration', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220516212545_UserRole', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220516224153_ArtistBand', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220517013431_MultipleProtagonistsPerConcert', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220608003236_artist-role', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220608040053_concert-location', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220609010648_county', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220609225103_artist-user', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220612235439_AddIds', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220615000413_user-artist-nullable', N'5.0.15')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230511040351_add_snacks_table', N'5.0.15')
GO
SET IDENTITY_INSERT [dbo].[Artist] ON 

INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (1, N'Paul McCartney', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (2, N'George Harrison', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (3, N'Ringo Starr', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (4, N'John Lennon', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (5, N'Bob Dylan', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (6, N'Elvis Presley', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (7, N'Mick Jagger', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (8, N'Keith Richards', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (9, N'Ronnie Wood', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (10, N'Jimi Hendrix', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (11, N'Bob Marley', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (12, N'Jimmy Page', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (13, N'Robert Plant', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (14, N'John Paul Jones', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (15, N'John Bonham', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (16, N'Stevie Wonder', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (17, N'Joey Ramone', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (18, N'Johnny Ramone', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (19, N'Marky Ramone', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (20, N'Dee Dee Ramone', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (21, N'Kurt Cobain', 8)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (22, N'David Guetta', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (23, N'Agustin Casanova', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (24, N'Dave Grohl', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (25, N'Krist Novoselic', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (26, N'Freddie Mercury', 9)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (27, N'Roger Taylor', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (28, N'John Deacon', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (29, N'Brian May', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (30, N'Angus Young', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (31, N'Stevie Young', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (32, N'Brian Johnson', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (33, N'Cliff Williams', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (34, N'Phil Rudd', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (35, N'Julieta Venegas', NULL)
INSERT [dbo].[Artist] ([ArtistId], [Name], [UserId]) VALUES (36, N'Sebastián Yatra', NULL)
SET IDENTITY_INSERT [dbo].[Artist] OFF
GO
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (4, 1, 1)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (7, 2, 1)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (13, 7, 1)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (17, 9, 1)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (21, 10, 1)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (26, 13, 1)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (32, 14, 1)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (3, 1, 2)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (15, 7, 2)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (19, 9, 2)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (25, 10, 2)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (27, 13, 2)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (34, 14, 2)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (1, 1, 3)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (8, 2, 3)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (14, 7, 3)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (20, 9, 3)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (24, 10, 3)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (28, 13, 3)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (33, 14, 3)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (2, 1, 4)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (9, 2, 4)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (12, 7, 4)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (18, 9, 4)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (29, 13, 4)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (30, 14, 4)
INSERT [dbo].[ArtistBand] ([ArtistId], [MusicalProtagonistId], [RoleArtistId]) VALUES (31, 14, 4)
GO
INSERT [dbo].[Band] ([MusicalProtagonistId]) VALUES (1)
INSERT [dbo].[Band] ([MusicalProtagonistId]) VALUES (2)
INSERT [dbo].[Band] ([MusicalProtagonistId]) VALUES (7)
INSERT [dbo].[Band] ([MusicalProtagonistId]) VALUES (9)
INSERT [dbo].[Band] ([MusicalProtagonistId]) VALUES (10)
INSERT [dbo].[Band] ([MusicalProtagonistId]) VALUES (13)
INSERT [dbo].[Band] ([MusicalProtagonistId]) VALUES (14)
GO
SET IDENTITY_INSERT [dbo].[Concert] ON 

INSERT [dbo].[Concert] ([ConcertId], [TourName], [Date], [TicketCount], [Price], [LocationId]) VALUES (1, N'Nevermind', CAST(N'2022-08-15T03:00:00.0000000' AS DateTime2), 50000, 2000, 1)
INSERT [dbo].[Concert] ([ConcertId], [TourName], [Date], [TicketCount], [Price], [LocationId]) VALUES (2, N'The World Tour', CAST(N'2022-06-20T03:00:00.0000000' AS DateTime2), 60000, 10000, 2)
INSERT [dbo].[Concert] ([ConcertId], [TourName], [Date], [TicketCount], [Price], [LocationId]) VALUES (3, N'The Beatles'' 1966 US tour', CAST(N'2022-06-15T01:16:01.1630000' AS DateTime2), 50000, 4000, 3)
INSERT [dbo].[Concert] ([ConcertId], [TourName], [Date], [TicketCount], [Price], [LocationId]) VALUES (4, N'América Latina Olé Tour', CAST(N'2023-08-31T03:00:00.0000000' AS DateTime2), 20000, 1000, 4)
INSERT [dbo].[Concert] ([ConcertId], [TourName], [Date], [TicketCount], [Price], [LocationId]) VALUES (5, N'Solistas Tour', CAST(N'2022-07-10T03:00:00.0000000' AS DateTime2), 20000, 500, 5)
INSERT [dbo].[Concert] ([ConcertId], [TourName], [Date], [TicketCount], [Price], [LocationId]) VALUES (6, N'Cumbia Tour', CAST(N'2022-06-20T03:00:00.0000000' AS DateTime2), 8000, 1500, 6)
SET IDENTITY_INSERT [dbo].[Concert] OFF
GO
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (2, 1)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (3, 1)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (2, 2)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (2, 3)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (5, 3)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (2, 4)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (5, 4)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (2, 5)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (5, 5)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (2, 6)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (5, 6)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (2, 7)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (2, 8)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (5, 8)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (2, 9)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (1, 10)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (2, 10)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (5, 11)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (6, 12)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (2, 13)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (2, 14)
INSERT [dbo].[ConcertProtagonist] ([ConcertId], [MusicalProtagonistId]) VALUES (6, 16)
GO
SET IDENTITY_INSERT [dbo].[Countrys] ON 

INSERT [dbo].[Countrys] ([CountryId], [Name]) VALUES (1, N'Uruguay')
INSERT [dbo].[Countrys] ([CountryId], [Name]) VALUES (2, N'Argentina')
SET IDENTITY_INSERT [dbo].[Countrys] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([GenderId], [Name]) VALUES (9, N'Blues')
INSERT [dbo].[Gender] ([GenderId], [Name]) VALUES (4, N'Cumbia')
INSERT [dbo].[Gender] ([GenderId], [Name]) VALUES (3, N'Electronica')
INSERT [dbo].[Gender] ([GenderId], [Name]) VALUES (6, N'Grunge')
INSERT [dbo].[Gender] ([GenderId], [Name]) VALUES (5, N'Jazz')
INSERT [dbo].[Gender] ([GenderId], [Name]) VALUES (2, N'Pop')
INSERT [dbo].[Gender] ([GenderId], [Name]) VALUES (10, N'Punk')
INSERT [dbo].[Gender] ([GenderId], [Name]) VALUES (7, N'Rap')
INSERT [dbo].[Gender] ([GenderId], [Name]) VALUES (8, N'Reggae')
INSERT [dbo].[Gender] ([GenderId], [Name]) VALUES (1, N'Rock')
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([LocationId], [Place], [CountryId], [Street], [Number]) VALUES (1, N'Estadio Centenario', 1, N'Avda. Dr. Américo Ricaldoni', 1234)
INSERT [dbo].[Location] ([LocationId], [Place], [CountryId], [Street], [Number]) VALUES (2, N' Estadio Centenario', 1, N'Avda. Dr. Américo Ricaldoni', 1234)
INSERT [dbo].[Location] ([LocationId], [Place], [CountryId], [Street], [Number]) VALUES (3, N'Antel Arena', 1, N'Av. Damaso A. Larrañaga', 4321)
INSERT [dbo].[Location] ([LocationId], [Place], [CountryId], [Street], [Number]) VALUES (4, N'Antel Arena', 1, N'Av. Damaso A. Larrañaga', 1234)
INSERT [dbo].[Location] ([LocationId], [Place], [CountryId], [Street], [Number]) VALUES (5, N' Estadio Centenario', 1, N'Avda. Dr. Américo Ricaldoni', 123)
INSERT [dbo].[Location] ([LocationId], [Place], [CountryId], [Street], [Number]) VALUES (6, N'Teatro Gran Rex', 2, N'Av. Corrientes', 857)
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[MusicalProtagonist] ON 

INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (1, N'The Beatles', CAST(N'1964-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (2, N'The Rolling Stones', CAST(N'1962-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (3, N'Bob Dylan', CAST(N'1959-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (4, N'Elvis Presley', CAST(N'1953-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (5, N'Jimi Hendrix', CAST(N'1963-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (6, N'Bob Marley', CAST(N'1962-01-01T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (7, N'Led Zeppelin', CAST(N'1968-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (8, N'Stevie Wonder', CAST(N'1961-01-01T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (9, N'Ramones', CAST(N'1974-01-01T00:00:00.0000000' AS DateTime2), 10)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (10, N'Nirvana', CAST(N'1987-01-01T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (11, N'David Guetta', CAST(N'1984-01-01T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (12, N'Agustin Casanova', CAST(N'2014-01-01T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (13, N'Queen', CAST(N'1970-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (14, N'AC/DC', CAST(N'1973-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (15, N'Julieta Venegas', CAST(N'1987-01-01T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[MusicalProtagonist] ([MusicalProtagonistId], [Name], [StartDate], [GenderId]) VALUES (16, N'Sebastián Yatra', CAST(N'2013-01-01T00:00:00.0000000' AS DateTime2), 4)
SET IDENTITY_INSERT [dbo].[MusicalProtagonist] OFF
GO
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (3, N'Acomodador')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (1, N'Administrador')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (5, N'Artista')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (4, N'Espectador')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (2, N'Vendedor')
GO
INSERT [dbo].[RoleArtist] ([RoleArtistId], [Name]) VALUES (1, N'Cantante')
INSERT [dbo].[RoleArtist] ([RoleArtistId], [Name]) VALUES (2, N'Baterista')
INSERT [dbo].[RoleArtist] ([RoleArtistId], [Name]) VALUES (3, N'Bajista')
INSERT [dbo].[RoleArtist] ([RoleArtistId], [Name]) VALUES (4, N'Guitarrista')
INSERT [dbo].[RoleArtist] ([RoleArtistId], [Name]) VALUES (5, N'Coro')
GO
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (1, 1)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (2, 1)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (3, 1)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (4, 1)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (5, 1)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (1, 2)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (2, 2)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (3, 2)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (4, 2)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (5, 2)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (3, 3)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (2, 4)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (1, 5)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (4, 6)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (1, 7)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (2, 7)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (3, 7)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (4, 7)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (5, 7)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (5, 8)
INSERT [dbo].[RoleUser] ([RoleId], [UserId]) VALUES (5, 9)
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([SessionId], [Token], [Created], [UserId]) VALUES (1, N'R0NCJuXHhI2Ym5SNdkjeEwQQ9cdBgRxlZDQcnSrEEq82eawS09HE0j1fl6DeRVmP', CAST(N'2022-05-01T18:36:25.0152013' AS DateTime2), 4)
INSERT [dbo].[Session] ([SessionId], [Token], [Created], [UserId]) VALUES (2, N'Wu1cRSXcEsHAPO7MNGoSO92ngjuGcta5QCDSI7t19QburmeDjsvbHf1X1P5shQAV', CAST(N'2022-05-01T18:36:47.5386123' AS DateTime2), 5)
INSERT [dbo].[Session] ([SessionId], [Token], [Created], [UserId]) VALUES (4, N'fXNkKTCHPCURgTAMSPSlzEdaA72xLG4mMojVWf6NfbzT576J2QK4Vfxb3xjMaP5I', CAST(N'2022-06-14T22:57:11.9833176' AS DateTime2), 8)
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
SET IDENTITY_INSERT [dbo].[Snack] ON 

INSERT [dbo].[Snack] ([Id], [Description], [Price]) VALUES (13, N'Pop', 5)
INSERT [dbo].[Snack] ([Id], [Description], [Price]) VALUES (18, N'Papas', 3)
INSERT [dbo].[Snack] ([Id], [Description], [Price]) VALUES (20, N'Oreos', 5)
SET IDENTITY_INSERT [dbo].[Snack] OFF
GO
INSERT [dbo].[Soloist] ([MusicalProtagonistId], [ArtistId], [RoleArtistId]) VALUES (3, 5, 1)
INSERT [dbo].[Soloist] ([MusicalProtagonistId], [ArtistId], [RoleArtistId]) VALUES (4, 6, 1)
INSERT [dbo].[Soloist] ([MusicalProtagonistId], [ArtistId], [RoleArtistId]) VALUES (5, 10, 4)
INSERT [dbo].[Soloist] ([MusicalProtagonistId], [ArtistId], [RoleArtistId]) VALUES (6, 11, 1)
INSERT [dbo].[Soloist] ([MusicalProtagonistId], [ArtistId], [RoleArtistId]) VALUES (8, 16, 1)
INSERT [dbo].[Soloist] ([MusicalProtagonistId], [ArtistId], [RoleArtistId]) VALUES (11, 22, 1)
INSERT [dbo].[Soloist] ([MusicalProtagonistId], [ArtistId], [RoleArtistId]) VALUES (12, 23, 1)
INSERT [dbo].[Soloist] ([MusicalProtagonistId], [ArtistId], [RoleArtistId]) VALUES (15, 35, 1)
INSERT [dbo].[Soloist] ([MusicalProtagonistId], [ArtistId], [RoleArtistId]) VALUES (16, 36, 1)
GO
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'57f1b4cd-d610-4a1c-ef42-08da4e703754', 1, N'sinregistrar@user.com', 3, 100)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'cd3ecf9f-1bac-4003-ef43-08da4e703754', 1, N'espectador@example.com', 3, 100)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'558f9aeb-2df1-4180-ef44-08da4e703754', 1, N'espectador@example.com', 1, 25000)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'aef531b6-0ddf-4b78-ef45-08da4e703754', 1, N'espectador@example.com', 1, 25000)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'9135950b-c448-4607-1137-08db57f374d6', 1, N'espectador@example.com', 4, 2)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'f5fc8944-25dd-441a-1138-08db57f374d6', 1, N'espectador@example.com', 4, 1)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'99124aed-63d1-4fb8-1139-08db57f374d6', 1, N'espectador@example.com', 4, 1)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'10ff3677-7560-4905-7cda-08db58ad93db', 1, N'espectador@example.com', 4, 4)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'95f2f749-c26d-420c-21c8-08db58b04124', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'b82cc5aa-4b47-40e9-21c9-08db58b04124', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'50051093-5623-4058-21ca-08db58b04124', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'07f75abb-ccca-4e7d-21cb-08db58b04124', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'b87da8a4-1e0b-4188-21cc-08db58b04124', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'8a86331c-f4a7-4833-21cd-08db58b04124', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'794dd35f-0118-43e8-21ce-08db58b04124', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'2f0b2f33-0766-4190-ee59-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'5ec0d39f-785b-41fe-ee5a-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'9e4dcbb3-aa79-4c53-ee5b-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'bf2b0220-ee42-49e7-ee5c-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'e4e5ffa3-46ed-4b66-ee5d-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'901b80d3-db30-4406-ee5e-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'86014e38-2edd-448d-ee5f-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'eb3461fb-16ca-4662-ee60-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'9f47c34d-81ab-43af-ee61-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'f3e46b63-1cb8-4f38-ee62-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'7aaf550a-7535-4ea6-ee63-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'd168dd4a-dd3f-43af-ee64-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'99676d29-aab7-4ce0-ee65-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'd899f549-1870-4dca-ee66-08db5b1608b3', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'317fdc09-0384-4e16-dee5-08db63b48404', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'4e9ca274-e448-425c-dee6-08db63b48404', 1, N'espectador@example.com', 4, 5)
INSERT [dbo].[Ticket] ([TicketId], [TicketStatusId], [Email], [ConcertId], [Amount]) VALUES (N'a2f3764b-d971-4867-dee7-08db63b48404', 1, N'espectador@example.com', 4, 5)
GO
SET IDENTITY_INSERT [dbo].[TicketSnack] ON 

INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (17, 5, N'10ff3677-7560-4905-7cda-08db58ad93db', 13)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (18, 5, N'95f2f749-c26d-420c-21c8-08db58b04124', 18)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (19, 5, N'07f75abb-ccca-4e7d-21cb-08db58b04124', 13)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (20, 5, N'b87da8a4-1e0b-4188-21cc-08db58b04124', 18)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (21, 5, N'8a86331c-f4a7-4833-21cd-08db58b04124', 18)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (22, 5, N'794dd35f-0118-43e8-21ce-08db58b04124', 18)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (1002, 5, N'2f0b2f33-0766-4190-ee59-08db5b1608b3', 13)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (1003, 5, N'5ec0d39f-785b-41fe-ee5a-08db5b1608b3', 13)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (1004, 5, N'9e4dcbb3-aa79-4c53-ee5b-08db5b1608b3', 13)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (1005, 5, N'bf2b0220-ee42-49e7-ee5c-08db5b1608b3', 13)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (1006, 5, N'901b80d3-db30-4406-ee5e-08db5b1608b3', 13)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (1007, 5, N'9f47c34d-81ab-43af-ee61-08db5b1608b3', 13)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (1008, 5, N'f3e46b63-1cb8-4f38-ee62-08db5b1608b3', 13)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (1009, 5, N'd168dd4a-dd3f-43af-ee64-08db5b1608b3', 13)
INSERT [dbo].[TicketSnack] ([Id], [Quantity], [TicketId], [SnackId]) VALUES (2002, 5, N'317fdc09-0384-4e16-dee5-08db63b48404', 13)
SET IDENTITY_INSERT [dbo].[TicketSnack] OFF
GO
INSERT [dbo].[TicketStatus] ([TicketStatusId], [Status]) VALUES (1, N'Comprado')
INSERT [dbo].[TicketStatus] ([TicketStatusId], [Status]) VALUES (2, N'Utilizado')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Name], [Surname], [Email], [Password]) VALUES (1, N'Francisco', N'Rosello', N'francisco.rosello.fran@gmail.com', N'fran')
INSERT [dbo].[User] ([UserId], [Name], [Surname], [Email], [Password]) VALUES (2, N'Maximiliano', N'Pascale', N'maximiliano.pascale@gmail.com ', N'maxi')
INSERT [dbo].[User] ([UserId], [Name], [Surname], [Email], [Password]) VALUES (3, N'Acomodador', N'Test', N'acomodador@example.com', N'test')
INSERT [dbo].[User] ([UserId], [Name], [Surname], [Email], [Password]) VALUES (4, N'Vendedor', N'Test', N'vendedor@example.com', N'test')
INSERT [dbo].[User] ([UserId], [Name], [Surname], [Email], [Password]) VALUES (5, N'Administrador', N'Test', N'administrador@example.com', N'test')
INSERT [dbo].[User] ([UserId], [Name], [Surname], [Email], [Password]) VALUES (6, N'Espectador', N'Test', N'espectador@example.com', N'test')
INSERT [dbo].[User] ([UserId], [Name], [Surname], [Email], [Password]) VALUES (7, N'Super', N'Super', N'super@example.com', N'super')
INSERT [dbo].[User] ([UserId], [Name], [Surname], [Email], [Password]) VALUES (8, N'Kurt', N'Cobain', N'kurt@example.com', N'test')
INSERT [dbo].[User] ([UserId], [Name], [Surname], [Email], [Password]) VALUES (9, N'Freddie', N'Mercury', N'fredy@example.com', N'test')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Artist_Name]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Artist_Name] ON [dbo].[Artist]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Artist_UserId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Artist_UserId] ON [dbo].[Artist]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArtistBand_MusicalProtagonistId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArtistBand_MusicalProtagonistId] ON [dbo].[ArtistBand]
(
	[MusicalProtagonistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ArtistBand_RoleArtistId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_ArtistBand_RoleArtistId] ON [dbo].[ArtistBand]
(
	[RoleArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Concert_LocationId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Concert_LocationId] ON [dbo].[Concert]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ConcertProtagonist_MusicalProtagonistId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_ConcertProtagonist_MusicalProtagonistId] ON [dbo].[ConcertProtagonist]
(
	[MusicalProtagonistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Gender_Name]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Gender_Name] ON [dbo].[Gender]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Location_CountryId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Location_CountryId] ON [dbo].[Location]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MusicalProtagonist_GenderId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_MusicalProtagonist_GenderId] ON [dbo].[MusicalProtagonist]
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MusicalProtagonist_Name]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MusicalProtagonist_Name] ON [dbo].[MusicalProtagonist]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Role_Name]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Role_Name] ON [dbo].[Role]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleUser_UserId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleUser_UserId] ON [dbo].[RoleUser]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Session_UserId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Session_UserId] ON [dbo].[Session]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Soloist_ArtistId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Soloist_ArtistId] ON [dbo].[Soloist]
(
	[ArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Soloist_RoleArtistId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Soloist_RoleArtistId] ON [dbo].[Soloist]
(
	[RoleArtistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ticket_ConcertId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ticket_ConcertId] ON [dbo].[Ticket]
(
	[ConcertId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ticket_TicketStatusId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ticket_TicketStatusId] ON [dbo].[Ticket]
(
	[TicketStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TicketSnack_SnackId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_TicketSnack_SnackId] ON [dbo].[TicketSnack]
(
	[SnackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TicketSnack_TicketId]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE NONCLUSTERED INDEX [IX_TicketSnack_TicketId] ON [dbo].[TicketSnack]
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TicketStatus_Status]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TicketStatus_Status] ON [dbo].[TicketStatus]
(
	[Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_Email]    Script Date: 6/2/2023 7:08:11 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_User_Email] ON [dbo].[User]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArtistBand] ADD  DEFAULT ((0)) FOR [RoleArtistId]
GO
ALTER TABLE [dbo].[Concert] ADD  DEFAULT ((0)) FOR [LocationId]
GO
ALTER TABLE [dbo].[Location] ADD  DEFAULT ((0)) FOR [CountryId]
GO
ALTER TABLE [dbo].[Soloist] ADD  DEFAULT ((0)) FOR [RoleArtistId]
GO
ALTER TABLE [dbo].[Artist]  WITH CHECK ADD  CONSTRAINT [FK_Artist_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Artist] CHECK CONSTRAINT [FK_Artist_User_UserId]
GO
ALTER TABLE [dbo].[ArtistBand]  WITH CHECK ADD  CONSTRAINT [FK_ArtistBand_Artist_ArtistId] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artist] ([ArtistId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArtistBand] CHECK CONSTRAINT [FK_ArtistBand_Artist_ArtistId]
GO
ALTER TABLE [dbo].[ArtistBand]  WITH CHECK ADD  CONSTRAINT [FK_ArtistBand_Band_MusicalProtagonistId] FOREIGN KEY([MusicalProtagonistId])
REFERENCES [dbo].[Band] ([MusicalProtagonistId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArtistBand] CHECK CONSTRAINT [FK_ArtistBand_Band_MusicalProtagonistId]
GO
ALTER TABLE [dbo].[ArtistBand]  WITH CHECK ADD  CONSTRAINT [FK_ArtistBand_RoleArtist_RoleArtistId] FOREIGN KEY([RoleArtistId])
REFERENCES [dbo].[RoleArtist] ([RoleArtistId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArtistBand] CHECK CONSTRAINT [FK_ArtistBand_RoleArtist_RoleArtistId]
GO
ALTER TABLE [dbo].[Band]  WITH CHECK ADD  CONSTRAINT [FK_Band_MusicalProtagonist_MusicalProtagonistId] FOREIGN KEY([MusicalProtagonistId])
REFERENCES [dbo].[MusicalProtagonist] ([MusicalProtagonistId])
GO
ALTER TABLE [dbo].[Band] CHECK CONSTRAINT [FK_Band_MusicalProtagonist_MusicalProtagonistId]
GO
ALTER TABLE [dbo].[Concert]  WITH CHECK ADD  CONSTRAINT [FK_Concert_Location_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([LocationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Concert] CHECK CONSTRAINT [FK_Concert_Location_LocationId]
GO
ALTER TABLE [dbo].[ConcertProtagonist]  WITH CHECK ADD  CONSTRAINT [FK_ConcertProtagonist_Concert_ConcertId] FOREIGN KEY([ConcertId])
REFERENCES [dbo].[Concert] ([ConcertId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConcertProtagonist] CHECK CONSTRAINT [FK_ConcertProtagonist_Concert_ConcertId]
GO
ALTER TABLE [dbo].[ConcertProtagonist]  WITH CHECK ADD  CONSTRAINT [FK_ConcertProtagonist_MusicalProtagonist_MusicalProtagonistId] FOREIGN KEY([MusicalProtagonistId])
REFERENCES [dbo].[MusicalProtagonist] ([MusicalProtagonistId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConcertProtagonist] CHECK CONSTRAINT [FK_ConcertProtagonist_MusicalProtagonist_MusicalProtagonistId]
GO
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_Countrys_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countrys] ([CountryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_Countrys_CountryId]
GO
ALTER TABLE [dbo].[MusicalProtagonist]  WITH CHECK ADD  CONSTRAINT [FK_MusicalProtagonist_Gender_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Gender] ([GenderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MusicalProtagonist] CHECK CONSTRAINT [FK_MusicalProtagonist_Gender_GenderId]
GO
ALTER TABLE [dbo].[RoleUser]  WITH CHECK ADD  CONSTRAINT [FK_RoleUser_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleUser] CHECK CONSTRAINT [FK_RoleUser_Role_RoleId]
GO
ALTER TABLE [dbo].[RoleUser]  WITH CHECK ADD  CONSTRAINT [FK_RoleUser_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleUser] CHECK CONSTRAINT [FK_RoleUser_User_UserId]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_User_UserId]
GO
ALTER TABLE [dbo].[Soloist]  WITH CHECK ADD  CONSTRAINT [FK_Soloist_Artist_ArtistId] FOREIGN KEY([ArtistId])
REFERENCES [dbo].[Artist] ([ArtistId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Soloist] CHECK CONSTRAINT [FK_Soloist_Artist_ArtistId]
GO
ALTER TABLE [dbo].[Soloist]  WITH CHECK ADD  CONSTRAINT [FK_Soloist_MusicalProtagonist_MusicalProtagonistId] FOREIGN KEY([MusicalProtagonistId])
REFERENCES [dbo].[MusicalProtagonist] ([MusicalProtagonistId])
GO
ALTER TABLE [dbo].[Soloist] CHECK CONSTRAINT [FK_Soloist_MusicalProtagonist_MusicalProtagonistId]
GO
ALTER TABLE [dbo].[Soloist]  WITH CHECK ADD  CONSTRAINT [FK_Soloist_RoleArtist_RoleArtistId] FOREIGN KEY([RoleArtistId])
REFERENCES [dbo].[RoleArtist] ([RoleArtistId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Soloist] CHECK CONSTRAINT [FK_Soloist_RoleArtist_RoleArtistId]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Concert_ConcertId] FOREIGN KEY([ConcertId])
REFERENCES [dbo].[Concert] ([ConcertId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Concert_ConcertId]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_TicketStatus_TicketStatusId] FOREIGN KEY([TicketStatusId])
REFERENCES [dbo].[TicketStatus] ([TicketStatusId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_TicketStatus_TicketStatusId]
GO
ALTER TABLE [dbo].[TicketSnack]  WITH CHECK ADD  CONSTRAINT [FK_TicketSnack_Snack_SnackId] FOREIGN KEY([SnackId])
REFERENCES [dbo].[Snack] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TicketSnack] CHECK CONSTRAINT [FK_TicketSnack_Snack_SnackId]
GO
ALTER TABLE [dbo].[TicketSnack]  WITH CHECK ADD  CONSTRAINT [FK_TicketSnack_Ticket_TicketId] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Ticket] ([TicketId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TicketSnack] CHECK CONSTRAINT [FK_TicketSnack_Ticket_TicketId]
GO
USE [master]
GO
ALTER DATABASE [ArenaGestorDB] SET  READ_WRITE 
GO
