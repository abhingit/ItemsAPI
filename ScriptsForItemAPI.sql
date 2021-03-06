USE [master]
GO
/****** Object:  Database [ItemAPI]    Script Date: 8/14/2020 10:53:14 PM ******/
CREATE DATABASE [ItemAPI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ItemAPI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ItemAPI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ItemAPI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ItemAPI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ItemAPI] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ItemAPI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ItemAPI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ItemAPI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ItemAPI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ItemAPI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ItemAPI] SET ARITHABORT OFF 
GO
ALTER DATABASE [ItemAPI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ItemAPI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ItemAPI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ItemAPI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ItemAPI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ItemAPI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ItemAPI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ItemAPI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ItemAPI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ItemAPI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ItemAPI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ItemAPI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ItemAPI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ItemAPI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ItemAPI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ItemAPI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ItemAPI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ItemAPI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ItemAPI] SET  MULTI_USER 
GO
ALTER DATABASE [ItemAPI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ItemAPI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ItemAPI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ItemAPI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ItemAPI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ItemAPI] SET QUERY_STORE = OFF
GO
USE [ItemAPI]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/14/2020 10:53:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 8/14/2020 10:53:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 8/14/2020 10:53:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[Id] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Computer')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Electronics')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (1, 1, N'Apple', N'MacBook, Air')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (2, 1, N'Lenovo', N'Thinkpad')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (3, 2, N'Mouse', N'All brands')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (4, 2, N'KeyBoards', N'All brands')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (5, 3, N'Samsung', N'Light weight')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (6, 3, N'Thompson', N'Lond durable')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (7, 4, N'Whirlpool', N'best brand availalble')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (8, 4, N'LG', N'Peoples choice')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (9, 5, N'Godreg', N'Indias choice')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (10, 5, N'IFB', N'Internationally chosen')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (11, 6, N'Lloyd', N'Serves better')
INSERT [dbo].[Item] ([Id], [SubCategoryId], [Name], [Description]) VALUES (12, 6, N'Bosch', N'All brands ')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [Name]) VALUES (1, 1, N'Laptop')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [Name]) VALUES (2, 1, N'Acessories')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [Name]) VALUES (3, 1, N'Desktops')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [Name]) VALUES (4, 2, N'Refrigerator')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [Name]) VALUES (5, 2, N'Washing Machine')
INSERT [dbo].[SubCategory] ([Id], [CategoryId], [Name]) VALUES (6, 2, N'AC')
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_SubCategory] FOREIGN KEY([SubCategoryId])
REFERENCES [dbo].[SubCategory] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_SubCategory]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
USE [master]
GO
ALTER DATABASE [ItemAPI] SET  READ_WRITE 
GO
