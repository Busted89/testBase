USE [master]
GO
/****** Object:  Database [TourBase]    Script Date: 22.06.2022 18:38:34 ******/
CREATE DATABASE [TourBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TourBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TourBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TourBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TourBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TourBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TourBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TourBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TourBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TourBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TourBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TourBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TourBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TourBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TourBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TourBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TourBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TourBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TourBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TourBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TourBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TourBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TourBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TourBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TourBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TourBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TourBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TourBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TourBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TourBase] SET RECOVERY FULL 
GO
ALTER DATABASE [TourBase] SET  MULTI_USER 
GO
ALTER DATABASE [TourBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TourBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TourBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TourBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TourBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TourBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TourBase', N'ON'
GO
ALTER DATABASE [TourBase] SET QUERY_STORE = OFF
GO
USE [TourBase]
GO
/****** Object:  Table [dbo].[Countre]    Script Date: 22.06.2022 18:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countre](
	[Code] [nchar](2) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Countre] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 22.06.2022 18:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountOfStars] [int] NOT NULL,
	[CountCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 22.06.2022 18:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[id] [int] NOT NULL,
	[Hotelid] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotelimage]    Script Date: 22.06.2022 18:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotelimage](
	[id] [int] NOT NULL,
	[Hotelid] [int] NOT NULL,
	[ImageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Hotelimage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOFTour]    Script Date: 22.06.2022 18:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOFTour](
	[Hotelid] [int] NOT NULL,
	[Tourid] [int] NOT NULL,
 CONSTRAINT [PK_HotelOFTour] PRIMARY KEY CLUSTERED 
(
	[Hotelid] ASC,
	[Tourid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 22.06.2022 18:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePreview] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[isActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TupeOFToure]    Script Date: 22.06.2022 18:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TupeOFToure](
	[Tourid] [int] NOT NULL,
	[Typeid] [int] NOT NULL,
 CONSTRAINT [PK_TupeOFToure] PRIMARY KEY CLUSTERED 
(
	[Tourid] ASC,
	[Typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 22.06.2022 18:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Countre] ([Code], [name]) VALUES (N'1 ', N'питр')
INSERT [dbo].[Countre] ([Code], [name]) VALUES (N'2 ', N'клитр')
GO
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (1, N'Тип 1', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (2, N'Тип 2', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (3, N'Тип 3', NULL)
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Countre] FOREIGN KEY([CountCode])
REFERENCES [dbo].[Countre] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Countre]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[Hotelimage]  WITH CHECK ADD  CONSTRAINT [FK_Hotelimage_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[Hotelimage] CHECK CONSTRAINT [FK_Hotelimage_Hotel]
GO
ALTER TABLE [dbo].[HotelOFTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOFTour_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelOFTour] CHECK CONSTRAINT [FK_HotelOFTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOFTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOFTour_Tour] FOREIGN KEY([Tourid])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[HotelOFTour] CHECK CONSTRAINT [FK_HotelOFTour_Tour]
GO
ALTER TABLE [dbo].[TupeOFToure]  WITH CHECK ADD  CONSTRAINT [FK_TupeOFToure_Tour] FOREIGN KEY([Tourid])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[TupeOFToure] CHECK CONSTRAINT [FK_TupeOFToure_Tour]
GO
ALTER TABLE [dbo].[TupeOFToure]  WITH CHECK ADD  CONSTRAINT [FK_TupeOFToure_Type] FOREIGN KEY([Typeid])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[TupeOFToure] CHECK CONSTRAINT [FK_TupeOFToure_Type]
GO
USE [master]
GO
ALTER DATABASE [TourBase] SET  READ_WRITE 
GO
