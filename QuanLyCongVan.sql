USE [master]
GO
/****** Object:  Database [QuanLyCongVan]    Script Date: 6/19/2018 10:21:40 AM ******/
CREATE DATABASE [QuanLyCongVan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyCongVan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QuanLyCongVan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyCongVan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QuanLyCongVan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QuanLyCongVan] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyCongVan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyCongVan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyCongVan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyCongVan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyCongVan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyCongVan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyCongVan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyCongVan] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyCongVan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyCongVan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyCongVan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyCongVan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyCongVan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyCongVan] SET QUERY_STORE = OFF
GO
USE [QuanLyCongVan]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [QuanLyCongVan]
GO
/****** Object:  Table [dbo].[CongVan]    Script Date: 6/19/2018 10:21:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongVan](
	[MaCV] [varchar](10) NOT NULL,
	[LoaiCV] [nchar](10) NULL,
	[TenCV] [nvarchar](200) NULL,
	[NgayKhoiTao] [date] NULL,
	[MoTa] [nvarchar](200) NULL,
	[MaPB] [varchar](10) NULL,
	[MaCQBanHanh] [nchar](10) NULL,
	[CVDiDen] [bit] NULL,
 CONSTRAINT [PK__CongVan__27258E76368AE10F] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongVan_NhanVien]    Script Date: 6/19/2018 10:21:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongVan_NhanVien](
	[MaNV] [varchar](10) NOT NULL,
	[MaCV] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoQuanBanHanh]    Script Date: 6/19/2018 10:21:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoQuanBanHanh](
	[MaCoQuan] [nchar](10) NULL,
	[TenCoQuan] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 6/19/2018 10:21:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TaiKhoan] [nvarchar](30) NULL,
	[MatKhau] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiCV]    Script Date: 6/19/2018 10:21:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiCV](
	[MaloaiCV] [nchar](10) NULL,
	[TenLoaiCV] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 6/19/2018 10:21:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](10) NOT NULL,
	[TenNV] [nvarchar](200) NULL,
	[GioiTinh] [nchar](5) NULL,
	[QueQuan] [nvarchar](200) NULL,
	[NgaySinh] [date] NULL,
	[MaPB] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 6/19/2018 10:21:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [varchar](10) NOT NULL,
	[TenPB] [nvarchar](200) NULL,
	[MaTP] [char](10) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SDT] [char](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CongVan]  WITH CHECK ADD  CONSTRAINT [FK__CongVan__MaPB__5070F446] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CongVan] CHECK CONSTRAINT [FK__CongVan__MaPB__5070F446]
GO
ALTER TABLE [dbo].[CongVan_NhanVien]  WITH CHECK ADD  CONSTRAINT [FK__CongVan_Nh__MaCV__5165187F] FOREIGN KEY([MaCV])
REFERENCES [dbo].[CongVan] ([MaCV])
GO
ALTER TABLE [dbo].[CongVan_NhanVien] CHECK CONSTRAINT [FK__CongVan_Nh__MaCV__5165187F]
GO
ALTER TABLE [dbo].[CongVan_NhanVien]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD CHECK  (([GioiTinh]=N'Nữ' OR [GioiTinh]=N'Nam'))
GO
/****** Object:  StoredProcedure [dbo].[SuaChiTietCV]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SuaChiTietCV](@MaNV VARCHAR(10),@MaCV VARCHAR(10))
AS
BEGIN
	IF EXISTS(SELECT  MaNV,MaCV FROM dbo.CongVan_NhanVien WHERE MaNV=@MaNV AND MaCV=@MaCV)
		BEGIN
			UPDATE dbo.CongVan_NhanVien SET MaNV = @MaNV,MaCV=@MaCV
			WHERE MaNV=@MaNV AND MaCV=@MaCV
		END
	ELSE
		BEGIN
			PRINT N'Thông tin không hợp lệ'
		END
END

GO
/****** Object:  StoredProcedure [dbo].[SuaCongVan]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SuaCongVan](@ma VARCHAR(10),@ten nvarchar(200),@NgayKT DATE,@MoTa NVARCHAR(200),@MaPB VARCHAR(10))
AS
BEGIN
	IF EXISTS(SELECT  MaCV FROM dbo.CongVan WHERE MaCV =@ma)
		BEGIN
			UPDATE dbo.CongVan SET MaCV = @ma,TenCV=@ten,NgayKhoiTao=@NgayKT,MoTa=@MoTa,MaPB=@MaPB
			WHERE MaCV=@ma
		END
	ELSE
		BEGIN
			PRINT N'Công văn không hợp lệ'
		END
END

GO
/****** Object:  StoredProcedure [dbo].[SuaNhanVien]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SuaNhanVien](@ma VARCHAR(10),@ten nvarchar(200),@GT NCHAR(5),@Que NVARCHAR(200),@NS DATE,@MaPB VARCHAR(10))
AS
BEGIN
	IF EXISTS(SELECT  MaNV FROM dbo.NhanVien WHERE MaNV =@ma)
		BEGIN
			UPDATE dbo.NhanVien SET MaNV = @ma,TenNV=@ten,GioiTinh=@GT,QueQuan=@Que,NgaySinh=@NS,MaPB=@MaPB
			WHERE MaNV=@ma
		END
	ELSE
		BEGIN
			PRINT N'Nhân viên không hợp lệ'
		END
END

GO
/****** Object:  StoredProcedure [dbo].[SuaPhongBan]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SuaPhongBan](@ma VARCHAR(10),@ten nvarchar(200),@matp CHAR(10),@diachi NVARCHAR(200),@SDT CHAR(15))
AS
BEGIN
	IF EXISTS(SELECT  MaPB FROM dbo.PhongBan WHERE MaPB =@ma)
		BEGIN
			UPDATE dbo.PhongBan SET MaPB = @ma,TenPB = @ten,MaTP=@matp,DiaChi=@diachi,SDT=@SDT
			WHERE MaPB=@ma
		END
	ELSE
		BEGIN
			PRINT N'Phòng ban không hợp lệ'
		END
END

GO
/****** Object:  StoredProcedure [dbo].[SuaTaiKhoan]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaTaiKhoan](@TK NVARCHAR(30),@MK VARCHAR(MAX))
AS
BEGIN
	IF EXISTS(SELECT  TaiKhoan FROM dbo.TaiKhoan WHERE TaiKhoan =@TK)
		BEGIN
			UPDATE dbo.TaiKhoan SET TaiKhoan = @TK,MatKhau=@MK
			WHERE TaiKhoan=@TK
		END
	ELSE
		BEGIN
			PRINT N'Tài khoản không hợp lệ'
		END
END

GO
/****** Object:  StoredProcedure [dbo].[ThemChiTietCV]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---Chi tiết công văn

CREATE PROC [dbo].[ThemChiTietCV](@MaNV VARCHAR(10),@MaCV VARCHAR(10))
AS
BEGIN
	IF EXISTS(SELECT  MaNV,MaCV FROM dbo.CongVan_NhanVien WHERE MaNV=@MaNV AND MaCV=@MaCV)
		BEGIN
			PRINT N'Thông tin đã tồn tại. Mời nhập lại'
		END
	ELSE
		BEGIN
			INSERT INTO dbo.CongVan_NhanVien
			        ( MaNV,MaCV )
			VALUES  ( @MaNV,@MaCV
			          )
		END
END

GO
/****** Object:  StoredProcedure [dbo].[ThemCongVan]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemCongVan](@ma VARCHAR(10),@ten nvarchar(200),@NgayKT DATE,@MoTa NVARCHAR(200),@MaPB VARCHAR(10))
AS
BEGIN
	IF EXISTS(SELECT  MaCV FROM dbo.CongVan WHERE MaCV =@ma)
		BEGIN
			PRINT N'Công văn đã tồn tại. Mời nhập lại'
		END
	ELSE
		BEGIN
			INSERT INTO dbo.CongVan
			        ( MaCV, TenCV,NgayKhoiTao,MoTa,MaPB )
			VALUES  ( @ma, 
			          @ten,
					  @NgayKT,
					  @MoTa,
					  
					  @MaPB 
			          )
		END
END

GO
/****** Object:  StoredProcedure [dbo].[ThemNhanVien]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---Nhân viên
CREATE PROC [dbo].[ThemNhanVien](@ma VARCHAR(10),@ten nvarchar(200),@GT NCHAR(5),@Que NVARCHAR(200),@NS DATE,@MaPB VARCHAR(10))
AS
BEGIN
	IF EXISTS(SELECT  MaNV FROM dbo.NhanVien WHERE MaNV =@ma)
		BEGIN
			PRINT N'Nhân viên đã tồn tại. Mời nhập lại'
		END
	ELSE
		BEGIN
			INSERT INTO dbo.NhanVien
			        ( MaNV, TenNV,GioiTinh,QueQuan,NgaySinh,MaPB )
			VALUES  ( @ma, 
			          @ten,
					  @GT,
					  @Que,
					  @NS,
					  @MaPB 
			          )
		END
END

GO
/****** Object:  StoredProcedure [dbo].[ThemPhongBan]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemPhongBan](@ma VARCHAR(10),@ten nvarchar(200),@matp CHAR(10),@diachi NVARCHAR(200),@SDT CHAR(15))
AS
BEGIN
	IF EXISTS(SELECT  MaPB FROM dbo.PhongBan WHERE MaPB =@ma)
		BEGIN
			PRINT N'Phòng ban đã tồn tại. Mời nhập lại'
		END
	ELSE
		BEGIN
			INSERT INTO dbo.PhongBan
			        ( MaPB, TenPB,MaTP,DiaChi,SDT )
			VALUES  ( @ma, 
			          @ten,
					  @matp,
					  @diachi,
					  @SDT  
			          )
		END
END

GO
/****** Object:  StoredProcedure [dbo].[ThemTaiKhoan]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---Tài khoản

CREATE PROC [dbo].[ThemTaiKhoan](@TK NVARCHAR(30),@MK VARCHAR(MAX))
AS
BEGIN
	IF EXISTS(SELECT  TaiKhoan FROM dbo.TaiKhoan WHERE TaiKhoan =@TK)
		BEGIN
			PRINT N'Tài khoản đã tồn tại. Mời nhập lại'
		END
	ELSE
		BEGIN
			INSERT INTO dbo.TaiKhoan
			        ( TaiKhoan,MatKhau )
			VALUES  ( @TK,@MK
			          )
		END
END

GO
/****** Object:  StoredProcedure [dbo].[XoaChiTietCV]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[XoaChiTietCV](@MaNV VARCHAR(10),@MaCV VARCHAR(10))
AS
BEGIN
	IF EXISTS(SELECT  MaNV,MaCV FROM dbo.CongVan_NhanVien WHERE MaNV=@MaNV AND MaCV=@MaCV)
		BEGIN
			DELETE dbo.CongVan_NhanVien WHERE MaNV=@MaNV AND MaCV=@MaCV
		END
	ELSE
		BEGIN
			PRINT N'Thông tin không hợp lệ'
		END
END   


GO
/****** Object:  StoredProcedure [dbo].[XoaCongVan]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[XoaCongVan](@ma VARCHAR(10))
AS
BEGIN
	IF EXISTS(SELECT  MaCV FROM dbo.CongVan WHERE MaCV =@ma)
		BEGIN
			DELETE dbo.CongVan WHERE MaCV=@ma
		END
	ELSE
		BEGIN
			PRINT N'Công văn không hợp lệ'
		END
END   

GO
/****** Object:  StoredProcedure [dbo].[XoaNhanVien]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[XoaNhanVien](@ma VARCHAR(10))
AS
BEGIN
	IF EXISTS(SELECT  MaNV FROM dbo.NhanVien WHERE MaNV =@ma)
		BEGIN
			DELETE dbo.NhanVien WHERE MaNV=@ma
		END
	ELSE
		BEGIN
			PRINT N'Nhân viên không hợp lệ'
		END
END

GO
/****** Object:  StoredProcedure [dbo].[XoaPhongBan]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[XoaPhongBan](@ma char(10))
AS
BEGIN
	IF EXISTS(SELECT  MaPB FROM dbo.PhongBan WHERE MaPB =@ma)
		BEGIN
			DELETE dbo.PhongBan WHERE MaPB=@ma
		END
	ELSE
		BEGIN
			PRINT N'Phòng ban không hợp lệ'
		END
END

GO
/****** Object:  StoredProcedure [dbo].[XoaTaiKhoan]    Script Date: 6/19/2018 10:21:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[XoaTaiKhoan](@TK VARCHAR(10))
AS
BEGIN
	IF EXISTS(SELECT  TaiKhoan FROM dbo.TaiKhoan WHERE TaiKhoan =@TK)
		BEGIN
			DELETE dbo.TaiKhoan WHERE TaiKhoan=@TK
		END
	ELSE
		BEGIN
			PRINT N'Tài khoản không hợp lệ'
		END
END   


GO
USE [master]
GO
ALTER DATABASE [QuanLyCongVan] SET  READ_WRITE 
GO
