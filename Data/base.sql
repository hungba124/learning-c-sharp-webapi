USE [LangBatDongSan43]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Picture]    Script Date: 2023-06-14 22:46:15 ******/

CREATE TABLE [dbo].[Picture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MimeType] [nvarchar](40) NOT NULL,
	[SeoFilename] [nvarchar](300) NULL,
	[AltAttribute] [nvarchar](300) NULL,
	[TitleAttribute] [nvarchar](300) NULL,
	[VirtualPath] [nvarchar](300) NULL,
	[Source] [nvarchar](500) NULL,
	[IsNew] [bit] NOT NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PictureBinary]    Script Date: 2023-06-14 22:46:27 ******/

CREATE TABLE [dbo].[PictureBinary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PictureId] [int] NOT NULL,
	[BinaryData] [varbinary](max) NULL,
 CONSTRAINT [PK_PictureBinary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[PictureBinary]  WITH CHECK ADD  CONSTRAINT [FK_PictureBinary_PictureId_Picture_Id] FOREIGN KEY([PictureId])
REFERENCES [dbo].[Picture] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PictureBinary] CHECK CONSTRAINT [FK_PictureBinary_PictureId_Picture_Id]
GO

/****** Object:  Table [dbo].[Currency]    Script Date: 2023-06-14 22:45:08 ******/

CREATE TABLE [dbo].[Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CurrencyCode] [nvarchar](5) NOT NULL,
	[DisplayLocale] [nvarchar](50) NULL,
	[CustomFormatting] [nvarchar](50) NULL,
	[Rate] [decimal](18, 4) NOT NULL,
	[Published] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[UpdatedOn] [datetime2](7) NOT NULL,
	[RoundingTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Language]    Script Date: 2023-06-14 22:44:27 ******/

CREATE TABLE [dbo].[Language](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LanguageCulture] [nvarchar](20) NOT NULL,
	[UniqueSeoCode] [nvarchar](2) NULL,
	[FlagImageFileName] [nvarchar](50) NULL,
	[Rtl] [bit] NOT NULL,
	[DefaultCurrencyId] [int] NOT NULL,
	[Published] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Country]    Script Date: 2023-06-14 22:51:25 ******/

CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[TwoLetterIsoCode] [nvarchar](2) NULL,
	[ThreeLetterIsoCode] [nvarchar](3) NULL,
	[NumericIsoCode] [int] NOT NULL,
	[Published] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Province]    Script Date: 2023-06-14 22:51:59 ******/

CREATE TABLE [dbo].[Province](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SeName] [nvarchar](100) NULL,
	[Abbreviation] [nvarchar](20) NULL,
	[Location] [nvarchar](250) NULL,
	[GoogleMaps] [nvarchar](500) NULL,
	[ProvinceTypeId] [int] NOT NULL,
	[Published] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Province]  WITH CHECK ADD  CONSTRAINT [FK_Province_CountryId_Country_Id] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Province] CHECK CONSTRAINT [FK_Province_CountryId_Country_Id]
GO

/****** Object:  Table [dbo].[District]    Script Date: 2023-06-14 22:53:00 ******/

CREATE TABLE [dbo].[District](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SeName] [nvarchar](100) NULL,
	[Abbreviation] [nvarchar](20) NULL,
	[Location] [nvarchar](200) NULL,
	[GoogleMaps] [nvarchar](500) NULL,
	[DistrictTypeId] [int] NOT NULL,
	[Published] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_ProvinceId_Province_Id] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Province] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_ProvinceId_Province_Id]
GO

/****** Object:  Table [dbo].[Address]    Script Date: 2023-06-14 22:50:46 ******/

CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NULL,
	[ProvinceId] [int] NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Company] [nvarchar](max) NULL,
	[DistrictId] [int] NULL,
	[CommuneId] [int] NULL,
	[StreetId] [int] NULL,
	[Address1] [nvarchar](max) NULL,
	[Address2] [nvarchar](max) NULL,
	[ZipPostalCode] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[FaxNumber] [nvarchar](max) NULL,
	[CustomAttributes] [nvarchar](max) NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_CountryId_Country_Id] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_CountryId_Country_Id]
GO

ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_ProvinceId_Province_Id] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Province] ([Id])
GO

ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_ProvinceId_Province_Id]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 2023-06-14 22:49:05 ******/

CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[EmailToRevalidate] [nvarchar](500) NULL,
	[SystemName] [nvarchar](200) NULL,
	[TransferCode] [nvarchar](20) NULL,
	[BillingAddress_Id] [int] NULL,
	[ShippingAddress_Id] [int] NULL,
	[CustomerGuid] [uniqueidentifier] NOT NULL,
	[AdminComment] [nvarchar](max) NULL,
	[AffiliateId] [int] NOT NULL,
	[VendorId] [int] NOT NULL,
	[HasShoppingCartItems] [bit] NOT NULL,
	[RequireReLogin] [bit] NOT NULL,
	[FailedLoginAttempts] [int] NOT NULL,
	[CannotLoginUntilDate] [datetime2](7) NULL,
	[BalanceAmount] [decimal](18, 4) NOT NULL,
	[PromotionAmount] [decimal](18, 4) NOT NULL,
	[Active] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[IsSystemAccount] [bit] NOT NULL,
	[LastIpAddress] [nvarchar](max) NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[LastLoginDate] [datetime2](7) NULL,
	[LastActivityDate] [datetime2](7) NOT NULL,
	[RegisteredInStoreId] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_BillingAddress_Id_Address_Id] FOREIGN KEY([BillingAddress_Id])
REFERENCES [dbo].[Address] ([Id])
GO

ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_BillingAddress_Id_Address_Id]
GO

ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_ShippingAddress_Id_Address_Id] FOREIGN KEY([ShippingAddress_Id])
REFERENCES [dbo].[Address] ([Id])
GO

ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_ShippingAddress_Id_Address_Id]
GO

