USE [Fondoqy]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 5/7/2023 11:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[AID] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [AID_pk] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/7/2023 11:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [nvarchar](25) NOT NULL,
	[Lname] [nvarchar](25) NOT NULL,
	[salary] [int] NULL,
	[pNumber] [nvarchar](13) NULL,
	[address] [nvarchar](50) NOT NULL,
	[gender] [nvarchar](6) NOT NULL,
 CONSTRAINT [id_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[guests]    Script Date: 5/7/2023 11:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[guests](
	[fName] [nvarchar](50) NULL,
	[lName] [nvarchar](50) NULL,
	[pNumber] [nvarchar](13) NULL,
	[gID] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](50) NULL,
	[member] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[gID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservations]    Script Date: 5/7/2023 11:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rType] [nvarchar](50) NOT NULL,
	[rNumber] [int] NOT NULL,
	[chInDate] [date] NOT NULL,
	[chOutDate] [date] NOT NULL,
	[gID] [int] NOT NULL,
 CONSTRAINT [resid_PK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 5/7/2023 11:11:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[rID] [int] IDENTITY(1,1) NOT NULL,
	[rType] [nvarchar](50) NOT NULL,
	[rPhone] [nvarchar](13) NOT NULL,
	[rSalary] [int] NOT NULL,
	[rStatus] [varchar](4) NOT NULL,
 CONSTRAINT [RoomID_PK] PRIMARY KEY CLUSTERED 
(
	[rID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[guests] ADD  DEFAULT ('1') FOR [member]
GO
ALTER TABLE [dbo].[rooms] ADD  DEFAULT ('Single') FOR [rType]
GO
ALTER TABLE [dbo].[rooms] ADD  DEFAULT ('free') FOR [rStatus]
GO
ALTER TABLE [dbo].[admins]  WITH CHECK ADD FOREIGN KEY([AID])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [guestId_fk] FOREIGN KEY([gID])
REFERENCES [dbo].[guests] ([gID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [guestId_fk]
GO
ALTER TABLE [dbo].[reservations]  WITH CHECK ADD  CONSTRAINT [rNumber_fk] FOREIGN KEY([rNumber])
REFERENCES [dbo].[rooms] ([rID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[reservations] CHECK CONSTRAINT [rNumber_fk]
GO
