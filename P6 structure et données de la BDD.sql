USE [master]
GO
/****** Object:  Database [P6NexaWorks]    Script Date: 14/03/2024 10:29:49 ******/
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
/****** Object:  Table [dbo].[Produit]    Script Date: 14/03/2024 10:29:50 ******/
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
/****** Object:  Table [dbo].[Produit Systeme exploitation]    Script Date: 14/03/2024 10:29:50 ******/
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
/****** Object:  Table [dbo].[Systeme exploitation]    Script Date: 14/03/2024 10:29:50 ******/
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
/****** Object:  Table [dbo].[Ticket]    Script Date: 14/03/2024 10:29:50 ******/
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
SET IDENTITY_INSERT [dbo].[Produit] ON 

INSERT [dbo].[Produit] ([Id], [Nom]) VALUES (1, N'Trader en Herbe')
INSERT [dbo].[Produit] ([Id], [Nom]) VALUES (2, N'Maître des 
Investissements')
INSERT [dbo].[Produit] ([Id], [Nom]) VALUES (3, N'Planificateur
d’Entraînement')
INSERT [dbo].[Produit] ([Id], [Nom]) VALUES (4, N'Planificateur
d’Anxiété 
Sociale
')
SET IDENTITY_INSERT [dbo].[Produit] OFF
GO
SET IDENTITY_INSERT [dbo].[Produit Systeme exploitation] ON 

INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (29, 1, 1, N'1.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (30, 1, 3, N'1.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (31, 1, 1, N'1.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (32, 1, 2, N'1.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (33, 1, 3, N'1.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (34, 1, 1, N'1.2')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (35, 1, 2, N'1.2')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (36, 1, 3, N'1.2')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (37, 1, 4, N'1.2')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (38, 1, 5, N'1.2')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (39, 1, 6, N'1.2')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (40, 1, 2, N'1.3')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (41, 1, 3, N'1.3')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (42, 1, 4, N'1.3')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (43, 1, 5, N'1.3')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (44, 2, 2, N'1.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (45, 2, 5, N'1.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (46, 2, 2, N'2.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (47, 2, 4, N'2.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (48, 2, 5, N'2.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (49, 2, 2, N'2.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (50, 2, 3, N'2.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (51, 2, 4, N'2.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (52, 2, 5, N'2.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (53, 3, 1, N'1.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (54, 3, 2, N'1.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (55, 3, 1, N'1.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (56, 3, 2, N'1.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (57, 3, 3, N'1.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (58, 3, 4, N'1.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (59, 3, 5, N'1.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (60, 3, 6, N'1.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (61, 3, 2, N'2.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (62, 3, 3, N'2.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (63, 3, 4, N'2.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (64, 3, 5, N'2.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (65, 4, 2, N'1.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (66, 4, 3, N'1.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (67, 4, 4, N'1.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (68, 4, 5, N'1.0')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (69, 4, 2, N'1.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (70, 4, 3, N'1.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (71, 4, 4, N'1.1')
INSERT [dbo].[Produit Systeme exploitation] ([Id], [Id Produit], [Id Systeme exploitation], [Version]) VALUES (72, 4, 5, N'1.1')
SET IDENTITY_INSERT [dbo].[Produit Systeme exploitation] OFF
GO
SET IDENTITY_INSERT [dbo].[Systeme exploitation] ON 

INSERT [dbo].[Systeme exploitation] ([Id], [Nom]) VALUES (1, N'Linux')
INSERT [dbo].[Systeme exploitation] ([Id], [Nom]) VALUES (2, N'MacOS')
INSERT [dbo].[Systeme exploitation] ([Id], [Nom]) VALUES (3, N'Windows')
INSERT [dbo].[Systeme exploitation] ([Id], [Nom]) VALUES (4, N'Android')
INSERT [dbo].[Systeme exploitation] ([Id], [Nom]) VALUES (5, N'iOS')
INSERT [dbo].[Systeme exploitation] ([Id], [Nom]) VALUES (6, N'Windows
Mobile')
SET IDENTITY_INSERT [dbo].[Systeme exploitation] OFF
GO
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (2, 44, CAST(N'2024-01-04T00:00:00.000' AS DateTime), CAST(N'2024-01-22T00:00:00.000' AS DateTime), 2, N'L''application plante lors du lancement.', N'Une mise à jour du système d''exploitation a résolu le problème.')
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (3, 63, CAST(N'2024-01-10T00:00:00.000' AS DateTime), NULL, 1, N'Les rappels d''entraînement ne fonctionnent pas correctement.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (4, 68, CAST(N'2024-01-15T00:00:00.000' AS DateTime), CAST(N'2024-01-25T00:00:00.000' AS DateTime), 2, N'Les suggestions de relaxation ne s''affichent pas.', N'Une mise à jour de l''application a résolu le problème.')
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (5, 33, CAST(N'2024-01-20T00:00:00.000' AS DateTime), NULL, 1, N'Les graphiques de performance ne se chargent pas.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (6, 47, CAST(N'2024-01-25T00:00:00.000' AS DateTime), NULL, 1, N'L''application affiche des informations erronées sur les marchés.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (7, 55, CAST(N'2024-02-01T00:00:00.000' AS DateTime), CAST(N'2024-02-20T00:00:00.000' AS DateTime), 2, N'Les séances d''entraînement ne sont pas enregistrées.', N'Un correctif a été appliqué pour enregistrer les séances correctement.')
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (8, 69, CAST(N'2024-02-05T00:00:00.000' AS DateTime), NULL, 1, N'Les statistiques de progression ne se mettent pas à jour.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (9, 51, CAST(N'2024-02-15T00:00:00.000' AS DateTime), CAST(N'2024-02-25T00:00:00.000' AS DateTime), 2, N'Les alertes de prix ne sont pas configurables.', N'Une mise à jour de l''application a permis de configurer les alertes.')
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (10, 41, CAST(N'2024-02-10T00:00:00.000' AS DateTime), NULL, 1, N'Les transactions ne sont pas enregistrées dans l''historique.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (11, 53, CAST(N'2024-02-20T00:00:00.000' AS DateTime), NULL, 1, N'L''application ne s''ouvre pas après la dernière mise à jour.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (12, 67, CAST(N'2024-02-25T00:00:00.000' AS DateTime), NULL, 1, N'Les exercices de respiration se lancent mais ne se terminent pas.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (13, 39, CAST(N'2024-03-01T00:00:00.000' AS DateTime), NULL, 1, N'L''application se ferme lors de la connexion à un compte bancaire.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (14, 48, CAST(N'2024-02-06T00:00:00.000' AS DateTime), NULL, 1, N'Les cours en temps réel ne s''affichent pas correctement.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (15, 60, CAST(N'2024-03-11T00:00:00.000' AS DateTime), NULL, 1, N'Les plans d''entraînement ne se chargent pas.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (16, 70, CAST(N'2024-02-16T00:00:00.000' AS DateTime), NULL, 1, N'Les messages de soutien ne s''affichent pas.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (17, 31, CAST(N'2024-01-21T00:00:00.000' AS DateTime), NULL, 1, N'Les gains ne sont pas calculés correctement dans le simulateur.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (18, 46, CAST(N'2024-02-26T00:00:00.000' AS DateTime), NULL, 1, N'Les outils d''analyse technique ne sont pas disponibles.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (19, 54, CAST(N'2024-02-02T00:00:00.000' AS DateTime), CAST(N'2024-02-20T00:00:00.000' AS DateTime), 2, N'Les exercices de yoga ne sont pas inclus dans les plans d''entraînement.', N'Une mise à jour a ajouté des exercices de yoga aux plans.')
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (20, 67, CAST(N'2024-02-07T00:00:00.000' AS DateTime), CAST(N'2024-03-01T00:00:00.000' AS DateTime), 2, N'Les statistiques d''humeur ne se mettent pas à jour.', N'Une correction a été apportée pour mettre à jour les statistiques.')
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (21, 36, CAST(N'2024-02-12T00:00:00.000' AS DateTime), CAST(N'2024-02-25T00:00:00.000' AS DateTime), 2, N'Les informations de portefeuille ne sont pas synchronisées avec le serveur.', N'Une mise à jour a corrigé la synchronisation des données.')
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (22, 51, CAST(N'2024-02-17T00:00:00.000' AS DateTime), CAST(N'2024-03-05T00:00:00.000' AS DateTime), 2, N'Les actualités financières ne s''affichent pas correctement.', N'Une mise à jour a permis d''afficher les actualités correctement.')
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (23, 53, CAST(N'2024-02-22T00:00:00.000' AS DateTime), NULL, 1, N'Les statistiques de performance ne sont pas enregistrées.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (24, 72, CAST(N'2024-02-27T00:00:00.000' AS DateTime), NULL, 1, N'Les défis d''exposition ne sont pas sauvegardés.', NULL)
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (25, 37, CAST(N'2024-03-03T00:00:00.000' AS DateTime), CAST(N'2024-03-10T00:00:00.000' AS DateTime), 2, N'Les notifications d''achat ne sont pas envoyées.', N'Une mise à jour a rétabli l''envoi des notifications.')
INSERT [dbo].[Ticket] ([Id], [Id Produit Systeme_exploitation], [Date Creation], [Date Resolution], [Statut], [Probleme], [Resolution]) VALUES (26, 50, CAST(N'2024-03-08T00:00:00.000' AS DateTime), NULL, 1, N'Les outils de comparaison ne sont pas disponibles.', NULL)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
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
