USE [master]
GO
/****** Object:  Database [GAIReestrDB]    Script Date: 25.10.2024 15:17:48 ******/
CREATE DATABASE [GAIReestrDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GAIReestrDB', FILENAME = N'C:\Users\gyakovlev\GAIReestrDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GAIReestrDB_log', FILENAME = N'C:\Users\gyakovlev\GAIReestrDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GAIReestrDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GAIReestrDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GAIReestrDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GAIReestrDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GAIReestrDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GAIReestrDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GAIReestrDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GAIReestrDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GAIReestrDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GAIReestrDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GAIReestrDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GAIReestrDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GAIReestrDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GAIReestrDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GAIReestrDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GAIReestrDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GAIReestrDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GAIReestrDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GAIReestrDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GAIReestrDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GAIReestrDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GAIReestrDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GAIReestrDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GAIReestrDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GAIReestrDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GAIReestrDB] SET  MULTI_USER 
GO
ALTER DATABASE [GAIReestrDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GAIReestrDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GAIReestrDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GAIReestrDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GAIReestrDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GAIReestrDB] SET QUERY_STORE = OFF
GO
USE [GAIReestrDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [GAIReestrDB]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 25.10.2024 15:17:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumberPlate] [nvarchar](50) NOT NULL,
	[RegionPlate] [int] NOT NULL,
	[MarkId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[ProductionYear] [int] NOT NULL,
	[OwnerId] [int] NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 25.10.2024 15:17:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 25.10.2024 15:17:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Owners]    Script Date: 25.10.2024 15:17:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[SecondName] [nvarchar](50) NOT NULL,
	[PatronomycName] [nvarchar](50) NOT NULL,
	[Adress] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Owners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [NumberPlate], [RegionPlate], [MarkId], [ColorId], [ProductionYear], [OwnerId]) VALUES (1, N'Е052КХ', 52, 1, 1, 2024, 1)
INSERT [dbo].[Cars] ([Id], [NumberPlate], [RegionPlate], [MarkId], [ColorId], [ProductionYear], [OwnerId]) VALUES (2, N'В140ОР', 97, 2, 3, 2024, 3)
INSERT [dbo].[Cars] ([Id], [NumberPlate], [RegionPlate], [MarkId], [ColorId], [ProductionYear], [OwnerId]) VALUES (5, N'О097ЕО', 977, 6, 1, 2006, 2)
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Number]) VALUES (1, N'Чёрный')
INSERT [dbo].[Colors] ([Id], [Number]) VALUES (2, N'Белый')
INSERT [dbo].[Colors] ([Id], [Number]) VALUES (3, N'Серый')
INSERT [dbo].[Colors] ([Id], [Number]) VALUES (4, N'Зеленый')
INSERT [dbo].[Colors] ([Id], [Number]) VALUES (5, N'Красный')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[Marks] ON 

INSERT [dbo].[Marks] ([Id], [Name], [Model]) VALUES (1, N'BMW', N'X3')
INSERT [dbo].[Marks] ([Id], [Name], [Model]) VALUES (2, N'BMW', N'X5')
INSERT [dbo].[Marks] ([Id], [Name], [Model]) VALUES (3, N'BMW', N'X7')
INSERT [dbo].[Marks] ([Id], [Name], [Model]) VALUES (4, N'Mercedes-Benz', N'GLE')
INSERT [dbo].[Marks] ([Id], [Name], [Model]) VALUES (5, N'Mercedes-Benz', N'GLA')
INSERT [dbo].[Marks] ([Id], [Name], [Model]) VALUES (6, N'Mercedes-Benz', N'GLS')
INSERT [dbo].[Marks] ([Id], [Name], [Model]) VALUES (7, N'Ford', N'Focus')
SET IDENTITY_INSERT [dbo].[Marks] OFF
GO
SET IDENTITY_INSERT [dbo].[Owners] ON 

INSERT [dbo].[Owners] ([Id], [FirstName], [SecondName], [PatronomycName], [Adress]) VALUES (1, N'Георгий', N'Яковлев', N'Владимирович', N'МО, р-п Обухово, ул.Энтузиастов 5')
INSERT [dbo].[Owners] ([Id], [FirstName], [SecondName], [PatronomycName], [Adress]) VALUES (2, N'Ашур', N'Джамшутов', N'Романович', N'МО, г. Люберцы, ул. Барыкино')
INSERT [dbo].[Owners] ([Id], [FirstName], [SecondName], [PatronomycName], [Adress]) VALUES (3, N'Максим', N'Васюшко', N'Александрович', N'Москва, г. Москва, ул. Алтайская 17')
SET IDENTITY_INSERT [dbo].[Owners] OFF
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Colors] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Colors]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Marks] FOREIGN KEY([MarkId])
REFERENCES [dbo].[Marks] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Marks]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Owners] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Owners] ([Id])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Owners]
GO
USE [master]
GO
ALTER DATABASE [GAIReestrDB] SET  READ_WRITE 
GO
