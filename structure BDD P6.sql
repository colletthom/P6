USE [master]
GO
/****** Object:  Database [P6NexaWorks]    Script Date: 29/02/2024 16:48:19 ******/
CREATE DATABASE [P6NexaWorks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'P6NexaWorks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\P6NexaWorks.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'P6NexaWorks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\P6NexaWorks_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [P6NexaWorks] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [P6NexaWorks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [P6NexaWorks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [P6NexaWorks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [P6NexaWorks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [P6NexaWorks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [P6NexaWorks] SET ARITHABORT OFF 
GO
ALTER DATABASE [P6NexaWorks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [P6NexaWorks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [P6NexaWorks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [P6NexaWorks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [P6NexaWorks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [P6NexaWorks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [P6NexaWorks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [P6NexaWorks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [P6NexaWorks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [P6NexaWorks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [P6NexaWorks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [P6NexaWorks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [P6NexaWorks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [P6NexaWorks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [P6NexaWorks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [P6NexaWorks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [P6NexaWorks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [P6NexaWorks] SET RECOVERY FULL 
GO
ALTER DATABASE [P6NexaWorks] SET  MULTI_USER 
GO
ALTER DATABASE [P6NexaWorks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [P6NexaWorks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [P6NexaWorks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [P6NexaWorks] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [P6NexaWorks] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [P6NexaWorks] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'P6NexaWorks', N'ON'
GO
ALTER DATABASE [P6NexaWorks] SET QUERY_STORE = ON
GO
ALTER DATABASE [P6NexaWorks] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [P6NexaWorks]
GO
/****** Object:  Table [dbo].[Produit]    Script Date: 29/02/2024 16:48:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Produit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produit Systeme exploitation]    Script Date: 29/02/2024 16:48:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produit Systeme exploitation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id Produit] [int] NOT NULL,
	[Id Systeme exploitation] [int] NOT NULL,
	[Version] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Produit Systeme-exploitation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Systeme exploitation]    Script Date: 29/02/2024 16:48:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Systeme exploitation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Systeme exploitation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 29/02/2024 16:48:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id Produit Systeme_exploitation] [int] NOT NULL,
	[Date Creation] [datetime] NOT NULL,
	[Date Resolution] [datetime] NULL,
	[Statut] [int] NULL,
	[Probleme] [varchar](max) NOT NULL,
	[Resolution] [varchar](max) NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Produit Systeme exploitation]  WITH CHECK ADD  CONSTRAINT [FK_Produit Systeme-exploitation_Produit] FOREIGN KEY([Id Produit])
REFERENCES [dbo].[Produit] ([Id])
GO
ALTER TABLE [dbo].[Produit Systeme exploitation] CHECK CONSTRAINT [FK_Produit Systeme-exploitation_Produit]
GO
ALTER TABLE [dbo].[Produit Systeme exploitation]  WITH CHECK ADD  CONSTRAINT [FK_Produit Systeme-exploitation_Systeme exploitation] FOREIGN KEY([Id Systeme exploitation])
REFERENCES [dbo].[Systeme exploitation] ([Id])
GO
ALTER TABLE [dbo].[Produit Systeme exploitation] CHECK CONSTRAINT [FK_Produit Systeme-exploitation_Systeme exploitation]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Produit Systeme-exploitation] FOREIGN KEY([Id Produit Systeme_exploitation])
REFERENCES [dbo].[Produit Systeme exploitation] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Produit Systeme-exploitation]
GO
ALTER TABLE [dbo].[Produit Systeme exploitation]  WITH CHECK ADD  CONSTRAINT [CHK_Version] CHECK  (([Version] like '[0-9][0-9].[0-9][0-9]' OR [Version] like '[0-9][0-9].[0-9]' OR [Version] like '[0-9].[0-9][0-9]' OR [Version] like '[0-9].[0-9]'))
GO
ALTER TABLE [dbo].[Produit Systeme exploitation] CHECK CONSTRAINT [CHK_Version]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [CHK_Statut] CHECK  (([Statut]=(2) OR [Statut]=(1)))
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [CHK_Statut]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'L''attribut "Version" doit être au format 1 ou 2 chiffres, un point, puis 1 ou 2 chiffres' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Produit Systeme exploitation', @level2type=N'CONSTRAINT',@level2name=N'CHK_Version'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Le statut est à 1 si le ticket est en cours et à 2 s''il est résolu (date de résolution non null). Cela se remplit automatiquement avec le trigger UpdateStatut' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ticket', @level2type=N'CONSTRAINT',@level2name=N'CHK_Statut'
GO
USE [master]
GO
ALTER DATABASE [P6NexaWorks] SET  READ_WRITE 
GO
