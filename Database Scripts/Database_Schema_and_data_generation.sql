USE [master]
GO
/****** Object:  Database [LaTiendita]    Script Date: 1/29/2020 5:48:37 PM ******/
CREATE DATABASE [LaTiendita]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LaTiendita', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LaTiendita.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LaTiendita_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LaTiendita_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Payment]    Script Date: 1/29/2020 5:48:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Amount] [decimal](18, 0) NULL,
	[CreationDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/29/2020 5:48:37 PM ******/
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
/****** Object:  Table [dbo].[Purchase]    Script Date: 1/29/2020 5:48:37 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 1/29/2020 5:48:37 PM ******/
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


INSERT [dbo].[Product] ([Name], [Description], [Price], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (N'Gansito   ', N'Gansito   ', CAST(10 AS Decimal(18, 0)), CAST(N'2020-01-28T00:00:00.000' AS DateTime), CAST(N'2020-01-28T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([Name], [Description], [Price], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (N'Pingüino  ', N'Pingüino  ', CAST(15 AS Decimal(18, 0)), CAST(N'2020-01-28T00:00:00.000' AS DateTime), CAST(N'2020-01-28T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Product] ([Name], [Description], [Price], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (N'Tostitos  ', N'Tostitos  ', CAST(12 AS Decimal(18, 0)), CAST(N'2020-01-28T00:00:00.000' AS DateTime), CAST(N'2020-01-28T00:00:00.000' AS DateTime), 0)


INSERT [dbo].[Purchase] ([ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (2, 3, CAST(45.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:23:01.840' AS DateTime), CAST(N'2020-01-29T17:23:01.840' AS DateTime), 0)
INSERT [dbo].[Purchase] ([ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (3, 5, CAST(60.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:25:27.743' AS DateTime), CAST(N'2020-01-29T17:25:27.743' AS DateTime), 0)
INSERT [dbo].[Purchase] ([ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (1, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:34:45.550' AS DateTime), CAST(N'2020-01-29T17:34:45.550' AS DateTime), 0)
INSERT [dbo].[Purchase] ([ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:37:32.893' AS DateTime), CAST(N'2020-01-29T17:37:32.893' AS DateTime), 0)
INSERT [dbo].[Purchase] ([ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (3, 1, CAST(12.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:37:44.030' AS DateTime), CAST(N'2020-01-29T17:37:44.030' AS DateTime), 0)
INSERT [dbo].[Purchase] ([ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:38:34.983' AS DateTime), CAST(N'2020-01-29T17:38:34.983' AS DateTime), 0)
INSERT [dbo].[Purchase] ([ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (3, 1, CAST(12.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:39:17.543' AS DateTime), CAST(N'2020-01-29T17:39:17.543' AS DateTime), 0)
INSERT [dbo].[Purchase] ([ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (1, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:39:26.733' AS DateTime), CAST(N'2020-01-29T17:39:26.733' AS DateTime), 0)
INSERT [dbo].[Purchase] ([ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES (2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:39:30.510' AS DateTime), CAST(N'2020-01-29T17:39:30.510' AS DateTime), 0)
INSERT [dbo].[Purchase] ([ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES ( 1, 1, CAST(10.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:40:17.723' AS DateTime), CAST(N'2020-01-29T17:40:17.723' AS DateTime), 0)
INSERT [dbo].[Purchase] ([ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES ( 3, 9, CAST(108.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:40:24.350' AS DateTime), CAST(N'2020-01-29T17:40:24.350' AS DateTime), 0)
INSERT [dbo].[Purchase] ([ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES ( 2, 1, CAST(15.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:43:24.520' AS DateTime), CAST(N'2020-01-29T17:43:24.520' AS DateTime), 0)
INSERT [dbo].[Purchase] ([ProductId], [Quantity], [Amount], [UserId], [CreationDate], [UpdateDate], [IsDeleted]) VALUES ( 2, 7, CAST(105.0000 AS Decimal(18, 4)), 0, CAST(N'2020-01-29T17:44:00.257' AS DateTime), CAST(N'2020-01-29T17:44:00.257' AS DateTime), 0)
