USE [master]
GO
/****** Object:  Database [LearnSchool]    Script Date: 18.12.2021 14:13:08 ******/
CREATE DATABASE [LearnSchool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LearnSchool', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LERAY\MSSQL\DATA\LearnSchool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LearnSchool_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LERAY\MSSQL\DATA\LearnSchool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LearnSchool] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LearnSchool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LearnSchool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LearnSchool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LearnSchool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LearnSchool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LearnSchool] SET ARITHABORT OFF 
GO
ALTER DATABASE [LearnSchool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LearnSchool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LearnSchool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LearnSchool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LearnSchool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LearnSchool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LearnSchool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LearnSchool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LearnSchool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LearnSchool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LearnSchool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LearnSchool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LearnSchool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LearnSchool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LearnSchool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LearnSchool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LearnSchool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LearnSchool] SET RECOVERY FULL 
GO
ALTER DATABASE [LearnSchool] SET  MULTI_USER 
GO
ALTER DATABASE [LearnSchool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LearnSchool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LearnSchool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LearnSchool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LearnSchool] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LearnSchool] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LearnSchool', N'ON'
GO
ALTER DATABASE [LearnSchool] SET QUERY_STORE = OFF
GO
USE [LearnSchool]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 18.12.2021 14:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 18.12.2021 14:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 18.12.2021 14:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 18.12.2021 14:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 18.12.2021 14:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18.12.2021 14:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 18.12.2021 14:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 18.12.2021 14:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 18.12.2021 14:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 18.12.2021 14:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 18.12.2021 14:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 18.12.2021 14:13:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (101, N'Оскар', N'Васильев', N'Богданович', CAST(N'1971-01-30' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N'miturria@verizon.net', N'7(585)801-94-29 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (102, N'Алексей', N'Лазарев', N'Богданович', CAST(N'1977-03-10' AS Date), CAST(N'2017-01-02T00:00:00.000' AS DateTime), N'claesjac@me.com', N'7(0055)737-37-48 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (103, N'Дмитрий', N'Казаков', N'Русланович', CAST(N'1978-12-15' AS Date), CAST(N'2016-05-21T00:00:00.000' AS DateTime), N'ozawa@verizon.net', N'7(51)682-19-40 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (104, N'Харита', N'Попова', N'Якуновна', CAST(N'1997-12-16' AS Date), CAST(N'2016-07-05T00:00:00.000' AS DateTime), N'firstpr@verizon.net', N'7(335)386-81-06 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (105, N'Георгина', N'Турова', N'Семёновна', CAST(N'1974-05-28' AS Date), CAST(N'2018-02-22T00:00:00.000' AS DateTime), N'yruan@optonline.net', N'7(555)321-42-99 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (106, N'Станислав', N'Андреев', N'Максович', CAST(N'1975-10-10' AS Date), CAST(N'2017-12-26T00:00:00.000' AS DateTime), N'budinger@mac.com', N'7(02)993-91-28 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (107, N'Влада', N'Орлова', N'Мартыновна', CAST(N'1990-06-26' AS Date), CAST(N'2016-03-21T00:00:00.000' AS DateTime), N'rnelson@yahoo.ca', N'7(2506)433-38-35 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (108, N'Любава', N'Костина', N'Авксентьевна', CAST(N'1972-07-13' AS Date), CAST(N'2016-02-26T00:00:00.000' AS DateTime), N'gordonjcp@hotmail.com', N'7(6419)959-21-87 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (109, N'Станислав', N'Александров', N'Эдуардович', CAST(N'1981-07-04' AS Date), CAST(N'2018-11-08T00:00:00.000' AS DateTime), N'bigmauler@aol.com', N'7(18)164-05-12 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (110, N'Анэля', N'Корнилова', N'Михайловна', CAST(N'1973-04-02' AS Date), CAST(N'2016-05-22T00:00:00.000' AS DateTime), N'jonathan@aol.com', N'7(20)980-01-60 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (111, N'Наум', N'Морозов', N'Валерьянович', CAST(N'1985-07-04' AS Date), CAST(N'2016-05-02T00:00:00.000' AS DateTime), N'salesgeek@mac.com', N'7(636)050-96-13 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (112, N'Эльмира', N'Баранова', N'Дмитриевна', CAST(N'1977-01-15' AS Date), CAST(N'2016-07-08T00:00:00.000' AS DateTime), N'jgmyers@comcast.net', N'7(9240)643-15-50 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (113, N'Амелия', N'Степанова', N'Робертовна', CAST(N'1970-06-06' AS Date), CAST(N'2017-09-27T00:00:00.000' AS DateTime), N'rasca@hotmail.com', N'7(1217)441-28-42 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (114, N'Давид', N'Горбачёв', N'Тимурович', CAST(N'1983-05-22' AS Date), CAST(N'2018-12-17T00:00:00.000' AS DateTime), N'hedwig@att.net', N'7(53)602-85-41 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (115, N'Людвиг', N'Волков', N'Витальевич', CAST(N'1977-12-27' AS Date), CAST(N'2016-04-27T00:00:00.000' AS DateTime), N'jrkorson@msn.com', N'7(8459)592-05-58 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (116, N'Амалия', N'Комиссарова', N'Робертовна', CAST(N'1971-08-18' AS Date), CAST(N'2017-08-04T00:00:00.000' AS DateTime), N'jorgb@msn.com', N'7(22)647-46-32 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (117, N'Вадим', N'Большаков', N'Данилович', CAST(N'1970-05-15' AS Date), CAST(N'2018-08-04T00:00:00.000' AS DateTime), N'uncle@gmail.com', N'7(386)641-13-37 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (118, N'Станислав', N'Абрамов', N'Филатович', CAST(N'1989-05-18' AS Date), CAST(N'2016-12-08T00:00:00.000' AS DateTime), N'solomon@att.net', N'7(6545)478-87-79 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (119, N'Леонтий', N'Журавлёв', N'Яковлевич', CAST(N'2000-03-02' AS Date), CAST(N'2018-01-15T00:00:00.000' AS DateTime), N'cmdrgravy@me.com', N'7(4403)308-56-96 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (120, N'Глеб', N'Селиверстов', N'Максимович', CAST(N'1999-06-20' AS Date), CAST(N'2016-01-07T00:00:00.000' AS DateTime), N'jigsaw@sbcglobal.net', N'7(20)554-28-68 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (121, N'Устин', N'Киселёв', N'Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N'dalamb@verizon.net', N'7(83)334-52-76 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (122, N'Матвей', N'Зуев', N'Иванович', CAST(N'1981-03-28' AS Date), CAST(N'2018-12-18T00:00:00.000' AS DateTime), N'brickbat@verizon.net', N'7(5383)893-04-66 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (123, N'Глеб', N'Ершов', N'Федорович', CAST(N'1970-06-14' AS Date), CAST(N'2016-09-14T00:00:00.000' AS DateTime), N'sjava@aol.com', N'7(2608)298-40-82 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (124, N'Георгий', N'Бобылёв', N'Витальевич', CAST(N'1983-12-19' AS Date), CAST(N'2018-04-06T00:00:00.000' AS DateTime), N'csilvers@mac.com', N'7(88)685-13-51 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (125, N'Витольд', N'Ефремов', N'Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'2018-04-09T00:00:00.000' AS DateTime), N'kwilliams@yahoo.ca', N'7(93)922-14-03 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (126, N'Патрисия', N'Андреева', N'Валерьевна', CAST(N'1993-11-18' AS Date), CAST(N'2016-07-17T00:00:00.000' AS DateTime), N'jigsaw@aol.com', N'7(9648)953-81-26 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (127, N'Магда', N'Ефимова', N'Платоновна', CAST(N'1995-08-16' AS Date), CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'rbarreira@me.com', N'7(9261)386-15-92 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (128, N'Иосиф', N'Голубев', N'Тимофеевич', CAST(N'1982-05-06' AS Date), CAST(N'2018-08-18T00:00:00.000' AS DateTime), N'smcnabb@att.net', N'7(78)972-73-11 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (129, N'Макар', N'Евсеев', N'Васильевич', CAST(N'1977-09-13' AS Date), CAST(N'2018-12-05T00:00:00.000' AS DateTime), N'parsimony@sbcglobal.net', N'7(2141)077-85-70 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (130, N'Агафон', N'Бобров', N'Лаврентьевич', CAST(N'1995-07-29' AS Date), CAST(N'2017-05-09T00:00:00.000' AS DateTime), N'petersen@comcast.net', N'7(2159)507-39-57 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (131, N'Захар', N'Игнатов', N'Павлович', CAST(N'1998-10-07' AS Date), CAST(N'2017-11-10T00:00:00.000' AS DateTime), N'dieman@icloud.com', N'7(578)574-73-36 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (132, N'Янита', N'Гущина', N'Федоровна', CAST(N'1999-03-02' AS Date), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N'lishoy@att.net', N'7(4544)716-68-96 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (133, N'Артур', N'Калашников', N'Юрьевич', CAST(N'1972-12-13' AS Date), CAST(N'2017-08-20T00:00:00.000' AS DateTime), N'oevans@aol.com', N'7(147)947-47-21 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (134, N'Элина', N'Дмитриева', N'Даниловна', CAST(N'1988-12-10' AS Date), CAST(N'2017-02-11T00:00:00.000' AS DateTime), N'vmalik@live.com', N'7(787)140-48-84 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (135, N'Сандра', N'Федотова', N'Владленовна', CAST(N'1985-03-29' AS Date), CAST(N'2016-11-08T00:00:00.000' AS DateTime), N'penna@verizon.net', N'7(126)195-25-86 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (136, N'Дэнна', N'Кузьмина', N'Витальевна', CAST(N'1993-08-24' AS Date), CAST(N'2016-03-27T00:00:00.000' AS DateTime), N'nichoj@mac.com', N'7(9940)977-45-73 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (137, N'Злата', N'Колобова', N'Романовна', CAST(N'1994-08-25' AS Date), CAST(N'2016-12-03T00:00:00.000' AS DateTime), N'sinkou@aol.com', N'7(50)884-07-35 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (138, N'Варлам', N'Некрасов', N'Михайлович', CAST(N'2000-11-12' AS Date), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'dogdude@verizon.net', N'7(019)258-06-35 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (139, N'Орест', N'Колобов', N'Юлианович', CAST(N'2001-07-14' AS Date), CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'parkes@verizon.net', N'7(1680)508-58-26 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (140, N'Пантелеймон', N'Блохин', N'Феликсович', CAST(N'1978-03-06' AS Date), CAST(N'2018-02-14T00:00:00.000' AS DateTime), N'balchen@comcast.net', N'7(9524)556-48-98 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (141, N'Петр', N'Калинин', N'Иванович', CAST(N'1993-09-08' AS Date), CAST(N'2016-05-26T00:00:00.000' AS DateTime), N'aschmitz@hotmail.com', N'7(90)316-07-17 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (142, N'Сабрина', N'Беляева', N'Федосеевна', CAST(N'1972-07-26' AS Date), CAST(N'2017-06-14T00:00:00.000' AS DateTime), N'agapow@gmail.com', N'7(6580)534-32-58 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (143, N'Юстиниан', N'Агафонов', N'Олегович', CAST(N'1997-02-02' AS Date), CAST(N'2016-06-08T00:00:00.000' AS DateTime), N'staffelb@sbcglobal.net', N'7(303)810-28-78 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (144, N'Марфа', N'Мамонтова', N'Мироновна', CAST(N'1984-10-19' AS Date), CAST(N'2018-02-27T00:00:00.000' AS DateTime), N'rfoley@verizon.net', N'7(38)095-64-18 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (145, N'Евгений', N'Блинов', N'Мэлсович', CAST(N'1994-01-05' AS Date), CAST(N'2017-05-07T00:00:00.000' AS DateTime), N'moxfulder@outlook.com', N'7(0852)321-82-64 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (146, N'Изабелла', N'Воронова', N'Вячеславовна', CAST(N'1999-09-24' AS Date), CAST(N'2017-12-21T00:00:00.000' AS DateTime), N'kildjean@sbcglobal.net', N'7(17)433-44-98 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (147, N'Святослав', N'Медведев', N'Юлианович', CAST(N'1972-10-04' AS Date), CAST(N'2018-10-13T00:00:00.000' AS DateTime), N'hllam@comcast.net', N'7(3520)435-21-20 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (148, N'Эвелина', N'Куликова', N'Вячеславовна', CAST(N'1997-11-14' AS Date), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N'ilikered@hotmail.com', N'7(0236)682-42-78 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (149, N'Божена', N'Суворова', N'Анатольевна', CAST(N'1981-03-09' AS Date), CAST(N'2016-01-28T00:00:00.000' AS DateTime), N'attwood@aol.com', N'7(347)895-86-57 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (150, N'Амалия', N'Егорова', N'Дамировна', CAST(N'1999-09-28' AS Date), CAST(N'2016-06-30T00:00:00.000' AS DateTime), N'drezet@yahoo.com', N'7(7486)408-12-26 ', N'2', NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'1', N'м')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'2', N'ж')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (101, N'Занятие с репетитором-носителем китайского языка', 1950.0000, 120, N'', NULL, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (102, N'Индивидуальный урок немецкого языка с преподавателем-носителем языка', 1340.0000, 110, N'', NULL, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (103, N'Киноклуб китайского языка для студентов', 1990.0000, 100, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (104, N'Индивидуальный онлайн-урок японского языка по Skype', 1000.0000, 4800, N'', NULL, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (105, N'Киноклуб испанского языка для студентов', 1050.0000, 40, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (106, N'Занятие с русскоязычным репетитором испанского языка', 1450.0000, 50, N'', NULL, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (107, N'Урок в группе итальянского языка для взрослых', 1290.0000, 40, N'', NULL, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (108, N'Интенсивный онлайн-курс французского языка для компаний по Skype', 1180.0000, 2400, N'', NULL, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (109, N'Индивидуальный урок французского языка с преподавателем-носителем языка', 1410.0000, 2400, N'', NULL, N' Услуги школы\Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (110, N'Урок в группе французского языка для школьников', 1970.0000, 6000, N'', NULL, N' Услуги школы\Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (111, N'Занятие с репетитором-носителем английского языка', 910.0000, 6600, N'', NULL, N' Услуги школы\Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (112, N'Киноклуб французского языка для взрослых', 1770.0000, 5400, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (113, N'Киноклуб немецкого языка для взрослых', 1560.0000, 100, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (114, N'Урок в группе японского языка для школьников', 1300.0000, 80, N'', NULL, N' Услуги школы\Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (115, N'Индивидуальный урок испанского языка с русскоязычным преподавателем', 1790.0000, 60, N'', NULL, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (116, N'Интенсивный онлайн-курс итальянского языка для компаний по Skype', 1230.0000, 4200, N'', NULL, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (117, N'Урок в группе японского языка для студентов', 1860.0000, 3000, N'', NULL, N' Услуги школы\Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (118, N'Интенсивный курс с преподавателем-носителем английского языка для компаний', 1670.0000, 110, N'', NULL, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (119, N'Киноклуб итальянского языка для студентов', 1760.0000, 30, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (120, N'Урок в группе испанского языка для взрослых', 1730.0000, 1800, N'', NULL, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (121, N'Урок в группе испанского языка для студентов', 1310.0000, 100, N'', NULL, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (122, N'Интенсивный онлайн-курс испанского языка для компаний по Skype', 1510.0000, 120, N'', NULL, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (123, N'Урок в группе английского языка для школьников', 900.0000, 6600, N'', NULL, N' Услуги школы\Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (124, N'Занятие с репетитором-носителем испанского языка', 1090.0000, 3000, N'', NULL, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (125, N'Интенсивный курс с преподавателем-носителем итальянского языка для компаний', 1190.0000, 2400, N'', NULL, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (126, N'Урок в группе китайского языка для студентов', 2000.0000, 2400, N'', NULL, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (127, N'Индивидуальный урок испанского языка с преподавателем-носителем языка', 1200.0000, 90, N'', NULL, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (128, N'Интенсивный онлайн-курс португальского языка для компаний по Skype', 1610.0000, 70, N'', NULL, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (129, N'Подготовка к экзамену ACT', 1440.0000, 50, N'', NULL, N' Услуги школы\Подготовка к экзамену ACT.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (130, N'Урок в группе китайского языка для взрослых', 1730.0000, 4200, N'', NULL, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (131, N'Интенсивный онлайн-курс английского языка для компаний по Skype', 1160.0000, 3000, N'', NULL, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (132, N'Подготовка к экзамену TOEFL', 1070.0000, 6000, N'', NULL, N' Услуги школы\Подготовка к экзамену TOEFL.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (133, N'Занятие с репетитором-носителем итальянского языка', 1370.0000, 7200, N'', NULL, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (134, N'Урок в группе английского языка для взрослых', 1010.0000, 3000, N'', NULL, N' Услуги школы\Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (135, N'Киноклуб английского языка для взрослых', 1250.0000, 70, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (136, N'Интенсивный курс с преподавателем-носителем французского языка для компаний', 1630.0000, 70, N'', NULL, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (137, N'Урок в группе испанского языка для школьников', 1910.0000, 7200, N'', NULL, N' Услуги школы\Испанский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (138, N'Подготовка к экзамену GRE', 1300.0000, 80, N'', NULL, N' Услуги школы\Подготовка к экзамену GRE.jpeg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (139, N'Урок в группе английского языка для студентов', 960.0000, 4800, N'', NULL, N' Услуги школы\Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (140, N'Занятие с русскоязычным репетитором японского языка', 1260.0000, 2400, N'', NULL, N' Услуги школы\Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (141, N'Индивидуальный онлайн-урок немецкого языка по Skype', 970.0000, 90, N'', NULL, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (142, N'Интенсивный курс японского языка с русскоязычным преподавателем для компаний', 1500.0000, 80, N'', NULL, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (143, N'Киноклуб китайского языка для взрослых', 1800.0000, 70, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (144, N'Индивидуальный урок китайского языка с русскоязычным преподавателем', 1860.0000, 120, N'', NULL, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (145, N'Подготовка к экзамену GMAT', 1150.0000, 70, N'', NULL, N' Услуги школы\Подготовка к экзамену GMAT.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (146, N'Подготовка к экзамену IELTS', 1730.0000, 7200, N'', NULL, N' Услуги школы\Подготовка к экзамену IELTS.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (147, N'Подготовка к экзамену SAT', 1560.0000, 40, N'', NULL, N' Услуги школы\Подготовка к экзамену SAT.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (148, N'Урок в группе китайского языка для школьников', 1180.0000, 3000, N'', NULL, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (149, N'Киноклуб английского языка для студентов', 980.0000, 4800, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (150, N'Киноклуб португальского языка для студентов', 1170.0000, 1800, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (151, N'Киноклуб китайского языка для детей', 1120.0000, 100, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (152, N'Урок в группе немецкого языка для школьников', 1570.0000, 1800, N'', NULL, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (153, N'Индивидуальный онлайн-урок испанского языка по Skype', 1780.0000, 4200, N'', NULL, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (154, N'Урок в группе немецкого языка для взрослых', 930.0000, 60, N'', NULL, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (155, N'Индивидуальный урок китайского языка с преподавателем-носителем языка', 1480.0000, 90, N'', NULL, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (156, N'Занятие с русскоязычным репетитором португальского языка', 1970.0000, 3000, N'', NULL, N' Услуги школы\Португальский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (157, N'Интенсивный курс китайского языка с русскоязычным преподавателем для компаний', 1470.0000, 6600, N'', NULL, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (158, N'Занятие с русскоязычным репетитором немецкого языка', 1420.0000, 1800, N'', NULL, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (159, N'Киноклуб английского языка для детей', 1280.0000, 2400, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (160, N'Занятие с репетитором-носителем немецкого языка', 1120.0000, 7200, N'', NULL, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (161, N'Индивидуальный онлайн-урок китайского языка по Skype', 1410.0000, 4200, N'', NULL, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (162, N'Индивидуальный урок английского языка с преподавателем-носителем языка', 1300.0000, 7200, N'', NULL, N' Услуги школы\Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (163, N'Интенсивный курс с преподавателем-носителем немецкого языка для компаний', 1180.0000, 120, N'', NULL, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (164, N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', 1840.0000, 4200, N'', NULL, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (165, N'Урок в группе итальянского языка для школьников', 1410.0000, 6000, N'', NULL, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (166, N'Индивидуальный урок итальянского языка с русскоязычным преподавателем', 1330.0000, 30, N'', NULL, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (167, N'Интенсивный онлайн-курс китайского языка для компаний по Skype', 1760.0000, 120, N'', NULL, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (168, N'Занятие с русскоязычным репетитором французского языка', 1870.0000, 6000, N'', NULL, N' Услуги школы\Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (169, N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', 990.0000, 1800, N'', NULL, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (170, N'Индивидуальный онлайн-урок английского языка по Skype', 1880.0000, 6000, N'', NULL, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (171, N'Индивидуальный урок французского языка с русскоязычным преподавателем', 1390.0000, 4200, N'', NULL, N' Услуги школы\Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (172, N'Интенсивный курс португальского языка с русскоязычным преподавателем для компаний', 2010.0000, 60, N'', NULL, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (173, N'Индивидуальный онлайн-урок французского языка по Skype', 2010.0000, 7200, N'', NULL, N' Услуги школы\online lessons.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (174, N'Интенсивный курс английского языка с русскоязычным преподавателем для компаний', 1210.0000, 4800, N'', NULL, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (175, N'Урок в группе французского языка для взрослых', 960.0000, 120, N'', NULL, N' Услуги школы\Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (176, N'Подготовка к экзамену IELTS Speaking Club', 1430.0000, 90, N'', NULL, N' Услуги школы\Подготовка к экзамену IELTS.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (177, N'Киноклуб итальянского языка для детей', 1480.0000, 70, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (178, N'Урок в группе итальянского языка для студентов', 1020.0000, 110, N'', NULL, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (179, N'Индивидуальный урок итальянского языка с преподавателем-носителем языка', 1690.0000, 80, N'', NULL, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (180, N'Киноклуб немецкого языка для детей', 1670.0000, 120, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (181, N'Киноклуб итальянского языка для взрослых', 1760.0000, 110, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (182, N'Киноклуб португальского языка для взрослых', 950.0000, 1800, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (183, N'Киноклуб португальского языка для детей', 1710.0000, 90, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (184, N'Киноклуб французского языка для детей', 1600.0000, 90, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (185, N'Урок в группе японского языка для взрослых', 1420.0000, 80, N'', NULL, N' Услуги школы\Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (186, N'Интенсивный курс французского языка с русскоязычным преподавателем для компаний', 1940.0000, 40, N'', NULL, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (187, N'Занятие с русскоязычным репетитором итальянского языка', 1620.0000, 4200, N'', NULL, N' Услуги школы\Итальянский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (188, N'Индивидуальный урок английского языка с русскоязычным преподавателем', 1910.0000, 30, N'', NULL, N' Услуги школы\Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (189, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', 1580.0000, 30, N'', NULL, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (190, N'Интенсивный курс испанского языка с русскоязычным преподавателем для компаний', 1000.0000, 5400, N'', NULL, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (191, N'Киноклуб немецкого языка для студентов', 1140.0000, 50, N'', NULL, N' Услуги школы\киноклуб.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (192, N'Занятие с репетитором-носителем французского языка', 2040.0000, 50, N'', NULL, N' Услуги школы\Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (193, N'Урок в группе немецкого языка для студентов', 1240.0000, 4200, N'', NULL, N' Услуги школы\Немецкий язык.png')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (194, N'Занятие с русскоязычным репетитором китайского языка', 940.0000, 6600, N'', NULL, N' Услуги школы\Китайский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (195, N'Занятие с репетитором-носителем японского языка', 1100.0000, 3000, N'', NULL, N' Услуги школы\Японский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (196, N'Урок в группе французского языка для студентов', 1910.0000, 1800, N'', NULL, N' Услуги школы\Французский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (197, N'Интенсивный курс итальянского языка с русскоязычным преподавателем для компаний', 900.0000, 110, N'', NULL, N' Услуги школы\for company.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (198, N'Занятие с русскоязычным репетитором английского языка', 1950.0000, 90, N'', NULL, N' Услуги школы\Английский язык.jpg')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (199, N'Интенсивный курс с преподавателем-носителем испанского языка для компаний', 1660.0000, 90, N'', NULL, N' Услуги школы\for company.jpg')
GO
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (200, N'Интенсивный курс с преподавателем-носителем японского языка для компаний', 1380.0000, 4200, N'', NULL, N' Услуги школы\for company.jpg')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (1, N'A0', N'White ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (2, N'A1', N'White ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (3, N'B0', N'Red   ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (4, N'B1', N'Red   ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (5, N'C0', N'Yellow')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (6, N'C1', N'Yellow')
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [LearnSchool] SET  READ_WRITE 
GO
