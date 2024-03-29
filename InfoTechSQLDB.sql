USE [master]
GO
/****** Object:  Database [InfoTechDB]    Script Date: 18.02.2024 12:12:09 ******/
CREATE DATABASE [InfoTechDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InfoTechDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\InfoTechDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InfoTechDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\InfoTechDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [InfoTechDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InfoTechDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InfoTechDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InfoTechDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InfoTechDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InfoTechDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InfoTechDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [InfoTechDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InfoTechDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InfoTechDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InfoTechDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InfoTechDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InfoTechDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InfoTechDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InfoTechDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InfoTechDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InfoTechDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InfoTechDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InfoTechDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InfoTechDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InfoTechDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InfoTechDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InfoTechDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InfoTechDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InfoTechDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InfoTechDB] SET  MULTI_USER 
GO
ALTER DATABASE [InfoTechDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InfoTechDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InfoTechDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InfoTechDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InfoTechDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InfoTechDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InfoTechDB] SET QUERY_STORE = OFF
GO
USE [InfoTechDB]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 18.02.2024 12:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](50) NOT NULL,
	[KategoriAciklama] [nvarchar](max) NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 18.02.2024 12:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[musteriNo] [int] NULL,
	[ad] [nvarchar](50) NULL,
	[soyad] [nvarchar](50) NULL,
	[dTarih] [date] NULL,
	[sehir] [nvarchar](50) NULL,
	[cinsiyet] [nvarchar](5) NULL,
	[puan] [int] NULL,
	[meslek] [nvarchar](50) NULL,
	[gelir] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 18.02.2024 12:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[personelNo] [int] IDENTITY(1000,1) NOT NULL,
	[adi] [nvarchar](50) NULL,
	[soyadi] [nvarchar](50) NULL,
	[gorevi] [nvarchar](50) NULL,
	[yoneticisi] [int] NULL,
	[girisTarihi] [date] NULL,
	[ucret] [money] NULL,
 CONSTRAINT [PK_Personel] PRIMARY KEY CLUSTERED 
(
	[personelNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 18.02.2024 12:12:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [nvarchar](50) NOT NULL,
	[UrunAciklamasi] [nvarchar](max) NULL,
	[UrunFiyati] [money] NOT NULL,
	[UrunStokAdet] [int] NOT NULL,
	[KategoriRefID] [int] NOT NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi], [KategoriAciklama]) VALUES (1, N'Elektronik', N'Elektronik eşyalar')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi], [KategoriAciklama]) VALUES (2, N'Beyaz Eşya', N'Buzdolabı, fırın, çam mak.')
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAdi], [KategoriAciklama]) VALUES (3, N'Mobilya', N'Sehpa, Masa, Koltuk')
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
GO
INSERT [dbo].[Musteriler] ([musteriNo], [ad], [soyad], [dTarih], [sehir], [cinsiyet], [puan], [meslek], [gelir]) VALUES (1, N'Ali', N'Veli', CAST(N'1999-01-01' AS Date), N'Burdur', N'Erkek', 55, N'Ofisboy', 40000)
INSERT [dbo].[Musteriler] ([musteriNo], [ad], [soyad], [dTarih], [sehir], [cinsiyet], [puan], [meslek], [gelir]) VALUES (2, N'Ayşe', N'Yılmaz', CAST(N'1998-06-06' AS Date), N'Ankara', N'Kadin', 60, N'Yazılım', 80000)
INSERT [dbo].[Musteriler] ([musteriNo], [ad], [soyad], [dTarih], [sehir], [cinsiyet], [puan], [meslek], [gelir]) VALUES (3, N'Türker', N'Can', CAST(N'1996-01-05' AS Date), N'Adana', N'Erkek', 80, N'Memur', 40000)
INSERT [dbo].[Musteriler] ([musteriNo], [ad], [soyad], [dTarih], [sehir], [cinsiyet], [puan], [meslek], [gelir]) VALUES (4, N'Osman', N'Yıldız', CAST(N'2000-01-01' AS Date), N'Kars', N'Erkek', 55, N'Muhasebeci', 17002)
GO
SET IDENTITY_INSERT [dbo].[Personel] ON 

INSERT [dbo].[Personel] ([personelNo], [adi], [soyadi], [gorevi], [yoneticisi], [girisTarihi], [ucret]) VALUES (1000, N'Ali', N'Veli', N'Yazılımcı', 1, CAST(N'2000-01-01' AS Date), 56000.0000)
INSERT [dbo].[Personel] ([personelNo], [adi], [soyadi], [gorevi], [yoneticisi], [girisTarihi], [ucret]) VALUES (1001, N'Veli', N'Can', N'Analist', 2, CAST(N'2000-01-01' AS Date), 50000.0000)
INSERT [dbo].[Personel] ([personelNo], [adi], [soyadi], [gorevi], [yoneticisi], [girisTarihi], [ucret]) VALUES (1002, N'Ayşe', N'Yıldız', N'Sql Uzmanı', 1, CAST(N'2000-01-01' AS Date), 36500.0000)
SET IDENTITY_INSERT [dbo].[Personel] OFF
GO
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [UrunAciklamasi], [UrunFiyati], [UrunStokAdet], [KategoriRefID]) VALUES (1, N'Asus Laptop', N'Çok iyi', 25000.0000, 36, 1)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [UrunAciklamasi], [UrunFiyati], [UrunStokAdet], [KategoriRefID]) VALUES (3, N'Tablet IOS', N'İdare Eder', 30000.0000, 20, 1)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [UrunAciklamasi], [UrunFiyati], [UrunStokAdet], [KategoriRefID]) VALUES (4, N'Arçelik Buzdolabı', N'Dayanıklı', 40000.0000, 50, 2)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [UrunAciklamasi], [UrunFiyati], [UrunStokAdet], [KategoriRefID]) VALUES (5, N'Samsung Fırın', N'Sağlam', 15000.0000, 22, 2)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [UrunAciklamasi], [UrunFiyati], [UrunStokAdet], [KategoriRefID]) VALUES (6, N'Köşe Koltuk', N'Köşeyi dönenlere', 25000.0000, 10, 3)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [UrunAciklamasi], [UrunFiyati], [UrunStokAdet], [KategoriRefID]) VALUES (7, N'Sehpa', N'İyi sehpa', 5000.0000, 25, 3)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [UrunAciklamasi], [UrunFiyati], [UrunStokAdet], [KategoriRefID]) VALUES (8, N'TV', N'', 25000.0000, 12, 1)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [UrunAciklamasi], [UrunFiyati], [UrunStokAdet], [KategoriRefID]) VALUES (9, N'Dolap', N'', 3000.0000, 25, 3)
INSERT [dbo].[Urunler] ([UrunID], [UrunAdi], [UrunAciklamasi], [UrunFiyati], [UrunStokAdet], [KategoriRefID]) VALUES (10, N'Kurutma Mak.', N'', 12500.0000, 12, 2)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Kategoriler] FOREIGN KEY([KategoriRefID])
REFERENCES [dbo].[Kategoriler] ([KategoriID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Kategoriler]
GO
USE [master]
GO
ALTER DATABASE [InfoTechDB] SET  READ_WRITE 
GO
