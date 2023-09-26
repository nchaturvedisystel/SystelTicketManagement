
/****** Object:  Schema [audit]    Script Date: 26-09-2023 12:11:03 ******/
CREATE SCHEMA [audit]
GO
/****** Object:  Table [audit].[UserMaster]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit].[UserMaster](
	[UserId] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[MobileNo] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsDeleted] [int] NULL,
	[ProfileImage] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuMaster]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuMaster](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](50) NULL,
	[MenuCode] [varchar](10) NULL,
	[MenuDesc] [varchar](500) NULL,
	[DisplayOrder] [int] NULL,
	[ParentMenuId] [int] NULL,
	[DefaultChildMenuId] [int] NULL,
	[MenuIconUrl] [varchar](500) NULL,
	[TemplatePath] [varchar](500) NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsDeleted] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
	[RoleCode] [varchar](10) NULL,
	[RoleDesc] [varchar](500) NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsDeleted] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubRoles]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubRoles](
	[SubRoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[SubRoleName] [varchar](50) NULL,
	[SubRoleCode] [varchar](10) NULL,
	[SubRoleDesc] [varchar](500) NULL,
	[MenuId] [int] NULL,
	[DisplayOrder] [int] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsDeleted] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NULL,
	[GroupCode] [varchar](20) NULL,
	[GroupDesc] [varchar](500) NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsDeleted] [int] NULL,
 CONSTRAINT [PK__UserGrou__149AF36A96041685] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroupMapping]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroupMapping](
	[MappingId] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NULL,
	[UserId] [int] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsDeleted] [int] NULL,
 CONSTRAINT [PK_UserGroupMapping] PRIMARY KEY CLUSTERED 
(
	[MappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[UserName] [varchar](50) NULL,
	[UserPassword] [varchar](500) NULL,
	[FailedLoginAttempt] [int] NULL,
	[LastLoggedDate] [datetime] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsDeleted] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLoginLog]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLoginLog](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[UserName] [varchar](50) NULL,
	[UserPassword] [varchar](500) NULL,
	[LoggedTime] [datetime] NULL,
	[LogDescription] [varchar](500) NULL,
	[LogStatus] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[MobileNo] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsDeleted] [int] NULL,
	[ProfileImage] [varchar](255) NULL,
 CONSTRAINT [PK__UserMast__1788CC4C5AD04CEF] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[UserId] [int] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsDeleted] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTimeTracking]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTimeTracking](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[PageCode] [varchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Duration] [int] NOT NULL,
	[LogTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserWorkCenter]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserWorkCenter](
	[UserWorkCenterId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[WorkCenterId] [int] NOT NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsDeleted] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserWorkCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkCenterMaster]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkCenterMaster](
	[WorkCenterId] [bigint] IDENTITY(1,1) NOT NULL,
	[WorkCenterName] [varchar](50) NULL,
	[WorkCenterCode] [varchar](20) NULL,
	[WorkCenterDesc] [varchar](500) NULL,
	[DisplaySeq] [int] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsDeleted] [int] NULL,
 CONSTRAINT [PK__Workflow__D8D1575CF3C59914] PRIMARY KEY CLUSTERED 
(
	[WorkCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkCenterStepsMaster]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkCenterStepsMaster](
	[StepId] [bigint] IDENTITY(1,1) NOT NULL,
	[WorkCenterId] [bigint] NULL,
	[StepName] [varchar](200) NULL,
	[StepCode] [varchar](20) NULL,
	[StepDesc] [varchar](1000) NULL,
	[DisplaySeq] [int] NULL,
	[IsActive] [int] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[IsDeleted] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [audit].[UserMaster] ([UserId], [FirstName], [MiddleName], [LastName], [DOB], [MobileNo], [EmailId], [Designation], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted], [ProfileImage]) VALUES (1, N'Full', N'', N'Access', CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'123456', N'full@gmail.com', N'User', 1, N'98', CAST(N'2023-08-31T09:52:27.413' AS DateTime), NULL, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[MenuMaster] ON 
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [MenuCode], [MenuDesc], [DisplayOrder], [ParentMenuId], [DefaultChildMenuId], [MenuIconUrl], [TemplatePath], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (1, N'Users', N'USR', N'Parent Menu for managing Users', 1, 0, 0, N'<i class="fa fa-user me-2" aria-hidden="true"></i>', N'/html/users/base.html', 1, N'system', CAST(N'2023-06-06T13:53:09.223' AS DateTime), N'6', CAST(N'2023-08-24T04:09:04.730' AS DateTime), 0)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [MenuCode], [MenuDesc], [DisplayOrder], [ParentMenuId], [DefaultChildMenuId], [MenuIconUrl], [TemplatePath], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (3, N'User List', N'USRL', N'List of all Users', 2, 1, 0, N'<i class="fa fa-th me-2">', N'/html/users/viewAllUsers.html', 1, N'system', CAST(N'2023-06-06T13:54:54.240' AS DateTime), NULL, CAST(N'2023-06-06T13:54:54.240' AS DateTime), 0)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [MenuCode], [MenuDesc], [DisplayOrder], [ParentMenuId], [DefaultChildMenuId], [MenuIconUrl], [TemplatePath], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (4, N'Dashboard', N'DB', N'Dashboard for logged in User', 2, 0, 0, N'<i class="fa fa-tachometer me-2" aria-hidden="true"></i>', N'/html/dashboard/base.html', 1, N'system', CAST(N'2023-06-06T13:58:55.737' AS DateTime), NULL, CAST(N'2023-06-06T13:58:55.737' AS DateTime), 0)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [MenuCode], [MenuDesc], [DisplayOrder], [ParentMenuId], [DefaultChildMenuId], [MenuIconUrl], [TemplatePath], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (5, N'Profile', N'PDB', N'Profile of Logged in User', 1, 4, 0, N'<i class="fa fa-th me-2">', N'', 1, N'system', CAST(N'2023-06-06T13:58:55.737' AS DateTime), NULL, CAST(N'2023-06-06T13:58:55.737' AS DateTime), 0)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [MenuCode], [MenuDesc], [DisplayOrder], [ParentMenuId], [DefaultChildMenuId], [MenuIconUrl], [TemplatePath], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (6, N'WorkList', N'WDB', N'Worklist or Daybook of logged in User', 6, 4, 0, N'<i class="fa fa-th me-2">', N'/html/dashboard/dashboardWorkList.html', 1, N'system', CAST(N'2023-06-06T13:58:55.737' AS DateTime), NULL, CAST(N'2023-06-06T13:58:55.737' AS DateTime), 0)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [MenuCode], [MenuDesc], [DisplayOrder], [ParentMenuId], [DefaultChildMenuId], [MenuIconUrl], [TemplatePath], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (7, N'Admin', N'ADM', N'Admin section for company level settings', 3, 0, 0, N'<i class="fa fa-id-card me-2" aria-hidden="true"></i>', N'/html/admin/base.html', 1, N'system', CAST(N'2023-06-06T14:03:10.563' AS DateTime), NULL, CAST(N'2023-06-06T14:03:10.563' AS DateTime), 0)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [MenuCode], [MenuDesc], [DisplayOrder], [ParentMenuId], [DefaultChildMenuId], [MenuIconUrl], [TemplatePath], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (8, N'Manage Menus', N'MAD', N'Menu management Single Page', 5, 7, 0, NULL, N'/html/admin/manageMenu.html', 1, N'system', CAST(N'2023-06-06T14:03:10.567' AS DateTime), N'1', CAST(N'2023-09-26T08:26:30.750' AS DateTime), 0)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [MenuCode], [MenuDesc], [DisplayOrder], [ParentMenuId], [DefaultChildMenuId], [MenuIconUrl], [TemplatePath], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (9, N'Manage Roles', N'RAD', N'Roles Management Single Page', 2, 7, 0, N'<i class="fa fa-th me-2">', N'/html/admin/ManageRoles.html', 1, N'system', CAST(N'2023-06-06T14:03:10.567' AS DateTime), NULL, CAST(N'2023-06-06T14:03:10.567' AS DateTime), 0)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [MenuCode], [MenuDesc], [DisplayOrder], [ParentMenuId], [DefaultChildMenuId], [MenuIconUrl], [TemplatePath], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (10, N'Manage Subroles', N'SAD', N'SubRoles Management Single Page', 3, 7, 0, N'<i class="fa fa-th me-2">', N'/html/admin/ManageSubRoles.html', 1, N'system', CAST(N'2023-06-06T14:03:10.567' AS DateTime), N'system', CAST(N'2023-07-25T06:28:24.763' AS DateTime), 0)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [MenuCode], [MenuDesc], [DisplayOrder], [ParentMenuId], [DefaultChildMenuId], [MenuIconUrl], [TemplatePath], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (11, N'User Roles', N'URAD', N'User Role Mapping De Mapping', 4, 7, 0, N'<i class="fa fa-th me-2">', N'', 0, N'system', CAST(N'2023-06-06T14:03:10.567' AS DateTime), N'6', CAST(N'2023-08-02T02:56:59.920' AS DateTime), 1)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [MenuCode], [MenuDesc], [DisplayOrder], [ParentMenuId], [DefaultChildMenuId], [MenuIconUrl], [TemplatePath], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (18, N'Value List', N'VAD', N'Value List for settings and dynamic dropdowns', 5, 7, 0, N'<i class="fa fa-th me-2">', N'', 0, N'system', CAST(N'2023-06-06T14:56:55.607' AS DateTime), N'6', CAST(N'2023-08-24T03:42:05.133' AS DateTime), 1)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [MenuCode], [MenuDesc], [DisplayOrder], [ParentMenuId], [DefaultChildMenuId], [MenuIconUrl], [TemplatePath], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (20, N'Manage UserGroup', N'UGAD', N'User Group Management Single Page', 6, 7, 0, N'<i class="fa fa-th me-2">', N'/html/admin/ManageUserGroup.html', 1, N'Sumeet', CAST(N'2023-07-10T05:19:04.573' AS DateTime), NULL, CAST(N'2023-07-10T05:19:04.573' AS DateTime), 0)
GO
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [MenuCode], [MenuDesc], [DisplayOrder], [ParentMenuId], [DefaultChildMenuId], [MenuIconUrl], [TemplatePath], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (21, N'New', N'NW', N'', 3, 4, 0, NULL, N'', 0, N'1', CAST(N'2023-09-26T11:14:29.840' AS DateTime), N'1', CAST(N'2023-09-26T11:17:05.240' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[MenuMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleCode], [RoleDesc], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (1, N'Administrator', N'ADMIN', N'Admin having full access to the system', 1, N'system', CAST(N'2023-06-06T13:42:43.790' AS DateTime), NULL, CAST(N'2023-06-06T13:42:43.790' AS DateTime), 0)
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName], [RoleCode], [RoleDesc], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (2, N'Supervisor', N'SPR', N'This is supervisor role', 1, N'3', CAST(N'2023-09-26T10:13:32.340' AS DateTime), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SubRoles] ON 
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (1, 1, N'Users', N'USR', N'Parent Menu for managing Users', 1, 1, 1, N'system', CAST(N'2023-06-06T15:19:30.323' AS DateTime), N'1', CAST(N'2023-09-26T11:13:20.150' AS DateTime), 0)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (2, 1, N'Create New', N'CUSR', N'Will allow to create new User', 2, 1, 0, N'system', CAST(N'2023-06-06T15:19:30.323' AS DateTime), N'98', CAST(N'2023-09-04T04:11:53.687' AS DateTime), 1)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (3, 1, N'List All', N'USRL', N'List of all Users', 3, 2, 1, N'system', CAST(N'2023-06-06T15:19:30.323' AS DateTime), N'1', CAST(N'2023-09-26T11:13:20.153' AS DateTime), 0)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (4, 1, N'Dashboard', N'DB', N'Dashboard for logged in User', 4, 2, 1, N'system', CAST(N'2023-06-06T15:19:30.323' AS DateTime), N'1', CAST(N'2023-09-26T11:13:19.590' AS DateTime), 0)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (5, 1, N'Profile', N'PDB', N'Profile of Logged in User', 5, 1, 1, N'system', CAST(N'2023-06-06T15:19:30.323' AS DateTime), N'1', CAST(N'2023-09-26T11:13:19.593' AS DateTime), 0)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (6, 1, N'WorkList', N'WDB', N'Worklist or Daybook of logged in User', 6, 2, 1, N'system', CAST(N'2023-06-06T15:19:30.323' AS DateTime), N'1', CAST(N'2023-09-26T11:13:19.597' AS DateTime), 0)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (7, 1, N'Admin', N'AD', N'Admin section for company level settings', 7, 3, 1, N'system', CAST(N'2023-06-06T15:19:30.323' AS DateTime), NULL, CAST(N'2023-06-06T15:19:30.323' AS DateTime), 0)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (8, 1, N'Manage Menus', N'MAD', N'Menu management Single Page', 8, 1, 1, N'system', CAST(N'2023-06-06T15:19:30.323' AS DateTime), NULL, CAST(N'2023-06-06T15:19:30.323' AS DateTime), 0)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (9, 1, N'Manage Roles', N'RAD', N'Roles Management Single Page', 9, 2, 1, N'system', CAST(N'2023-06-06T15:19:30.323' AS DateTime), NULL, CAST(N'2023-06-06T15:19:30.323' AS DateTime), 0)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (10, 1, N'Manage Subroles', N'SAD', N'SubRoles Management Single Page', 10, 3, 1, N'system', CAST(N'2023-06-06T15:19:30.323' AS DateTime), NULL, CAST(N'2023-06-06T15:19:30.323' AS DateTime), 0)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (11, 1, N'User Roles', N'URAD', N'User Role Mapping De Mapping', 11, 4, 0, N'system', CAST(N'2023-06-06T15:19:30.323' AS DateTime), N'6', CAST(N'2023-08-24T03:42:29.000' AS DateTime), 1)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (18, 1, N'Value List', N'VAD', N'Value List for settings and dynamic dropdowns', 18, 5, 0, N'system', CAST(N'2023-06-06T15:19:30.323' AS DateTime), N'6', CAST(N'2023-08-24T03:42:34.093' AS DateTime), 1)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (37, 1, N'Manage User Group', N'UGAD', N'User Group Management Single Page', 20, 6, 1, N'Sumeet', CAST(N'2023-07-10T05:37:46.270' AS DateTime), NULL, CAST(N'2023-07-10T05:37:46.270' AS DateTime), 0)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (53, 1, N'ShowAll', N'SHAL', N'This is Show all page which will show  All Suggestion for the input in SearchBar ', 123, 0, 0, N'6', CAST(N'2023-08-10T06:15:56.050' AS DateTime), N'6', CAST(N'2023-08-11T07:14:01.463' AS DateTime), 1)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (54, 2, N'User List', N'USRL', N'List of all Users', 3, 2, 0, N'1', CAST(N'2023-09-26T10:18:57.350' AS DateTime), N'1', CAST(N'2023-09-26T10:20:24.730' AS DateTime), 1)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (55, 2, N'Users', N'USR', N'Parent Menu for managing Users', 1, 1, 0, N'1', CAST(N'2023-09-26T10:18:58.753' AS DateTime), N'1', CAST(N'2023-09-26T10:20:24.727' AS DateTime), 1)
GO
INSERT [dbo].[SubRoles] ([SubRoleId], [RoleId], [SubRoleName], [SubRoleCode], [SubRoleDesc], [MenuId], [DisplayOrder], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (56, 1, N'New', N'NW', N'', 21, 3, 0, N'1', CAST(N'2023-09-26T11:14:50.930' AS DateTime), N'1', CAST(N'2023-09-26T11:17:19.613' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[SubRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[UserGroup] ON 
GO
INSERT [dbo].[UserGroup] ([GroupId], [GroupName], [GroupCode], [GroupDesc], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (1, N'US Employees Only', N'USE', N'Projects can be assigned to only US Employees', 1, N'system', CAST(N'2023-06-12T08:24:42.090' AS DateTime), N'1', CAST(N'2023-09-26T11:15:29.073' AS DateTime), 0)
GO
INSERT [dbo].[UserGroup] ([GroupId], [GroupName], [GroupCode], [GroupDesc], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (2, N'Non-US Employees Only', N'NUSE', N'Projects can be assigned to only Non US Employees', 1, N'system', CAST(N'2023-06-12T08:24:42.090' AS DateTime), NULL, CAST(N'2023-06-12T08:24:42.090' AS DateTime), 0)
GO
INSERT [dbo].[UserGroup] ([GroupId], [GroupName], [GroupCode], [GroupDesc], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (3, N'Any', N'ANY', N'Projects can be assigned to anyone', 1, N'system', CAST(N'2023-06-12T08:24:42.090' AS DateTime), NULL, CAST(N'2023-06-12T08:24:42.090' AS DateTime), 0)
GO
INSERT [dbo].[UserGroup] ([GroupId], [GroupName], [GroupCode], [GroupDesc], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (4, N'US Employees Only', N'USE', N'Projects can be assigned to only US Employees', 0, N'1', CAST(N'2023-09-26T11:15:40.873' AS DateTime), N'1', CAST(N'2023-09-26T11:16:04.577' AS DateTime), 1)
GO
INSERT [dbo].[UserGroup] ([GroupId], [GroupName], [GroupCode], [GroupDesc], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (5, N'US Employees Only11', N'USE', N'Projects can be assigned to only US Employees', 0, N'1', CAST(N'2023-09-26T11:16:14.273' AS DateTime), N'1', CAST(N'2023-09-26T11:16:25.760' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[UserGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[UserGroupMapping] ON 
GO
INSERT [dbo].[UserGroupMapping] ([MappingId], [GroupId], [UserId], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (1, 1, 1, 1, N'system', CAST(N'2023-06-12T08:36:05.620' AS DateTime), NULL, CAST(N'2023-06-12T08:36:05.620' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[UserGroupMapping] OFF
GO
SET IDENTITY_INSERT [dbo].[UserLogin] ON 
GO
INSERT [dbo].[UserLogin] ([LoginId], [UserId], [UserName], [UserPassword], [FailedLoginAttempt], [LastLoggedDate], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (1, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', 0, CAST(N'2023-09-26T12:09:11.587' AS DateTime), 1, N'system', CAST(N'2023-07-11T06:58:06.903' AS DateTime), NULL, CAST(N'2023-07-11T06:58:06.903' AS DateTime), 0)
GO
INSERT [dbo].[UserLogin] ([LoginId], [UserId], [UserName], [UserPassword], [FailedLoginAttempt], [LastLoggedDate], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (2, 2, N'anu', N'15b2918e12d3fdc16bf9305bfbd58a85', NULL, CAST(N'2023-09-26T10:16:58.543' AS DateTime), 1, N'1', CAST(N'2023-09-26T09:32:32.490' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[UserLogin] ([LoginId], [UserId], [UserName], [UserPassword], [FailedLoginAttempt], [LastLoggedDate], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (3, 3, N'cdtar', N'15b2918e12d3fdc16bf9305bfbd58a85', NULL, CAST(N'2023-09-26T10:19:13.513' AS DateTime), 1, N'1', CAST(N'2023-09-26T09:47:13.687' AS DateTime), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[UserLoginLog] ON 
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (1, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:47:51.650' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (2, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:48:53.403' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (3, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:49:13.060' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (4, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:49:35.770' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (5, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:51:10.487' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (6, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:51:44.130' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (7, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:51:51.330' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (8, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:51:58.537' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (9, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:52:05.597' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (10, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:52:13.213' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (11, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:52:34.667' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (12, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:53:06.957' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (13, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:53:13.270' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (14, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:53:22.477' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (15, -1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:53:28.280' AS DateTime), NULL, N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (16, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:54:55.530' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (17, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:57:56.497' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (18, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T14:58:28.200' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (19, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:02:08.230' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (20, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:11:07.590' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (21, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:11:25.447' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (22, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:11:48.420' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (23, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:29:04.647' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (24, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:29:35.183' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (25, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:31:07.147' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (26, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:32:25.077' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (27, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:39:04.493' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (28, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:43:01.607' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (29, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:43:33.680' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (30, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:45:49.600' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (31, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:47:25.107' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (32, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:48:45.623' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (33, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T15:52:52.897' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (34, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T16:21:18.670' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (35, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T16:21:42.973' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (36, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-25T16:22:27.890' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (37, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:04:27.630' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (38, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:04:53.337' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (39, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:22:19.950' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (40, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:22:49.097' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (41, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:23:31.860' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (42, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:24:03.150' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (43, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:24:11.163' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (44, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:36:35.243' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (45, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:43:34.240' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (46, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:44:02.610' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (47, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:44:32.190' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (48, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:44:47.140' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (49, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:53:47.550' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (50, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:54:00.600' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (51, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:56:38.030' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (52, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T08:56:52.423' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (53, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:01:30.970' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (54, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:07:57.870' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (55, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:21:42.510' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (56, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:28:42.373' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (57, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:32:01.753' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (58, 2, N'anu', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:32:44.867' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (59, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:46:00.953' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (60, 3, N'cdtar', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:47:38.153' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (61, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:48:10.460' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (62, 3, N'cdtar', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:48:47.590' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (63, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:49:04.693' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (64, 3, N'cdtar', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:49:25.863' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (65, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:49:40.817' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (66, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T09:57:55.310' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (67, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:00:22.700' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (68, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:11:24.687' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (69, 3, N'cdtar', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:12:48.170' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (70, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:14:19.813' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (71, 2, N'anu', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:14:35.657' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (72, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:14:59.977' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (73, 2, N'anu', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:15:58.893' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (74, 3, N'cdtar', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:16:33.740' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (75, 2, N'anu', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:16:58.543' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (76, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:18:22.203' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (77, 3, N'cdtar', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:19:13.513' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (78, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:19:37.893' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (79, -1, N'full', N'5d56c70b7f6d00b5d026203c9e42e673', CAST(N'2023-09-26T10:21:07.877' AS DateTime), N'User entered wrong Password', N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (80, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:21:14.997' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (81, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:21:27.520' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (82, -1, N'full', N'c34bfc797656308feb2a4f24c31249e7', CAST(N'2023-09-26T10:27:19.097' AS DateTime), N'User entered wrong Password', N'FAILED')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (83, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:27:24.990' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (84, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:31:59.077' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (85, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:46:15.913' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (86, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:48:52.840' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (87, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:50:40.880' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (88, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:51:11.780' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (89, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:57:40.833' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (90, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T10:57:55.403' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (91, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:10:39.463' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (92, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:11:32.397' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (93, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:11:42.253' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (94, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:16:52.287' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (95, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:35:04.900' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (96, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:35:55.867' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (97, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:43:56.817' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (98, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:44:21.157' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (99, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:44:44.870' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (100, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:46:17.310' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (101, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:54:26.333' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (102, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:54:50.953' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (103, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:55:01.987' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (104, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T11:58:23.143' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (105, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T12:00:31.783' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (106, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T12:03:09.057' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (107, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T12:08:17.937' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
INSERT [dbo].[UserLoginLog] ([LogId], [UserId], [UserName], [UserPassword], [LoggedTime], [LogDescription], [LogStatus]) VALUES (108, 1, N'full', N'15b2918e12d3fdc16bf9305bfbd58a85', CAST(N'2023-09-26T12:09:11.587' AS DateTime), N'User Login Success!!', N'SUCCESS')
GO
SET IDENTITY_INSERT [dbo].[UserLoginLog] OFF
GO
SET IDENTITY_INSERT [dbo].[UserMaster] ON 
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [MiddleName], [LastName], [DOB], [MobileNo], [EmailId], [Designation], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted], [ProfileImage]) VALUES (1, N'Full', N'', N'Access', CAST(N'1990-01-01T00:00:00.397' AS DateTime), N'9821234567', N'full@gmail.com', N'Admin', 1, N'system', CAST(N'2023-06-06T14:59:00.333' AS DateTime), NULL, CAST(N'2023-06-06T14:59:00.333' AS DateTime), 0, NULL)
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [MiddleName], [LastName], [DOB], [MobileNo], [EmailId], [Designation], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted], [ProfileImage]) VALUES (2, N'AnuPrabha', N'Shyam', N'M', CAST(N'2023-09-14T00:00:00.000' AS DateTime), N'12345678901', N'anu1@gmail.com', N'Admin', 1, N'1', CAST(N'2023-09-25T15:03:30.423' AS DateTime), N'1', CAST(N'2023-09-26T08:37:16.510' AS DateTime), 0, N'')
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [MiddleName], [LastName], [DOB], [MobileNo], [EmailId], [Designation], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted], [ProfileImage]) VALUES (3, N'Atharva', N'', N'', CAST(N'1998-08-20T00:00:00.000' AS DateTime), N'952920589', N'ratnaparkhiatharv@gmail.com', N'Supervisor', 1, N'1', CAST(N'2023-09-26T09:47:13.670' AS DateTime), N'1', CAST(N'2023-09-26T10:12:09.567' AS DateTime), 0, N'')
GO
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [RoleId], [UserId], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (1, 1, 1, 1, N'system', CAST(N'2023-06-06T15:05:34.933' AS DateTime), N'6', CAST(N'2023-09-01T03:07:33.600' AS DateTime), 0)
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [RoleId], [UserId], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (3, 1, 2, 1, N'1', CAST(N'2023-09-26T09:31:08.227' AS DateTime), N'1', CAST(N'2023-09-26T10:58:21.100' AS DateTime), 0)
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [RoleId], [UserId], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (4, 1, 3, 1, N'1', CAST(N'2023-09-26T10:12:36.707' AS DateTime), N'1', CAST(N'2023-09-26T10:58:47.217' AS DateTime), 0)
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [RoleId], [UserId], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (5, 2, 2, 1, N'3', CAST(N'2023-09-26T10:14:03.610' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [RoleId], [UserId], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (6, 2, 3, 0, N'2', CAST(N'2023-09-26T10:16:24.047' AS DateTime), N'1', CAST(N'2023-09-26T10:58:49.437' AS DateTime), 1)
GO
INSERT [dbo].[UserRoles] ([UserRoleId], [RoleId], [UserId], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (7, 2, 1, 0, N'1', CAST(N'2023-09-26T11:45:05.040' AS DateTime), N'1', CAST(N'2023-09-26T11:45:41.370' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTimeTracking] ON 
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (1, N'TLR', 1, CAST(N'2023-09-25T09:27:56.693' AS DateTime), CAST(N'2023-09-25T09:28:09.327' AS DateTime), 12632, CAST(N'2023-09-25T14:58:15.357' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (2, N'TLR', 1, CAST(N'2023-09-25T09:28:28.273' AS DateTime), CAST(N'2023-09-25T09:28:37.300' AS DateTime), 9029, CAST(N'2023-09-25T14:58:37.413' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (3, N'TLR', 1, CAST(N'2023-09-25T09:32:08.357' AS DateTime), CAST(N'2023-09-25T09:32:20.807' AS DateTime), 12449, CAST(N'2023-09-25T15:02:20.953' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (4, N'TLR', 1, CAST(N'2023-09-25T09:41:25.423' AS DateTime), CAST(N'2023-09-25T09:41:31.947' AS DateTime), 6523, CAST(N'2023-09-25T15:11:33.807' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (5, N'TLR', 1, CAST(N'2023-09-25T09:59:04.723' AS DateTime), CAST(N'2023-09-25T09:59:11.100' AS DateTime), 6376, CAST(N'2023-09-25T15:29:15.027' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (6, N'TLR', 1, CAST(N'2023-09-25T10:09:39.687' AS DateTime), CAST(N'2023-09-25T10:10:05.680' AS DateTime), 25993, CAST(N'2023-09-25T15:40:12.317' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (7, N'TLR', 1, CAST(N'2023-09-25T10:13:33.913' AS DateTime), CAST(N'2023-09-25T10:15:00.007' AS DateTime), 86095, CAST(N'2023-09-25T15:45:00.140' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (8, N'TLR', 1, CAST(N'2023-09-25T10:18:45.857' AS DateTime), CAST(N'2023-09-25T10:19:07.170' AS DateTime), 21311, CAST(N'2023-09-25T15:49:07.277' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (9, N'USRL', 1, CAST(N'2023-09-25T10:19:07.170' AS DateTime), CAST(N'2023-09-25T10:20:52.107' AS DateTime), 104938, CAST(N'2023-09-25T15:51:51.007' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (10, N'TLR', 1, CAST(N'2023-09-25T10:22:53.090' AS DateTime), CAST(N'2023-09-25T10:23:19.197' AS DateTime), 26107, CAST(N'2023-09-25T15:53:19.300' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (14, N'TLR', 1, CAST(N'2023-09-26T02:47:23.850' AS DateTime), CAST(N'2023-09-26T02:47:34.067' AS DateTime), 10216, CAST(N'2023-09-26T08:17:34.153' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (15, N'USR', 1, CAST(N'2023-09-26T02:47:34.067' AS DateTime), CAST(N'2023-09-26T02:48:10.787' AS DateTime), 36720, CAST(N'2023-09-26T08:18:10.927' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (16, N'TLR', 1, CAST(N'2023-09-26T02:52:20.050' AS DateTime), CAST(N'2023-09-26T02:52:25.837' AS DateTime), 5788, CAST(N'2023-09-26T08:22:25.883' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (17, N'TLR', 1, CAST(N'2023-09-26T02:52:49.147' AS DateTime), CAST(N'2023-09-26T02:53:02.773' AS DateTime), 13628, CAST(N'2023-09-26T08:23:02.817' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (18, N'USR', 1, CAST(N'2023-09-26T02:53:02.773' AS DateTime), CAST(N'2023-09-26T02:53:09.413' AS DateTime), 6640, CAST(N'2023-09-26T08:23:09.460' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (19, N'USRL', 1, CAST(N'2023-09-26T02:53:36.167' AS DateTime), CAST(N'2023-09-26T02:53:57.460' AS DateTime), 21296, CAST(N'2023-09-26T08:23:57.507' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (20, N'MAD', 1, CAST(N'2023-09-26T02:54:13.940' AS DateTime), CAST(N'2023-09-26T02:55:29.077' AS DateTime), 75136, CAST(N'2023-09-26T08:25:29.130' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (21, N'USRL', 1, CAST(N'2023-09-26T02:55:29.077' AS DateTime), CAST(N'2023-09-26T02:55:35.230' AS DateTime), 6152, CAST(N'2023-09-26T08:25:35.287' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (22, N'MAD', 1, CAST(N'2023-09-26T02:55:35.230' AS DateTime), CAST(N'2023-09-26T02:57:36.940' AS DateTime), 121712, CAST(N'2023-09-26T08:27:36.997' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (23, N'USR', 1, CAST(N'2023-09-26T02:57:36.940' AS DateTime), CAST(N'2023-09-26T02:57:43.847' AS DateTime), 6904, CAST(N'2023-09-26T08:27:43.930' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (24, N'TLR', 1, CAST(N'2023-09-26T03:14:02.660' AS DateTime), CAST(N'2023-09-26T03:14:23.587' AS DateTime), 20925, CAST(N'2023-09-26T08:44:23.677' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (25, N'TLR', 1, CAST(N'2023-09-26T03:26:14.413' AS DateTime), CAST(N'2023-09-26T03:26:23.427' AS DateTime), 9012, CAST(N'2023-09-26T08:56:23.500' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (26, N'TLR', 1, CAST(N'2023-09-26T03:31:02.500' AS DateTime), CAST(N'2023-09-26T03:31:10.370' AS DateTime), 7871, CAST(N'2023-09-26T09:01:10.467' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (27, N'USR', 1, CAST(N'2023-09-26T03:31:10.370' AS DateTime), CAST(N'2023-09-26T03:31:17.730' AS DateTime), 7360, CAST(N'2023-09-26T09:01:17.790' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (28, N'USR', 1, CAST(N'2023-09-26T03:31:34.660' AS DateTime), CAST(N'2023-09-26T03:31:47.617' AS DateTime), 12959, CAST(N'2023-09-26T09:01:47.687' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (29, N'TLR', 1, CAST(N'2023-09-26T03:32:39.913' AS DateTime), CAST(N'2023-09-26T03:32:51.217' AS DateTime), 11304, CAST(N'2023-09-26T09:02:51.310' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (36, N'TLR', 1, CAST(N'2023-09-26T04:30:40.487' AS DateTime), CAST(N'2023-09-26T04:30:48.390' AS DateTime), 7902, CAST(N'2023-09-26T10:00:47.567' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (43, N'RAD', 1, CAST(N'2023-09-26T04:45:07.703' AS DateTime), CAST(N'2023-09-26T04:45:34.333' AS DateTime), 26629, CAST(N'2023-09-26T10:15:34.000' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (44, N'TLR', 2, CAST(N'2023-09-26T04:45:59.257' AS DateTime), CAST(N'2023-09-26T04:46:07.517' AS DateTime), 8261, CAST(N'2023-09-26T10:16:07.273' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (45, N'USRL', 2, CAST(N'2023-09-26T04:47:03.227' AS DateTime), CAST(N'2023-09-26T04:47:30.173' AS DateTime), 26948, CAST(N'2023-09-26T10:17:30.173' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (53, N'TLR', 1, CAST(N'2023-09-26T05:40:19.907' AS DateTime), CAST(N'2023-09-26T05:40:32.717' AS DateTime), 12813, CAST(N'2023-09-26T11:10:32.830' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (54, N'TLR', 1, CAST(N'2023-09-26T05:40:39.543' AS DateTime), CAST(N'2023-09-26T05:40:51.807' AS DateTime), 12263, CAST(N'2023-09-26T11:10:51.840' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (58, N'SAD', 1, CAST(N'2023-09-26T05:43:14.137' AS DateTime), CAST(N'2023-09-26T05:43:33.483' AS DateTime), 19345, CAST(N'2023-09-26T11:13:33.517' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (59, N'TLR', 1, CAST(N'2023-09-26T05:44:35.427' AS DateTime), CAST(N'2023-09-26T05:44:44.530' AS DateTime), 9105, CAST(N'2023-09-26T11:14:44.567' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (63, N'TLR', 1, CAST(N'2023-09-26T05:47:22.410' AS DateTime), CAST(N'2023-09-26T05:48:03.253' AS DateTime), 40844, CAST(N'2023-09-26T11:18:03.300' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (64, N'TLR', 1, CAST(N'2023-09-26T05:57:07.203' AS DateTime), CAST(N'2023-09-26T05:57:12.893' AS DateTime), 5689, CAST(N'2023-09-26T11:27:12.980' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (65, N'USRL', 1, CAST(N'2023-09-26T05:57:12.893' AS DateTime), CAST(N'2023-09-26T06:01:54.510' AS DateTime), 281617, CAST(N'2023-09-26T11:31:54.587' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (66, N'MAD', 1, CAST(N'2023-09-26T06:01:54.510' AS DateTime), CAST(N'2023-09-26T06:04:49.897' AS DateTime), 175387, CAST(N'2023-09-26T11:34:49.967' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (67, N'PDB', 1, CAST(N'2023-09-26T06:04:49.897' AS DateTime), CAST(N'2023-09-26T06:04:55.063' AS DateTime), 5168, CAST(N'2023-09-26T11:34:55.140' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (68, N'TLR', 1, CAST(N'2023-09-26T06:05:04.967' AS DateTime), CAST(N'2023-09-26T06:05:12.843' AS DateTime), 7876, CAST(N'2023-09-26T11:35:12.933' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (69, N'MAD', 1, CAST(N'2023-09-26T06:05:12.843' AS DateTime), CAST(N'2023-09-26T06:05:45.250' AS DateTime), 32408, CAST(N'2023-09-26T11:35:45.330' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (70, N'TLR', 1, CAST(N'2023-09-26T06:05:55.887' AS DateTime), CAST(N'2023-09-26T06:06:08.023' AS DateTime), 12137, CAST(N'2023-09-26T11:36:08.097' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (71, N'TLR', 1, CAST(N'2023-09-26T06:13:56.877' AS DateTime), CAST(N'2023-09-26T06:14:06.493' AS DateTime), 9617, CAST(N'2023-09-26T11:44:06.580' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (75, N'UGAD', 1, CAST(N'2023-09-26T06:16:38.707' AS DateTime), CAST(N'2023-09-26T06:17:45.007' AS DateTime), 66299, CAST(N'2023-09-26T11:47:45.090' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (76, N'TLR', 1, CAST(N'2023-09-26T06:24:00.117' AS DateTime), CAST(N'2023-09-26T06:24:10.337' AS DateTime), 10222, CAST(N'2023-09-26T11:54:10.433' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (78, N'USR', 1, CAST(N'2023-09-26T06:28:05.920' AS DateTime), CAST(N'2023-09-26T06:28:14.863' AS DateTime), 8943, CAST(N'2023-09-26T11:58:15.090' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (79, N'TLR', 1, CAST(N'2023-09-26T06:37:53.787' AS DateTime), CAST(N'2023-09-26T06:38:00.173' AS DateTime), 6388, CAST(N'2023-09-26T12:08:00.273' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (11, N'USRL', 1, CAST(N'2023-09-25T10:51:20.907' AS DateTime), CAST(N'2023-09-25T10:51:34.850' AS DateTime), 13944, CAST(N'2023-09-25T16:21:34.997' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (12, N'TLR', 1, CAST(N'2023-09-25T10:51:42.983' AS DateTime), CAST(N'2023-09-25T10:51:55.640' AS DateTime), 12657, CAST(N'2023-09-25T16:21:55.770' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (13, N'UGAD', 1, CAST(N'2023-09-25T10:52:01.327' AS DateTime), CAST(N'2023-09-25T10:52:07.817' AS DateTime), 6488, CAST(N'2023-09-25T16:22:07.947' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (30, N'USR', 1, CAST(N'2023-09-26T03:58:44.133' AS DateTime), CAST(N'2023-09-26T03:58:56.277' AS DateTime), 12145, CAST(N'2023-09-26T09:28:56.377' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (31, N'TLR', 1, CAST(N'2023-09-26T03:59:03.520' AS DateTime), CAST(N'2023-09-26T03:59:14.317' AS DateTime), 10797, CAST(N'2023-09-26T09:29:14.393' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (32, N'TLR', 2, CAST(N'2023-09-26T04:02:44.910' AS DateTime), CAST(N'2023-09-26T04:03:02.293' AS DateTime), 17383, CAST(N'2023-09-26T09:33:02.353' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (33, N'USR', 2, CAST(N'2023-09-26T04:03:02.293' AS DateTime), CAST(N'2023-09-26T04:03:09.237' AS DateTime), 6944, CAST(N'2023-09-26T09:33:09.307' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (34, N'TLR', 1, CAST(N'2023-09-26T04:16:01.017' AS DateTime), CAST(N'2023-09-26T04:16:06.443' AS DateTime), 5429, CAST(N'2023-09-26T09:46:06.523' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (37, N'TLR', 1, CAST(N'2023-09-26T04:41:25.820' AS DateTime), CAST(N'2023-09-26T04:41:31.417' AS DateTime), 5596, CAST(N'2023-09-26T10:11:30.603' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (38, N'USRL', 1, CAST(N'2023-09-26T04:41:31.417' AS DateTime), CAST(N'2023-09-26T04:42:17.030' AS DateTime), 45616, CAST(N'2023-09-26T10:12:16.203' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (39, N'RAD', 1, CAST(N'2023-09-26T04:42:17.030' AS DateTime), CAST(N'2023-09-26T04:42:26.870' AS DateTime), 9840, CAST(N'2023-09-26T10:12:26.040' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (40, N'TLR', 3, CAST(N'2023-09-26T04:42:49.083' AS DateTime), CAST(N'2023-09-26T04:43:05.623' AS DateTime), 16540, CAST(N'2023-09-26T10:13:04.870' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (41, N'USRL', 3, CAST(N'2023-09-26T04:43:05.623' AS DateTime), CAST(N'2023-09-26T04:43:12.310' AS DateTime), 6687, CAST(N'2023-09-26T10:13:11.557' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (42, N'RAD', 3, CAST(N'2023-09-26T04:43:12.310' AS DateTime), CAST(N'2023-09-26T04:43:48.263' AS DateTime), 35952, CAST(N'2023-09-26T10:13:47.643' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (46, N'RAD', 2, CAST(N'2023-09-26T04:47:30.173' AS DateTime), CAST(N'2023-09-26T04:47:48.247' AS DateTime), 18072, CAST(N'2023-09-26T10:17:48.287' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (47, N'USRL', 2, CAST(N'2023-09-26T04:47:48.247' AS DateTime), CAST(N'2023-09-26T04:48:15.450' AS DateTime), 27205, CAST(N'2023-09-26T10:18:15.480' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (48, N'MAD', 1, CAST(N'2023-09-26T04:48:26.037' AS DateTime), CAST(N'2023-09-26T04:48:37.027' AS DateTime), 10992, CAST(N'2023-09-26T10:18:37.057' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (49, N'USRL', 1, CAST(N'2023-09-26T04:49:42.623' AS DateTime), CAST(N'2023-09-26T04:50:07.167' AS DateTime), 24545, CAST(N'2023-09-26T10:20:07.200' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (50, N'MAD', 1, CAST(N'2023-09-26T04:50:49.177' AS DateTime), CAST(N'2023-09-26T04:50:58.760' AS DateTime), 9584, CAST(N'2023-09-26T10:20:58.793' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (51, N'TLR', 1, CAST(N'2023-09-26T05:20:40.957' AS DateTime), CAST(N'2023-09-26T05:20:47.833' AS DateTime), 6877, CAST(N'2023-09-26T10:50:47.913' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (72, N'USRL', 1, CAST(N'2023-09-26T06:14:47.257' AS DateTime), CAST(N'2023-09-26T06:16:07.347' AS DateTime), 80091, CAST(N'2023-09-26T11:46:07.417' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (73, N'TLR', 1, CAST(N'2023-09-26T06:16:17.337' AS DateTime), CAST(N'2023-09-26T06:16:27.050' AS DateTime), 9714, CAST(N'2023-09-26T11:46:27.117' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (74, N'MAD', 1, CAST(N'2023-09-26T06:16:32.483' AS DateTime), CAST(N'2023-09-26T06:16:38.707' AS DateTime), 6224, CAST(N'2023-09-26T11:46:38.770' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (35, N'TLR', 1, CAST(N'2023-09-26T04:20:05.390' AS DateTime), CAST(N'2023-09-26T04:20:11.347' AS DateTime), 5958, CAST(N'2023-09-26T09:50:11.413' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (55, N'TLR', 1, CAST(N'2023-09-26T05:41:42.310' AS DateTime), CAST(N'2023-09-26T05:41:47.480' AS DateTime), 5169, CAST(N'2023-09-26T11:11:47.517' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (56, N'RAD', 1, CAST(N'2023-09-26T05:41:47.480' AS DateTime), CAST(N'2023-09-26T05:41:53.113' AS DateTime), 5632, CAST(N'2023-09-26T11:11:53.150' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (57, N'SAD', 1, CAST(N'2023-09-26T05:43:02.033' AS DateTime), CAST(N'2023-09-26T05:43:09.880' AS DateTime), 7848, CAST(N'2023-09-26T11:13:09.910' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (60, N'TLR', 1, CAST(N'2023-09-26T05:44:52.983' AS DateTime), CAST(N'2023-09-26T05:44:58.707' AS DateTime), 5723, CAST(N'2023-09-26T11:14:58.733' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (61, N'MAD', 1, CAST(N'2023-09-26T05:44:58.707' AS DateTime), CAST(N'2023-09-26T05:45:08.803' AS DateTime), 10096, CAST(N'2023-09-26T11:15:08.840' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (62, N'UGAD', 1, CAST(N'2023-09-26T05:45:08.803' AS DateTime), CAST(N'2023-09-26T05:46:37.910' AS DateTime), 89106, CAST(N'2023-09-26T11:16:37.980' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (52, N'TLR', 1, CAST(N'2023-09-26T05:27:40.927' AS DateTime), CAST(N'2023-09-26T05:27:48.097' AS DateTime), 7172, CAST(N'2023-09-26T10:57:48.140' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (77, N'RAD', 1, CAST(N'2023-09-26T06:24:36.170' AS DateTime), CAST(N'2023-09-26T06:24:42.810' AS DateTime), 6640, CAST(N'2023-09-26T11:54:42.877' AS DateTime))
GO
INSERT [dbo].[UserTimeTracking] ([LogId], [PageCode], [UserId], [StartTime], [EndTime], [Duration], [LogTime]) VALUES (80, N'DB', 1, CAST(N'2023-09-26T06:38:19.293' AS DateTime), CAST(N'2023-09-26T06:39:05.380' AS DateTime), 46087, CAST(N'2023-09-26T12:09:05.487' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserTimeTracking] OFF
GO
SET IDENTITY_INSERT [dbo].[UserWorkCenter] ON 
GO
INSERT [dbo].[UserWorkCenter] ([UserWorkCenterId], [UserId], [WorkCenterId], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (1, 1, 1, 1, N'7', CAST(N'2023-07-28T09:37:37.690' AS DateTime), N'7', CAST(N'2023-07-28T09:37:39.707' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[UserWorkCenter] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkCenterMaster] ON 
GO
INSERT [dbo].[WorkCenterMaster] ([WorkCenterId], [WorkCenterName], [WorkCenterCode], [WorkCenterDesc], [DisplaySeq], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (1, N'KIT', N'KIT', N'Prepare the necessary components and materials required for the production process.', 1, 1, N'system', CAST(N'2023-06-12T05:48:59.047' AS DateTime), NULL, CAST(N'2023-06-12T05:48:59.047' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[WorkCenterMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkCenterStepsMaster] ON 
GO
INSERT [dbo].[WorkCenterStepsMaster] ([StepId], [WorkCenterId], [StepName], [StepCode], [StepDesc], [DisplaySeq], [IsActive], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsDeleted]) VALUES (1, 1, N'Assemble Sub-Assemblies', N'', N'', 0, 1, N'system', CAST(N'2023-07-18T06:06:51.900' AS DateTime), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[WorkCenterStepsMaster] OFF
GO
ALTER TABLE [dbo].[MenuMaster] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MenuMaster] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[SubRoles] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[SubRoles] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[UserGroup] ADD  CONSTRAINT [DF__UserGroup__Creat__7D439ABD]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[UserGroup] ADD  CONSTRAINT [DF__UserGroup__Modif__7E37BEF6]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[UserGroupMapping] ADD  CONSTRAINT [DF__UserGroup__Creat__01142BA1]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[UserGroupMapping] ADD  CONSTRAINT [DF__UserGroup__Modif__02084FDA]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[UserLogin] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[UserLogin] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF__UserMaste__Creat__36B12243]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF__UserMaste__Modif__37A5467C]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[UserRoles] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[UserRoles] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
/****** Object:  StoredProcedure [dbo].[MenuMaster_CRUD]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Atharva Ratnaparkhi
-- Create date: 17/07/2023
-- Description:	This Stored Procedure Performs CRUD Operations on MenuMaster Table
-- =============================================

CREATE PROCEDURE [dbo].[MenuMaster_CRUD]
(
	@MenuId BIGINT,
	@MenuName VARCHAR(50),
	@MenuCode VARCHAR(20),
	@MenuDesc VARCHAR(500),
	@DisplayOrder INT,
	@ParentMenuId BIGINT,
	@DefaultChildMenuId BIGINT,
	@MenuIconUrl VARCHAR(255),
	@TemplatePath VARCHAR(255),
	@IsActive INT = 1,
	@IsDeleted INT = 0,
	@ActionUser INT
)
AS
BEGIN

	IF NOT EXISTS(SELECT 1 FROM MenuMaster WHERE MenuId = @MenuId) AND 
	LTRIM(RTRIM(ISNULL(@MenuName, ''))) <> '' AND
	LTRIM(RTRIM(ISNULL(@MenuCode, ''))) <> ''
	BEGIN
		INSERT INTO [dbo].[MenuMaster] 
		(MenuName, MenuCode, MenuDesc, DisplayOrder, ParentMenuId, DefaultChildMenuId, MenuIconUrl, TemplatePath, IsActive, CreatedBy, CreatedOn, IsDeleted, ModifiedBy, ModifiedOn)
		VALUES 
		(@MenuName, @MenuCode, @MenuDesc, @DisplayOrder, @ParentMenuId, @DefaultChildMenuId, @MenuIconUrl, @TemplatePath, @IsActive, @ActionUser, GETDATE(), @IsDeleted, NULL, NULL);

		SELECT @MenuId = SCOPE_IDENTITY(); 
	END
	ELSE IF EXISTS(SELECT 1 FROM MenuMaster 
							WHERE MenuId = @MenuId AND (MenuName <> @MenuName OR MenuCode <> @MenuCode OR MenuDesc <> @MenuDesc OR
							DisplayOrder <> @DisplayOrder OR ParentMenuId <> @ParentMenuId OR DefaultChildMenuId <> @DefaultChildMenuId OR
							MenuIconUrl <> @MenuIconUrl OR TemplatePath <> @TemplatePath OR IsActive <> @IsActive OR IsDeleted <> @IsDeleted))
	BEGIN
		UPDATE MenuMaster
		SET MenuName = @MenuName,
			MenuCode = @MenuCode,
			MenuDesc = @MenuDesc,
			DisplayOrder = @DisplayOrder,
			ParentMenuId = @ParentMenuId,
			DefaultChildMenuId = @DefaultChildMenuId,
			MenuIconUrl = @MenuIconUrl,
			TemplatePath = @TemplatePath,
			IsActive = @IsActive,
			IsDeleted = @IsDeleted,
			ModifiedBy = @ActionUser,
			ModifiedOn = GETDATE()
		WHERE MenuId = @MenuId
	END

	SELECT A.MenuId, A.MenuName, A.MenuCode, A.MenuDesc, A.DisplayOrder, A.ParentMenuId, A.DefaultChildMenuId, A.MenuIconUrl, A.TemplatePath, A.IsActive,
			CASE WHEN B.UserId IS NULL THEN A.CreatedBy 
			   ELSE (ISNULL(B.FirstName + ' ','') + ISNULL(B.LastName,''))		   
			   END AS CreatedBy,
			A.CreatedOn,
			A.ModifiedBy,
			A.ModifiedOn,
			A.IsDeleted
	FROM dbo.MenuMaster A WITH (NOLOCK)
	LEFT OUTER JOIN dbo.UserMaster B WITH (NOLOCK)
	ON A.CreatedBy = CONVERT(VARCHAR(50),B.UserId)

	WHERE A.IsDeleted = 0

END


GO
/****** Object:  StoredProcedure [dbo].[RolesMaster_CRUD]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ravindra Chauhan
-- Create date: 25/07/2023
-- Description:	This Stored Procedure Performs CRUD Operations on Roles Table.
-- =============================================
CREATE PROCEDURE [dbo].[RolesMaster_CRUD]
(
	@RoleId	INT,
	@RoleName	VARCHAR(50),
	@RoleCode	VARCHAR(20),
	@RoleDesc	VARCHAR(500),
	@IsActive	INT = 1,
	@IsDeleted	INT = 0,
	@ActionUser INT
)
AS
BEGIN

	IF NOT EXISTS(SELECT 1 FROM Roles WHERE RoleId = @RoleId ) AND LTRIM(RTRIM(ISNULL(@RoleName,''))) <> ''
	BEGIN
		INSERT INTO [dbo].Roles 
		(RoleName, RoleCode, RoleDesc,IsActive, CreatedBy, CreatedOn,ModifiedBy,ModifiedOn,IsDeleted)
		VALUES 
		(@RoleName, @RoleCode, @RoleDesc, @IsActive, @ActionUser, GETDATE(),NULL,NULL,@IsDeleted);

		SELECT @RoleId = SCOPE_IDENTITY(); 
	END
	ELSE IF EXISTS(SELECT 1 FROM Roles 
							WHERE RoleId = @RoleId AND (RoleName <> @RoleName OR RoleCode <> @RoleCode OR RoleDesc <> @RoleDesc OR
							IsActive <> @IsActive OR IsDeleted <> @IsDeleted ))
	BEGIN
		UPDATE Roles
		SET RoleName = @RoleName,
			RoleCode = @RoleCode,
			RoleDesc = @RoleDesc,
			IsActive = @IsActive,
			IsDeleted = @IsDeleted,
			ModifiedBy = @ActionUser,
			ModifiedOn = GETDATE()
		WHERE RoleId = @RoleId
	END

	SELECT A.RoleId,A.RoleName,A.RoleCode,A.RoleDesc,A.IsActive,A.IsDeleted,
	CASE WHEN B.UserId IS NULL THEN A.CreatedBy 
			   ELSE (ISNULL(B.FirstName + ' ','') + ISNULL(B.LastName,''))		   
			   END AS CreatedBy
			   ,A.CreatedOn,A.ModifiedBy,A.ModifiedOn
	FROM dbo.Roles A WITH (NOLOCK)
	LEFT OUTER JOIN dbo.UserMaster B WITH (NOLOCK)
	ON A.CreatedBy = CONVERT(VARCHAR(50),B.UserId)
	WHERE A.IsDeleted = 0

END
GO
/****** Object:  StoredProcedure [dbo].[SubRoles_CRUD]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sumeet Goliwar
-- Create date: 25/07/2023
-- Description:	This Stored procedure Maps Roles to specific menus so that only user having permission to specific user will be able to access the page
-- =============================================
CREATE PROCEDURE [dbo].[SubRoles_CRUD]
(
	@SubRoleId	INT,
	@RoleId	INT,
	@MenuId	INT,
	@IsActive	INT = 1,
	@IsDeleted	INT = 0,
	@ActionUser INT
)
AS
BEGIN

	IF NOT EXISTS(SELECT 1 FROM SubRoles WHERE SubRoleId = @SubRoleId ) AND 
		@RoleId <> 0 AND @MenuId <> 0
	BEGIN
		INSERT INTO [dbo].[SubRoles] 
		(RoleId, SubRoleName, SubRoleCode, SubRoleDesc, MenuId,DisplayOrder,IsActive, CreatedBy, CreatedOn,IsDeleted,ModifiedBy,ModifiedOn)
		SELECT 
			@RoleId, 
			B.[MenuName], 
			B.[MenuCode], 
			B.[MenuDesc], 
			B.[MenuId], 
			B.[DisplayOrder], 
			@IsActive, 
			@ActionUser, 
			GETDATE(),
			@IsDeleted, 
			NULL, 
			NULL
			FROM [dbo].[MenuMaster] B
			WHERE B.[MenuId] = @MenuId;

		SELECT @SubRoleId = SCOPE_IDENTITY(); 
	END
	ELSE IF EXISTS(SELECT 1 FROM SubRoles 
							WHERE SubRoleId = @SubRoleId)
	BEGIN
		UPDATE SubRoles
		SET 
			IsActive = @IsActive,
			IsDeleted = @IsDeleted,
			ModifiedBy = @ActionUser,
			ModifiedOn = GETDATE()
		WHERE SubRoleId = @SubRoleId
	END

	SELECT  A.MenuId, A.MenuName, A.MenuCode, A.MenuDesc, A.ParentMenuId,
			@RoleId RoleId, +
			CASE WHEN B.DisplayOrder IS NULL THEN A.DisplayOrder ELSE B.DisplayOrder END AS DisplayOrder
			, B.SubroleId,
			CASE WHEN B.IsActive IS NULL THEN 0 ELSE B.IsActive END AS HasAccess
	FROM dbo.MenuMaster A WITH (NOLOCK)
	LEFT OUTER JOIN dbo.SubRoles B WITH (NOLOCK)
	ON A.MenuId = B.MenuId AND ISNULL(B.RoleId,0) IN (0,@RoleId)

END
GO
/****** Object:  StoredProcedure [dbo].[UserGroupMaster_CRUD]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserGroupMaster_CRUD]
(
	@GroupId	INT,
	@GroupName	VARCHAR(50),
	@GroupCode	VARCHAR(20),
	@GroupDesc	VARCHAR(500),
	@IsActive	INT = 1,
	@IsDeleted	INT = 0,
	@ActionUser INT
)
AS
BEGIN

	IF NOT EXISTS(SELECT 1 FROM UserGroup WHERE GroupId = @GroupId ) AND LTRIM(RTRIM(ISNULL(@GroupName,''))) <> ''
	BEGIN
		INSERT INTO [dbo].[UserGroup] 
		(GroupName, GroupCode, GroupDesc,IsActive, CreatedBy, CreatedOn,IsDeleted)
		VALUES 
		(@GroupName, @GroupCode, @GroupDesc, @IsActive, @ActionUser, GETDATE(),@IsDeleted);

		SELECT @GroupId = SCOPE_IDENTITY(); 
	END
	ELSE IF EXISTS(SELECT 1 FROM UserGroup 
							WHERE GroupId = @GroupId AND (GroupName <> @GroupName OR GroupCode <> @GroupCode OR GroupDesc <> @GroupDesc OR
							IsActive <> @IsActive OR IsDeleted <> @IsDeleted ))
	BEGIN
		UPDATE UserGroup
		SET GroupName = @GroupName,
			GroupCode = @GroupCode,
			GroupDesc = @GroupDesc,
			IsActive = @IsActive,
			IsDeleted = @IsDeleted,
			ModifiedBy = @ActionUser,
			ModifiedOn = GETDATE()
		WHERE GroupId = @GroupId
	END

	SELECT A.GroupId,A.GroupName,A.GroupCode,A.GroupDesc,A.IsActive,A.IsDeleted,
	CASE WHEN B.UserId IS NULL THEN A.CreatedBy 
			   ELSE (ISNULL(B.FirstName + ' ','') + ISNULL(B.LastName,''))		   
			   END AS CreatedBy
			   ,A.CreatedOn,A.ModifiedBy,A.ModifiedOn
	FROM dbo.UserGroup A WITH (NOLOCK)
	LEFT OUTER JOIN dbo.UserMaster B WITH (NOLOCK)
	ON A.CreatedBy = CONVERT(VARCHAR(50),B.UserId)
	WHERE A.IsDeleted = 0

END
GO
/****** Object:  StoredProcedure [dbo].[UserLogin_CRUD]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sumit Gore
-- Create date: 18/07/2023
-- Description:	This stored procedure handles CRUD operations for Users login credentials.New user credentials will be created or updated with respect to UserID.
-- =============================================
CREATE PROCEDURE [dbo].[UserLogin_CRUD]
(
	@UserId INT,
	@UserName VARCHAR(50),
	@UserPassword VARCHAR(50),
	@ActionUser INT,
	@IsActive INT = 1,
	@IsDeleted INT = 0
)
AS
BEGIN

	DECLARE @ActiveUserId INT = 0;
	IF NOT EXISTS(SELECT 1 FROM UserLogin WHERE UserId = @UserId) AND LTRIM(RTRIM(ISNULL(@UserName,''))) <> ''
	BEGIN
		INSERT INTO UserLogin
		(UserId,UserName,UserPassword,IsActive,CreatedBy,CreatedOn,ModifiedBy,ModifiedOn,IsDeleted)
		VALUES
		(@UserId,@UserName,@UserPassword,@IsActive,@ActionUser,GETDATE(),NULL,NULL,@IsDeleted);


	END
	ELSE IF EXISTS(SELECT 1 FROM UserLogin WHERE UserId = @UserId AND (
			UserName <> @UserName OR
			UserPassword <> @UserPassword OR
			IsActive <> @IsActive OR
			IsDeleted <> @IsDeleted
			) )
	BEGIN
		UPDATE UserLogin
		SET UserName = @UserName,
			UserPassword = @UserPassword,
			IsActive = @IsActive,
			ModifiedBy = @ActionUser,
			ModifiedOn = GETDATE(),
			IsDeleted = @IsDeleted
		WHERE UserId = @UserId;
	END
	 


	SELECT A.[UserId], A.[FirstName], A.[MiddleName], A.[LastName], A.[DOB], A.[MobileNo], A.[EmailId], A.[Designation], A.[IsActive], A.[ProfileImage],
       CASE 
           WHEN B.UserId IS NULL THEN A.CreatedBy 
           ELSE (ISNULL(B.FirstName + ' ','') + ISNULL(B.LastName,''))		   
       END AS CreatedBy,
       A.[CreatedOn], A.[ModifiedBy], A.[ModifiedOn], A.[IsDeleted], @ActiveUserId AS ActiveUserId,
       C.[UserName] AS UserName -- Adding the UserName column from the UserLogin table
			FROM [dbo].[UserMaster] A 
			LEFT OUTER JOIN dbo.UserMaster B WITH (NOLOCK) ON A.CreatedBy = CONVERT(VARCHAR(50), B.UserId)
			LEFT OUTER JOIN dbo.UserLogin C WITH (NOLOCK) ON A.UserId = C.UserId -- Joining with UserLogin table
			WHERE A.IsDeleted = 0;

END


GO
/****** Object:  StoredProcedure [dbo].[UserMaster_CRUD]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sumit Gore
-- Create date: 11/07/2023
-- Description:	This stored procedure handles CRUD operations for Users.New user will be added only if input EmailID is Unique.
-- =============================================
CREATE PROCEDURE [dbo].[UserMaster_CRUD]
(
	@UserId INT,
	@FirstName VARCHAR(50),
	@MiddleName VARCHAR(50),
	@LastName VARCHAR(50),
	@DOB DateTime = GETDATE,
	@MobileNo VARCHAR(50),
	@EmailId VARCHAR(50),
	@Designation VARCHAR(50),
	@IsActive INT = 1,
	@IsDeleted INT = 0,
	@ActionUser INT,
	@ProfileImage VARCHAR(255)
)
AS
BEGIN

	DECLARE @ActiveUserId INT = 0;
	IF NOT EXISTS(SELECT 1 FROM UserMaster WHERE UserId = @UserId) AND LTRIM(RTRIM(ISNULL(@EmailId,''))) <> ''
	BEGIN
		INSERT INTO UserMaster
		(FirstName, MiddleName, LastName, DOB, MobileNo, EmailId, Designation, IsActive, CreatedBy, CreatedOn, IsDeleted, ModifiedBy, ModifiedOn,ProfileImage)
		VALUES
		(@FirstName, @MiddleName, @LastName, @DOB, @MobileNo, @EmailId, @Designation, @IsActive, @ActionUser, GETDATE(), @IsDeleted,NULL,NULL,@ProfileImage);

		SELECT @UserId = SCOPE_IDENTITY();
		SELECT @ActiveUserId = @UserId;
	END
	ELSE IF EXISTS(SELECT 1 FROM UserMaster WHERE UserId = @UserId AND (
			ISNULL(FirstName,'') <> ISNULL(@FirstName,'') OR
			ISNULL(MiddleName,'') <> ISNULL(@MiddleName,'') OR
			ISNULL(LastName,'') <> ISNULL(@LastName,'') OR
			ISNULL(DOB,'') <> ISNULL(@DOB,'') OR
			ISNULL(MobileNo,'') <> ISNULL(@MobileNo,'') OR
			ISNULL(EmailId,'') <> ISNULL(@EmailId,'') OR
			ISNULL(Designation,'') <> ISNULL(@Designation,'') OR
			ISNULL(IsActive,'') <> ISNULL(@IsActive,'') OR
			ISNULL(IsDeleted,'') <> ISNULL(@IsDeleted,'') OR
			ISNULL(ProfileImage,'') <> ISNULL(@ProfileImage,'')) )
	BEGIN
		UPDATE UserMaster
		SET FirstName = @FirstName,
			MiddleName = @MiddleName,
			LastName = @LastName,
			DOB = @DOB,
			MobileNo = @MobileNo,
			EmailId = @EmailId,
			Designation = @Designation,
			IsActive = @IsActive,
			ModifiedBy = @ActionUser,
			ModifiedOn = GETDATE(),
			ProfileImage = @ProfileImage
		WHERE UserId = @UserId;
		SELECT @ActiveUserId = @UserId;

		UPDATE UserLogin
		SET IsActive = @IsActive
		WHERE UserId = @UserId;
	END
	 
	DECLARE @TempT TABLE (
		UserId INT,
		WorkCenterCode VARCHAR(50)
	)

	INSERT INTO @TempT
	select A.UserId, B.WorkCenterCode
	from dbo.UserWorkCenter A WITH (NOLOCK)
	LEFT OUTER JOIN dbo.WorkCenterMaster B WITH (NOLOCK)
	ON A.WorkCenterId = B.WorkCenterId AND A.IsDeleted = 0

	SELECT A.[UserId], A.[FirstName], A.[MiddleName], A.[LastName], A.[DOB], A.[MobileNo], A.[EmailId], A.[Designation], A.[IsActive], A.[ProfileImage],
       CASE 
           WHEN B.UserId IS NULL THEN A.CreatedBy 
           ELSE (ISNULL(B.FirstName + ' ','') + ISNULL(B.LastName,''))		   
       END AS CreatedBy,
       A.[CreatedOn], A.[ModifiedBy], A.[ModifiedOn], A.[IsDeleted], @ActiveUserId AS ActiveUserId,
       C.[UserName] AS UserName, -- Adding the UserName column from the UserLogin table,
	   ISNULL(T.List_Output,'') AS AssignedWC

			FROM [dbo].[UserMaster] A 
			LEFT OUTER JOIN dbo.UserMaster B WITH (NOLOCK) ON A.CreatedBy = CONVERT(VARCHAR(50), B.UserId)
			LEFT OUTER JOIN dbo.UserLogin C WITH (NOLOCK) ON A.UserId = C.UserId -- Joining with UserLogin table
			LEFT OUTER JOIN (
				SELECT  UserId
					   ,STUFF((SELECT ', ' + CAST(WorkCenterCode AS VARCHAR(10)) [text()]
						 FROM @TempT 
						 WHERE UserId = t.UserId
						 FOR XML PATH(''), TYPE)
						.value('.','NVARCHAR(MAX)'),1,2,' ') List_Output
				FROM @TempT t
				GROUP BY UserId
			) T
			ON T.UserId = A.UserId

END


GO
/****** Object:  StoredProcedure [dbo].[UserMaster_UpdateStatus]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sumit Gore
-- Create date: 16/08/2023
-- Description:	This stored procedure handles CRUD operations for Users.New user will be added only if input EmailID is Unique.
-- =============================================
CREATE PROCEDURE [dbo].[UserMaster_UpdateStatus]
(
	@UserId INT,
	@IsActive INT = 1,
	@ActionUser INT
)
AS
BEGIN

		UPDATE UserMaster
		SET
			IsActive = @IsActive,
			ModifiedBy = @ActionUser,
			ModifiedOn = GETDATE()
		WHERE UserId = @UserId;

		UPDATE UserLogin
		SET IsActive = @IsActive
		WHERE UserId = @UserId;

		SELECT * FROM UserMaster WHERE UserId = @UserId;
	

END


GO
/****** Object:  StoredProcedure [dbo].[UserRole_CRUD]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sumit Gore
-- Create date: 31/07/2023
-- Description:	This stored procedure handles CRUD operations for UserRole Table. New mapping between user's id and Role's id will be created assigning roles to users .
-- =============================================
CREATE PROCEDURE [dbo].[UserRole_CRUD]
(
	@UserRoleId INT = 0,
	@UserId INT = 0,
	@RoleId INT = 0,
	@IsActive INT ,
	@IsDeleted INT ,
	@ActionUser INT 
	
)
AS
BEGIN

		IF EXISTS(SELECT 1 FROM UserRoles WHERE UserId = @UserId AND RoleId = @RoleId )
		BEGIN
			UPDATE UserRoles
			SET 
				IsActive = @IsActive,
				IsDeleted = @IsDeleted,
				ModifiedBy = @ActionUser,
				ModifiedOn = GETDATE()
				
			WHERE UserId = @UserId AND RoleId = @RoleId;
		END		
		ELSE IF(@UserRoleId = 0 AND @UserId <> 0 AND @RoleId <> 0)
		BEGIN
			INSERT INTO UserRoles
			(UserId, RoleId,IsActive,CreatedBy,CreatedOn,ModifiedBy,ModifiedOn,IsDeleted)
			VALUES
			(@UserId,@RoleId,@IsActive,@ActionUser,GETDATE(),NULL,NULL,@IsDeleted);

		END

	
	 
	 SELECT A.UserRoleId ,A.RoleId, B.RoleName, A.UserId,A.IsActive,A.IsDeleted
	 FROM [dbo].[UserRoles] A
		LEFT OUTER JOIN dbo.Roles B WITH (NOLOCK) ON B.RoleId = A.RoleId
	 WHERE A.UserId = @UserId AND A.IsDeleted = 0;
END



GO
/****** Object:  StoredProcedure [dbo].[UserRolesByUserId]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserRolesByUserId]
(
	@UserId INT
)
AS 
BEGIN
	IF OBJECT_ID('tempdb..#MenuMaster') IS NOT NULL DROP TABLE #MenuMaster;

	SELECT SubRoleId, B.RoleId, C.MenuName as SubRoleName
		   , C.MenuCode SubRoleCode --Menu Code must be unique for each menu as it binds pageload function on top of it
		   , SubRoleDesc, B.MenuId, C.DisplayOrder, ParentMenuId, DefaultChildMenuId, MenuIconUrl, TemplatePath 
	INTO #MenuMaster
	FROM UserRoles A WITH (NOLOCK)
	LEFT OUTER JOIN SubRoles B WITH (NOLOCK)
	ON A.RoleId = B.RoleId
	LEFT OUTER JOIN MenuMaster C WITH (NOLOCK)
	ON B.MenuId = C.MenuId
	WHERE A.UserId = @UserId AND B.IsDeleted = 0;

	ALTER TABLE #MenuMaster ADD IsParent INT DEFAULT 0, ChildrenCount INT DEFAULT 0, ChildIsParent INT DEFAULT 0;

	--Marking the Parent Menu
	UPDATE #MenuMaster SET IsParent = (CASE WHEN ParentMenuId = 0 THEN 1 ELSE 0 END );

	--Marking the Children Count for Menu
	UPDATE M 
	SET M.ChildrenCount = ISNULL(B.ChildrenCount,0), M.ChildIsParent = 0
	FROM #MenuMaster M
	LEFT OUTER JOIN (
		SELECT A.MenuId, COUNT(1) ChildrenCount
		FROM #MenuMaster A
		LEFT OUTER JOIN #MenuMaster B
		ON A.MenuId = B.ParentMenuId
		WHERE A.IsParent = 1 GROUP BY A.MenuId
	) B
	ON M.MenuId = B.MenuId;

	--Marking the Children without Parent
	UPDATE A SET A.ChildIsParent = 1
	FROM #MenuMaster A
	WHERE A.ParentMenuId NOT IN
	(
		SELECT MenuId FROM  #MenuMaster B 
	) AND A.IsParent <> 1;

	SELECT * FROM #MenuMaster ORDER BY DisplayOrder ;

END
GO
/****** Object:  StoredProcedure [dbo].[UserTimeTracking_Create]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sumit Gore
-- Create date: 17/08/2023
-- Description:	This stored procedure populates the data on UserTimeTracking
-- =============================================
CREATE PROCEDURE [dbo].[UserTimeTracking_Create]
	@PageCode VARCHAR(50),
	@ActionUser INT,
	@StartTime DATETIME,
	@EndTime DATETIME,
	@Duration INT
AS
BEGIN
	INSERT INTO [dbo].[UserTimeTracking]
		(PageCode,UserId,StartTime,EndTime,Duration,LogTime)
	VALUES
		(@PageCode,@ActionUser,@StartTime,@EndTime,@Duration,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[ValidateUserLogin]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidateUserLogin]
(
	@UserName VARCHAR(50),
	@UserPassword VARCHAR(500)
)
AS
BEGIN
	DECLARE @ResponseCode INT, @ResponseDescription VARCHAR(500), @UserId INT = -1, @LogStatus VARCHAR(10) = 'FAILED';

	IF EXISTS (SELECT 1 FROM UserLogin WITH (NOLOCK) WHERE UserName = @UserName AND UserPassword <> @UserPassword)
	BEGIN
		SELECT @ResponseCode = 501, @ResponseDescription = 'User entered wrong Password';
		GOTO HANDLER;
	END
	ELSE IF NOT EXISTS (SELECT 1 FROM UserLogin WITH (NOLOCK) WHERE UserName = @UserName AND UserPassword = @UserPassword)
	BEGIN
		SELECT @ResponseCode = 502, @ResponseDescription = 'User Login not exists';
		GOTO HANDLER;
	END
	ELSE IF EXISTS (SELECT 1 FROM UserLogin WITH (NOLOCK) WHERE UserName = @UserName AND UserPassword = @UserPassword AND IsActive = 0)
	BEGIN
		SELECT @ResponseCode = 503, @ResponseDescription = 'User Login is disabled';
		GOTO HANDLER;
	END
	ELSE IF EXISTS (SELECT 1 
					FROM UserLogin A WITH (NOLOCK) 
					LEFT OUTER JOIN UserMaster B WITH (NOLOCK)
					ON A.UserId = B.UserId
					WHERE UserName = @UserName AND UserPassword = @UserPassword AND A.IsActive = 1 AND B.IsActive = 0 AND B.IsDeleted = 0)
	BEGIN
		SELECT @ResponseCode = 504, @ResponseDescription = 'User is disabled';
		GOTO HANDLER;
	END
	ELSE IF EXISTS (SELECT 1 
					FROM UserLogin A WITH (NOLOCK) 
					LEFT OUTER JOIN UserMaster B WITH (NOLOCK)
					ON A.UserId = B.UserId
					WHERE UserName = @UserName AND UserPassword = @UserPassword AND A.IsActive = 1 AND B.IsDeleted = 1)
	BEGIN
		SELECT @ResponseCode = 505, @ResponseDescription = 'User is deleted';
		GOTO HANDLER;
	END
	ELSE IF EXISTS (SELECT 1 
					FROM UserLogin A WITH (NOLOCK) 
					LEFT OUTER JOIN UserMaster B WITH (NOLOCK)
					ON A.UserId = B.UserId
					WHERE UserName = @UserName AND UserPassword = @UserPassword AND A.IsActive = 1 AND B.IsActive = 1 AND B.IsDeleted = 0)
	BEGIN
		SELECT @ResponseCode = 200, @ResponseDescription = 'User Login Success!!';
		
		SELECT @UserId = UserId, @LogStatus = 'SUCCESS'
		FROM UserLogin WITH (NOLOCK)
		WHERE UserName = @UserName AND UserPassword = @UserPassword;

		UPDATE UserLogin SET LastLoggedDate = GETDATE() WHERE UserId = @UserId;

	END

	HANDLER:
	BEGIN
		INSERT INTO UserLoginLog (UserId, UserName, UserPassword, LoggedTime, LogStatus, LogDescription) 
		VALUES (@UserId, @UserName, @UserPassword, GETDATE(), @LogStatus, @ResponseDescription);

		SELECT A.ResponseCode, A.ResponseDescription,B.*,C.UserRoles RoleId 
		FROM (
			SELECT @ResponseCode ResponseCode, @ResponseDescription ResponseDescription, @UserId UserId
		) A
		LEFT OUTER JOIN UserMaster B WITH (NOLOCK) 
		ON A.UserId = B.UserId
		LEFT OUTER JOIN (
					SELECT  UserId
						   ,STUFF((SELECT ', ' + CAST(RoleId AS VARCHAR(10)) [UserRoles]
							 FROM dbo.UserROles 
							 WHERE UserId = t.UserId AND IsActive = 1
							 FOR XML PATH(''), TYPE)
							.value('.','NVARCHAR(MAX)'),1,2,' ') UserRoles
					FROM dbo.UserROles t
					GROUP BY UserId
		) C
		ON A.UserId = C.UserId
	END

END
GO
/****** Object:  StoredProcedure [dbo].[WorkCenterMaster_CRUD]    Script Date: 26-09-2023 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WorkCenterMaster_CRUD]
(
	@WorkCenterId	BIGINT,
	@WorkCenterName	VARCHAR(50),
	@WorkCenterCode	VARCHAR(20),
	@WorkCenterDesc	VARCHAR(500),
	@DisplaySeq INT,
	@IsActive	INT = 1,
	@IsDeleted	INT = 0,
	@ActionUser INT
)
AS	
BEGIN

	IF NOT EXISTS(SELECT 1 FROM [dbo].[WorkCenterMaster] WHERE WorkCenterId = @WorkCenterId ) AND 
		(LTRIM(RTRIM(ISNULL(@WorkCenterName,''))) <> '' AND
		LTRIM(RTRIM(ISNULL(@WorkCenterCode,''))) <> '')
	BEGIN
		INSERT INTO [dbo].[WorkCenterMaster] 
		(WorkCenterName, WorkCenterCode, WorkCenterDesc,DisplaySeq,IsActive, CreatedBy, CreatedOn,ModifiedBy,ModifiedOn,IsDeleted)
		VALUES 
		(@WorkCenterName, @WorkCenterCode, @WorkCenterDesc,@DisplaySeq, @IsActive, @ActionUser, GETDATE(),NULL,NULL,@IsDeleted);

		SELECT @WorkCenterId = SCOPE_IDENTITY(); 
	END
	ELSE IF EXISTS(SELECT 1 FROM [dbo].[WorkCenterMaster]
							WHERE WorkCenterId = @WorkCenterId AND (WorkCenterName <> @WorkCenterName OR WorkCenterCode <> @WorkCenterCode OR WorkCenterDesc <> @WorkCenterDesc OR
							DisplaySeq <> @DisplaySeq OR IsActive <> @IsActive OR IsDeleted <> @IsDeleted ))
	BEGIN
		UPDATE [dbo].[WorkCenterMaster]
		SET WorkCenterName = @WorkCenterName,
			WorkCenterCode = @WorkCenterCode,
			WorkCenterDesc = @WorkCenterDesc,
			DisplaySeq = @DisplaySeq,
			IsActive = @IsActive,
			IsDeleted = @IsDeleted,
			ModifiedBy = @ActionUser,
			ModifiedOn = GETDATE()
		WHERE WorkCenterId = @WorkCenterId
	END

	SELECT A.WorkCenterId,A.WorkCenterName,A.WorkCenterCode,A.WorkCenterDesc,A.DisplaySeq,A.IsActive,A.IsDeleted,
	CASE WHEN B.UserId IS NULL THEN A.CreatedBy 
			   ELSE (ISNULL(B.FirstName + ' ','') + ISNULL(B.LastName,''))		   
			   END AS CreatedBy
			   ,A.CreatedOn,A.ModifiedBy,A.ModifiedOn
	FROM [dbo].[WorkCenterMaster] A WITH (NOLOCK)
	LEFT OUTER JOIN dbo.UserMaster B WITH (NOLOCK)
	ON A.CreatedBy = CONVERT(VARCHAR(50),B.UserId)
	WHERE A.IsDeleted = 0

END
GO
