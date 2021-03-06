USE [master]
GO
/****** Object:  Database [LaTiendita]    Script Date: 2/4/2020 10:11:21 PM ******/
CREATE DATABASE [LaTiendita]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LaTiendita', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LaTiendita.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LaTiendita_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\LaTiendita_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LaTiendita] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LaTiendita].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LaTiendita] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LaTiendita] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LaTiendita] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LaTiendita] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LaTiendita] SET ARITHABORT OFF 
GO
ALTER DATABASE [LaTiendita] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LaTiendita] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LaTiendita] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LaTiendita] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LaTiendita] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LaTiendita] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LaTiendita] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LaTiendita] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LaTiendita] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LaTiendita] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LaTiendita] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LaTiendita] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LaTiendita] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LaTiendita] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LaTiendita] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LaTiendita] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LaTiendita] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LaTiendita] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LaTiendita] SET  MULTI_USER 
GO
ALTER DATABASE [LaTiendita] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LaTiendita] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LaTiendita] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LaTiendita] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LaTiendita] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LaTiendita', N'ON'
GO
ALTER DATABASE [LaTiendita] SET QUERY_STORE = OFF
GO
USE [LaTiendita]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 2/4/2020 10:11:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[CreationDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/4/2020 10:11:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
	[Description] [nchar](10) NULL,
	[Price] [decimal](18, 0) NULL,
	[CreationDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 2/4/2020 10:11:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[PurchaseId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Amount] [decimal](18, 4) NULL,
	[UserId] [int] NULL,
	[CreationDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[PurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/4/2020 10:11:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NULL,
	[Email] [nchar](100) NULL,
	[Balance] [float] NULL,
	[CreationDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (1, N'Gansito   ', N'Gansito   ', CAST(10 AS Decimal(18, 0)), CAST(N'2020-01-28T00:00:00.000' AS DateTime), CAST(N'2020-01-28T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (2, N'Pingüino  ', N'Pingüino  ', CAST(15 AS Decimal(18, 0)), CAST(N'2020-01-28T00:00:00.000' AS DateTime), CAST(N'2020-01-28T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (3, N'Tostitos  ', N'Tostitos  ', CAST(12 AS Decimal(18, 0)), CAST(N'2020-01-28T00:00:00.000' AS DateTime), CAST(N'2020-01-28T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (4, N'Gansito2  ', N'Gansito   ', CAST(10 AS Decimal(18, 0)), CAST(N'2020-01-28T00:00:00.000' AS DateTime), CAST(N'2020-01-28T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (5, N'Pingüino2 ', N'Pingüino  ', CAST(15 AS Decimal(18, 0)), CAST(N'2020-01-28T00:00:00.000' AS DateTime), CAST(N'2020-01-28T00:00:00.000' AS DateTime), 0)
GO
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (6, N'Tostitos2 ', N'Tostitos  ', CAST(12 AS Decimal(18, 0)), CAST(N'2020-01-28T00:00:00.000' AS DateTime), CAST(N'2020-01-28T00:00:00.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchase] ON 
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (1, 2, 3, CAST(45.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:23:01.840' AS DateTime), CAST(N'2020-01-29T17:23:01.840' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (2, 3, 5, CAST(60.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:25:27.743' AS DateTime), CAST(N'2020-01-29T17:25:27.743' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (3, 1, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:34:45.550' AS DateTime), CAST(N'2020-01-29T17:34:45.550' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (4, 2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:37:32.893' AS DateTime), CAST(N'2020-01-29T17:37:32.893' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (5, 3, 1, CAST(12.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:37:44.030' AS DateTime), CAST(N'2020-01-29T17:37:44.030' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (6, 2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:38:34.983' AS DateTime), CAST(N'2020-01-29T17:38:34.983' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (7, 3, 1, CAST(12.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:39:17.543' AS DateTime), CAST(N'2020-01-29T17:39:17.543' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (8, 1, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:39:26.733' AS DateTime), CAST(N'2020-01-29T17:39:26.733' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (9, 2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:39:30.510' AS DateTime), CAST(N'2020-01-29T17:39:30.510' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (10, 1, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:40:17.723' AS DateTime), CAST(N'2020-01-29T17:40:17.723' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (11, 3, 9, CAST(108.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:40:24.350' AS DateTime), CAST(N'2020-01-29T17:40:24.350' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (12, 2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:43:24.520' AS DateTime), CAST(N'2020-01-29T17:43:24.520' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (13, 2, 7, CAST(105.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:44:00.257' AS DateTime), CAST(N'2020-01-29T17:44:00.257' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (14, 2, 3, CAST(45.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:23:01.840' AS DateTime), CAST(N'2020-01-29T17:23:01.840' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (15, 3, 5, CAST(60.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:25:27.743' AS DateTime), CAST(N'2020-01-29T17:25:27.743' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (16, 1, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:34:45.550' AS DateTime), CAST(N'2020-01-29T17:34:45.550' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (17, 2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:37:32.893' AS DateTime), CAST(N'2020-01-29T17:37:32.893' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (18, 3, 1, CAST(12.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:37:44.030' AS DateTime), CAST(N'2020-01-29T17:37:44.030' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (19, 2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:38:34.983' AS DateTime), CAST(N'2020-01-29T17:38:34.983' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (20, 3, 1, CAST(12.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:39:17.543' AS DateTime), CAST(N'2020-01-29T17:39:17.543' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (21, 1, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:39:26.733' AS DateTime), CAST(N'2020-01-29T17:39:26.733' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (22, 2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:39:30.510' AS DateTime), CAST(N'2020-01-29T17:39:30.510' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (23, 1, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:40:17.723' AS DateTime), CAST(N'2020-01-29T17:40:17.723' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (24, 3, 9, CAST(108.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:40:24.350' AS DateTime), CAST(N'2020-01-29T17:40:24.350' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (25, 2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:43:24.520' AS DateTime), CAST(N'2020-01-29T17:43:24.520' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (26, 2, 7, CAST(105.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:44:00.257' AS DateTime), CAST(N'2020-01-29T17:44:00.257' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (27, 5, 4, CAST(60.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-30T08:20:16.543' AS DateTime), CAST(N'2020-01-30T08:20:16.543' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (28, 3, 3, CAST(36.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-30T08:20:33.783' AS DateTime), CAST(N'2020-01-30T08:20:33.783' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (29, 2, 10, CAST(150.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T15:45:06.463' AS DateTime), CAST(N'2020-02-04T15:45:06.467' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (30, 3, 3, CAST(36.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T15:54:42.090' AS DateTime), CAST(N'2020-02-04T15:54:42.090' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (31, 3, 1, CAST(12.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T19:40:45.233' AS DateTime), CAST(N'2020-02-04T19:40:45.233' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (32, 4, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T19:42:38.627' AS DateTime), CAST(N'2020-02-04T19:42:38.627' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (33, 4, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T19:52:07.260' AS DateTime), CAST(N'2020-02-04T19:52:07.260' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (34, 4, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T19:52:16.423' AS DateTime), CAST(N'2020-02-04T19:52:16.423' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (35, 2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T19:53:38.350' AS DateTime), CAST(N'2020-02-04T19:53:38.350' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (36, 1, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T19:54:17.347' AS DateTime), CAST(N'2020-02-04T19:54:17.347' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (37, 4, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T19:58:22.647' AS DateTime), CAST(N'2020-02-04T19:58:22.647' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (38, 4, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T19:58:33.050' AS DateTime), CAST(N'2020-02-04T19:58:33.050' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (39, 4, 4, CAST(40.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T19:58:47.080' AS DateTime), CAST(N'2020-02-04T19:58:47.080' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (40, 1, 4, CAST(40.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T20:03:11.137' AS DateTime), CAST(N'2020-02-04T20:03:11.137' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (41, 4, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T20:05:33.583' AS DateTime), CAST(N'2020-02-04T20:05:33.583' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (42, 4, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T20:06:33.107' AS DateTime), CAST(N'2020-02-04T20:06:33.107' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (43, 4, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T20:08:31.810' AS DateTime), CAST(N'2020-02-04T20:08:31.810' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (44, 1, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T20:08:55.723' AS DateTime), CAST(N'2020-02-04T20:08:55.723' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (45, 4, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T20:16:45.157' AS DateTime), CAST(N'2020-02-04T20:16:45.157' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (46, 3, 1, CAST(12.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T20:16:51.350' AS DateTime), CAST(N'2020-02-04T20:16:51.350' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (47, 1, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T20:43:15.223' AS DateTime), CAST(N'2020-02-04T20:43:15.223' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (48, 2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T20:48:36.493' AS DateTime), CAST(N'2020-02-04T20:48:36.493' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (49, 2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T20:48:46.847' AS DateTime), CAST(N'2020-02-04T20:48:46.847' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (50, 2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T20:49:14.283' AS DateTime), CAST(N'2020-02-04T20:49:14.283' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (51, 5, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T20:55:07.713' AS DateTime), CAST(N'2020-02-04T20:55:07.713' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (52, 3, 1, CAST(12.0000 AS Decimal(18, 4)), 0, CAST(N'2020-02-04T20:55:26.560' AS DateTime), CAST(N'2020-02-04T20:55:26.560' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (53, 3, 1, CAST(12.0000 AS Decimal(18, 4)), 1, CAST(N'2020-02-04T21:19:21.717' AS DateTime), CAST(N'2020-02-04T21:19:21.720' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (54, 4, 1, CAST(10.0000 AS Decimal(18, 4)), 1, CAST(N'2020-02-04T21:48:08.383' AS DateTime), CAST(N'2020-02-04T21:48:08.383' AS DateTime), 0)
GO
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (55, 4, 1, CAST(10.0000 AS Decimal(18, 4)), 1, CAST(N'2020-02-04T22:03:24.293' AS DateTime), CAST(N'2020-02-04T22:03:24.293' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Purchase] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserId], [Name], [Email], [Balance], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (1, N'demoUser                                                                                            ', N'demo.user@demo.com                                                                                  ', 0, CAST(N'2020-02-04T00:00:00.000' AS DateTime), CAST(N'2020-02-04T00:00:00.000' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
USE [master]
GO
ALTER DATABASE [LaTiendita] SET  READ_WRITE 
GO
