USE [master]
GO
/****** Object:  Database [EProcurementDb]    Script Date: 3/2/2022 8:02:12 PM ******/
CREATE DATABASE [EProcurementDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EProcurementDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EProcurementDb.mdf' , SIZE = 25600KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EProcurementDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\EProcurementDb_log.ldf' , SIZE = 10240KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EProcurementDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EProcurementDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EProcurementDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EProcurementDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EProcurementDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EProcurementDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EProcurementDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EProcurementDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EProcurementDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EProcurementDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EProcurementDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EProcurementDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EProcurementDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EProcurementDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EProcurementDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EProcurementDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EProcurementDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EProcurementDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EProcurementDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EProcurementDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EProcurementDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EProcurementDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EProcurementDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EProcurementDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EProcurementDb] SET RECOVERY FULL 
GO
ALTER DATABASE [EProcurementDb] SET  MULTI_USER 
GO
ALTER DATABASE [EProcurementDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EProcurementDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EProcurementDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EProcurementDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EProcurementDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EProcurementDb', N'ON'
GO
ALTER DATABASE [EProcurementDb] SET QUERY_STORE = OFF
GO
USE [EProcurementDb]
GO
/****** Object:  Table [dbo].[Committee]    Script Date: 3/2/2022 8:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Committee](
	[CommitteeID] [int] IDENTITY(1,1) NOT NULL,
	[CommitteeName] [varchar](100) NULL,
	[CommitteeDescription] [varchar](200) NULL,
 CONSTRAINT [PK_Committee] PRIMARY KEY CLUSTERED 
(
	[CommitteeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommitteeMember]    Script Date: 3/2/2022 8:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommitteeMember](
	[CommitteeMemberID] [int] IDENTITY(1,1) NOT NULL,
	[CommitteeID] [int] NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[OtherNames] [varchar](50) NULL,
	[PositionID] [int] NULL,
	[EmailAddress] [varchar](50) NULL,
 CONSTRAINT [PK_CommitteeMember] PRIMARY KEY CLUSTERED 
(
	[CommitteeMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 3/2/2022 8:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[CurrencyID] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [varchar](50) NULL,
	[CurrencySymbol] [char](4) NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[CurrencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinancialYear]    Script Date: 3/2/2022 8:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialYear](
	[FinancialYrID] [int] IDENTITY(1,1) NOT NULL,
	[FinancialYr] [char](9) NULL,
 CONSTRAINT [PK_FinancialYear] PRIMARY KEY CLUSTERED 
(
	[FinancialYrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 3/2/2022 8:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NULL,
	[ItemCode] [varchar](50) NULL,
	[MinStockLevel] [int] NULL,
	[ItemDescription] [varchar](200) NULL,
	[SIUnitID] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[LastUpdatedDate] [date] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemCategory]    Script Date: 3/2/2022 8:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
	[CategoryDescription] [varchar](200) NULL,
 CONSTRAINT [PK_ItemCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LPO]    Script Date: 3/2/2022 8:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LPO](
	[LPOID] [int] IDENTITY(1,1) NOT NULL,
	[RequisitionNo] [varchar](50) NULL,
	[VAT] [numeric](9, 2) NULL,
	[PurchaseOrderDate] [date] NULL,
	[ExpectedDeliveryDate] [date] NULL,
	[ShippingAddress] [varchar](200) NULL,
	[PaymentTerm] [varchar](50) NULL,
	[OtherTermsAndConditions] [varchar](200) NULL,
 CONSTRAINT [PK_LPO] PRIMARY KEY CLUSTERED 
(
	[LPOID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriorityType]    Script Date: 3/2/2022 8:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriorityType](
	[PriorityID] [int] IDENTITY(1,1) NOT NULL,
	[PriorityDescription] [varchar](50) NULL,
 CONSTRAINT [PK_PriorityType] PRIMARY KEY CLUSTERED 
(
	[PriorityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requisition]    Script Date: 3/2/2022 8:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requisition](
	[RequisitionID] [int] IDENTITY(1,1) NOT NULL,
	[RequisitionNo] [varchar](25) NULL,
	[RequestedByID] [int] NULL,
	[FinancialYrID] [int] NULL,
	[CompanyID] [int] NULL,
	[DepartmentID] [int] NULL,
	[RequisitionTypeID] [int] NULL,
	[Location] [varchar](50) NULL,
	[CurrencyID] [int] NULL,
	[PriorityID] [int] NULL,
	[RequisitionTotal] [numeric](18, 2) NULL,
	[RequisitionDescription] [varchar](100) NULL,
	[RequisitionStatusID] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[AuthorizedBy] [varchar](50) NULL,
	[AuthorizedDate] [date] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[LastUpdatedDate] [date] NULL,
 CONSTRAINT [PK_Requisition] PRIMARY KEY CLUSTERED 
(
	[RequisitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequisitionItem]    Script Date: 3/2/2022 8:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequisitionItem](
	[RequisitionItemID] [int] IDENTITY(1,1) NOT NULL,
	[RequisitionID] [int] NULL,
	[ItemID] [int] NULL,
	[Quantity] [int] NULL,
	[ItemRate] [numeric](9, 2) NULL,
	[ItemAmount] [numeric](18, 2) NULL,
 CONSTRAINT [PK_RequisitionItem] PRIMARY KEY CLUSTERED 
(
	[RequisitionItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequisitionStatus]    Script Date: 3/2/2022 8:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequisitionStatus](
	[RequisitionStatusID] [int] IDENTITY(1,1) NOT NULL,
	[RequisitionStatusDesc] [varchar](50) NULL,
 CONSTRAINT [PK_RequistionStatus] PRIMARY KEY CLUSTERED 
(
	[RequisitionStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequisitionType]    Script Date: 3/2/2022 8:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequisitionType](
	[RequisitionID] [int] IDENTITY(1,1) NOT NULL,
	[RequisitionType] [varchar](50) NULL,
	[RequisitionDescription] [varchar](100) NULL,
 CONSTRAINT [PK_RequisitionType] PRIMARY KEY CLUSTERED 
(
	[RequisitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 3/2/2022 8:02:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](100) NULL,
	[ContactPerson] [varchar](100) NULL,
	[VendorTypeID] [int] NULL,
	[CompanyRegistrationNo] [varchar](50) NULL,
	[IncorporationDate] [date] NULL,
	[NameOfOwner] [varchar](100) NULL,
	[CompanyContact] [varchar](50) NULL,
	[CompanyWebsite] [varchar](50) NULL,
	[CompanyEmailAddress] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[LastUpdatedBy] [varchar](50) NULL,
	[LastUpdatedDate] [date] NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FinancialYear] ON 

INSERT [dbo].[FinancialYear] ([FinancialYrID], [FinancialYr]) VALUES (1, N'2022-2023')
SET IDENTITY_INSERT [dbo].[FinancialYear] OFF
GO
SET IDENTITY_INSERT [dbo].[PriorityType] ON 

INSERT [dbo].[PriorityType] ([PriorityID], [PriorityDescription]) VALUES (1, N'High')
INSERT [dbo].[PriorityType] ([PriorityID], [PriorityDescription]) VALUES (2, N'Medium')
INSERT [dbo].[PriorityType] ([PriorityID], [PriorityDescription]) VALUES (3, N'Low')
SET IDENTITY_INSERT [dbo].[PriorityType] OFF
GO
SET IDENTITY_INSERT [dbo].[RequisitionStatus] ON 

INSERT [dbo].[RequisitionStatus] ([RequisitionStatusID], [RequisitionStatusDesc]) VALUES (1, N'Pending')
INSERT [dbo].[RequisitionStatus] ([RequisitionStatusID], [RequisitionStatusDesc]) VALUES (2, N'RFQ Sent')
INSERT [dbo].[RequisitionStatus] ([RequisitionStatusID], [RequisitionStatusDesc]) VALUES (3, N'Quotation Finalized')
INSERT [dbo].[RequisitionStatus] ([RequisitionStatusID], [RequisitionStatusDesc]) VALUES (4, N'LPO Generated')
INSERT [dbo].[RequisitionStatus] ([RequisitionStatusID], [RequisitionStatusDesc]) VALUES (5, N'Approved')
INSERT [dbo].[RequisitionStatus] ([RequisitionStatusID], [RequisitionStatusDesc]) VALUES (6, N'Central Purchasing Committee')
INSERT [dbo].[RequisitionStatus] ([RequisitionStatusID], [RequisitionStatusDesc]) VALUES (7, N'Vender selected')
SET IDENTITY_INSERT [dbo].[RequisitionStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[RequisitionType] ON 

INSERT [dbo].[RequisitionType] ([RequisitionID], [RequisitionType], [RequisitionDescription]) VALUES (1, N'Purchase', N'')
INSERT [dbo].[RequisitionType] ([RequisitionID], [RequisitionType], [RequisitionDescription]) VALUES (2, N'Contract', N'')
INSERT [dbo].[RequisitionType] ([RequisitionID], [RequisitionType], [RequisitionDescription]) VALUES (3, N'Service', N'')
SET IDENTITY_INSERT [dbo].[RequisitionType] OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the name of the currency' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Currency', @level2type=N'COLUMN',@level2name=N'CurrencyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the symbol of the currency' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Currency', @level2type=N'COLUMN',@level2name=N'CurrencySymbol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'primary key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinancialYear', @level2type=N'COLUMN',@level2name=N'FinancialYrID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the financial year in question. limited to char(9) eg: 2022-2023' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FinancialYear', @level2type=N'COLUMN',@level2name=N'FinancialYr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the primary key of Items' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the name of the item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the item code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'ItemCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'minimum stock level' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'MinStockLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the description for the item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'ItemDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'primary key for the Priority lookup' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriorityType', @level2type=N'COLUMN',@level2name=N'PriorityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'priority description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PriorityType', @level2type=N'COLUMN',@level2name=N'PriorityDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'primary key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requisition', @level2type=N'COLUMN',@level2name=N'RequisitionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'requisition number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requisition', @level2type=N'COLUMN',@level2name=N'RequisitionNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the ID of the requester' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requisition', @level2type=N'COLUMN',@level2name=N'RequestedByID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the ID of the financial year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requisition', @level2type=N'COLUMN',@level2name=N'FinancialYrID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the ID of the company..(usually the company in which system is installed)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requisition', @level2type=N'COLUMN',@level2name=N'CompanyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the department initiating the requisition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requisition', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the type of requisition (i.e. Purchase, Rent or Service)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requisition', @level2type=N'COLUMN',@level2name=N'RequisitionTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the location of the company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requisition', @level2type=N'COLUMN',@level2name=N'Location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the currency in which requisition is being quoted' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requisition', @level2type=N'COLUMN',@level2name=N'CurrencyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the ID depicting the priority level for this requisition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requisition', @level2type=N'COLUMN',@level2name=N'PriorityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the estimated total of the Requisition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requisition', @level2type=N'COLUMN',@level2name=N'RequisitionTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the general purpose of the requisition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Requisition', @level2type=N'COLUMN',@level2name=N'RequisitionDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'primary key for the table entity' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequisitionItem', @level2type=N'COLUMN',@level2name=N'RequisitionItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the ID of the requisition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequisitionItem', @level2type=N'COLUMN',@level2name=N'RequisitionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the ID of the item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequisitionItem', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the quantity being requisitioned' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequisitionItem', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the rate for the item being requisitioned' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequisitionItem', @level2type=N'COLUMN',@level2name=N'ItemRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantity x Rate gives ITEM AMOUNT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequisitionItem', @level2type=N'COLUMN',@level2name=N'ItemAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'primary key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequisitionStatus', @level2type=N'COLUMN',@level2name=N'RequisitionStatusID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the current status of a requisition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequisitionStatus', @level2type=N'COLUMN',@level2name=N'RequisitionStatusDesc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'primary key for the requisition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequisitionType', @level2type=N'COLUMN',@level2name=N'RequisitionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the type of requisition' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequisitionType', @level2type=N'COLUMN',@level2name=N'RequisitionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the description for the requistion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RequisitionType', @level2type=N'COLUMN',@level2name=N'RequisitionDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the company registration number of the vendor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'CompanyRegistrationNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the contact of the company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'CompanyContact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the website or social media presence of the company/vendor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'CompanyWebsite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the email address of the company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'CompanyEmailAddress'
GO
USE [master]
GO
ALTER DATABASE [EProcurementDb] SET  READ_WRITE 
GO
