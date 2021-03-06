USE [master]
GO
/****** Object:  Database [nadhemnidata]    Script Date: 08/06/2020 01:03:56 ******/
CREATE DATABASE [nadhemnidata]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nadhemnidata', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\nadhemnidata.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'nadhemnidata_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\nadhemnidata_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [nadhemnidata] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [nadhemnidata].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [nadhemnidata] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [nadhemnidata] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [nadhemnidata] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [nadhemnidata] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [nadhemnidata] SET ARITHABORT OFF 
GO
ALTER DATABASE [nadhemnidata] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [nadhemnidata] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [nadhemnidata] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [nadhemnidata] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [nadhemnidata] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [nadhemnidata] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [nadhemnidata] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [nadhemnidata] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [nadhemnidata] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [nadhemnidata] SET  ENABLE_BROKER 
GO
ALTER DATABASE [nadhemnidata] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [nadhemnidata] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [nadhemnidata] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [nadhemnidata] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [nadhemnidata] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [nadhemnidata] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [nadhemnidata] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [nadhemnidata] SET RECOVERY FULL 
GO
ALTER DATABASE [nadhemnidata] SET  MULTI_USER 
GO
ALTER DATABASE [nadhemnidata] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [nadhemnidata] SET DB_CHAINING OFF 
GO
ALTER DATABASE [nadhemnidata] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [nadhemnidata] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [nadhemnidata] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'nadhemnidata', N'ON'
GO
ALTER DATABASE [nadhemnidata] SET QUERY_STORE = OFF
GO
USE [nadhemnidata]
GO
/****** Object:  Table [dbo].[adresse]    Script Date: 08/06/2020 01:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adresse](
	[id_adresse] [int] IDENTITY(1,1) NOT NULL,
	[numero] [varchar](50) NULL,
	[rue] [varchar](50) NULL,
	[localisation] [varchar](50) NULL,
	[id_persone] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_adresse] ASC,
	[id_persone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personne]    Script Date: 08/06/2020 01:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personne](
	[id_personne] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NULL,
	[prenom] [varchar](50) NULL,
	[date_de_naissance] [datetime] NULL,
	[genre] [varchar](50) NULL,
	[fonction] [varchar](50) NULL,
	[photo] [binary](50) NULL,
	[etat_civil] [varchar](50) NULL,
	[nbre_enfant] [int] NULL,
	[etat_sante] [varchar](50) NULL,
	[etablissement] [varchar](50) NULL,
	[niveau_etude] [varchar](50) NULL,
	[distance] [varchar](50) NULL,
	[mail] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_personne] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plan]    Script Date: 08/06/2020 01:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plan](
	[id_taches] [int] NOT NULL,
	[id_prop] [int] NOT NULL,
	[date_heure_debut] [datetime] NULL,
	[date_heure_fin] [datetime] NULL,
	[accomplie] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_taches] ASC,
	[id_prop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tache]    Script Date: 08/06/2020 01:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tache](
	[id_tache] [int] IDENTITY(1,1) NOT NULL,
	[titre] [varchar](50) NOT NULL,
	[description] [text] NULL,
	[duree] [int] NULL,
	[emplacement] [varchar](50) NULL,
	[personne_imp] [int] NULL,
	[type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tache] PRIMARY KEY CLUSTERED 
(
	[id_tache] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 08/06/2020 01:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[id_pers] [int] NOT NULL,
	[login] [varchar](50) NULL,
	[pass] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pers] ASC,
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[plan] ADD  DEFAULT ((0)) FOR [accomplie]
GO
ALTER TABLE [dbo].[tache] ADD  DEFAULT ('nom_tache') FOR [titre]
GO
ALTER TABLE [dbo].[adresse]  WITH CHECK ADD  CONSTRAINT [FK_adresee_personne] FOREIGN KEY([id_persone])
REFERENCES [dbo].[personne] ([id_personne])
GO
ALTER TABLE [dbo].[adresse] CHECK CONSTRAINT [FK_adresee_personne]
GO
ALTER TABLE [dbo].[plan]  WITH CHECK ADD  CONSTRAINT [FK_plan_personne] FOREIGN KEY([id_prop])
REFERENCES [dbo].[personne] ([id_personne])
GO
ALTER TABLE [dbo].[plan] CHECK CONSTRAINT [FK_plan_personne]
GO
ALTER TABLE [dbo].[plan]  WITH CHECK ADD  CONSTRAINT [FK_plan_tache] FOREIGN KEY([id_taches])
REFERENCES [dbo].[tache] ([id_tache])
GO
ALTER TABLE [dbo].[plan] CHECK CONSTRAINT [FK_plan_tache]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_personne] FOREIGN KEY([id_pers])
REFERENCES [dbo].[personne] ([id_personne])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_personne]
GO
USE [master]
GO
ALTER DATABASE [nadhemnidata] SET  READ_WRITE 
GO
