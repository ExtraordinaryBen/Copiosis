USE [master]
GO
/****** Object:  Database [copiosis_test]    Script Date: 12/15/2014 1:31:01 PM ******/
CREATE DATABASE [copiosis_test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'copiosis_test', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\copiosis_test.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'copiosis_test_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\copiosis_test_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [copiosis_test] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [copiosis_test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [copiosis_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [copiosis_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [copiosis_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [copiosis_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [copiosis_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [copiosis_test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [copiosis_test] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [copiosis_test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [copiosis_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [copiosis_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [copiosis_test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [copiosis_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [copiosis_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [copiosis_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [copiosis_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [copiosis_test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [copiosis_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [copiosis_test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [copiosis_test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [copiosis_test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [copiosis_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [copiosis_test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [copiosis_test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [copiosis_test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [copiosis_test] SET  MULTI_USER 
GO
ALTER DATABASE [copiosis_test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [copiosis_test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [copiosis_test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [copiosis_test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [copiosis_test]
GO
/****** Object:  Table [dbo].[itemClass]    Script Date: 12/15/2014 1:31:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[itemClass](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](55) NULL,
	[suggestedGateway] [int] NULL,
	[cPdb] [float] NULL,
	[a] [float] NULL,
	[aMax] [int] NULL,
	[d] [int] NULL,
	[aPrime] [int] NULL,
	[cCb] [float] NULL,
	[m1] [float] NULL,
	[pO] [int] NULL,
	[m2] [float] NULL,
	[cEb] [float] NULL,
	[s] [int] NULL,
	[m3] [float] NULL,
	[sE] [smallint] NULL,
	[m4] [float] NULL,
	[sH] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[classID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[location]    Script Date: 12/15/2014 1:31:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[location](
	[locationID] [int] IDENTITY(1,1) NOT NULL,
	[country] [varchar](55) NULL,
	[state] [varchar](55) NULL,
	[city] [varchar](55) NULL,
	[neighborhood] [varchar](55) NULL,
	[signupKey] [varchar](55) NULL,
PRIMARY KEY CLUSTERED 
(
	[locationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 12/15/2014 1:31:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](155) NULL,
	[description] [varchar](255) NULL,
	[gateway] [int] NULL,
	[itemClass] [int] NULL,
	[createdDate] [datetime] NULL,
	[deletedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transaction]    Script Date: 12/15/2014 1:31:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transaction](
	[transactionID] [uniqueidentifier] NOT NULL,
	[providerID] [int] NULL,
	[providerNotes] [text] NULL,
	[receiverID] [int] NULL,
	[receiverNotes] [text] NULL,
	[date] [date] NULL,
	[productID] [int] NULL,
	[productDesc] [varchar](255) NULL,
	[status] [varchar](16) NULL,
	[dateAdded] [datetime] NULL,
	[createdBy] [int] NULL,
	[dateClosed] [datetime] NULL,
	[nbr] [float] NULL,
	[satisfaction] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[transactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user]    Script Date: 12/15/2014 1:31:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](55) NULL,
	[password] [varchar](255) NULL,
	[email] [varchar](155) NULL,
	[firstName] [varchar](55) NULL,
	[lastName] [varchar](55) NULL,
	[status] [int] NOT NULL,
	[nbr] [float] NULL,
	[created] [datetime] NULL,
	[lastLogin] [datetime] NULL,
	[locationID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Version]    Script Date: 12/15/2014 1:31:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Version](
	[Id] [varchar](25) NULL,
	[VersionNumber] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[transaction] ADD  DEFAULT (newid()) FOR [transactionID]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([itemClass])
REFERENCES [dbo].[itemClass] ([classID])
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD FOREIGN KEY([createdBy])
REFERENCES [dbo].[user] ([userID])
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[product] ([productID])
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD FOREIGN KEY([providerID])
REFERENCES [dbo].[user] ([userID])
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD FOREIGN KEY([receiverID])
REFERENCES [dbo].[user] ([userID])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([locationID])
REFERENCES [dbo].[location] ([locationID])
GO
USE [master]
GO
ALTER DATABASE [copiosis_test] SET  READ_WRITE 
GO
