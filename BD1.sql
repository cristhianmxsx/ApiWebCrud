USE [master]
GO
/****** Object:  Database [tramiteBD]    Script Date: 21/01/2023 12:38:57 ******/
CREATE DATABASE [tramiteBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tramiteBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\tramiteBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tramiteBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\tramiteBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [tramiteBD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tramiteBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tramiteBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tramiteBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tramiteBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tramiteBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tramiteBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [tramiteBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tramiteBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tramiteBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tramiteBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tramiteBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tramiteBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tramiteBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tramiteBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tramiteBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tramiteBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [tramiteBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tramiteBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tramiteBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tramiteBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tramiteBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tramiteBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tramiteBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tramiteBD] SET RECOVERY FULL 
GO
ALTER DATABASE [tramiteBD] SET  MULTI_USER 
GO
ALTER DATABASE [tramiteBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tramiteBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tramiteBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tramiteBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tramiteBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tramiteBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'tramiteBD', N'ON'
GO
ALTER DATABASE [tramiteBD] SET QUERY_STORE = ON
GO
ALTER DATABASE [tramiteBD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [tramiteBD]
GO
/****** Object:  Table [dbo].[institucion]    Script Date: 21/01/2023 12:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[institucion](
	[Institucion_cod] [int] NOT NULL,
	[inst_nombre] [varchar](150) NULL,
	[inst_tipoinstitucion] [varchar](50) NULL,
	[inst_estado] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Institucion_cod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[institucion] ([Institucion_cod], [inst_nombre], [inst_tipoinstitucion], [inst_estado]) VALUES (1, N'BITEC', N'INSTITUTO', N'ACTIVO')
GO
INSERT [dbo].[institucion] ([Institucion_cod], [inst_nombre], [inst_tipoinstitucion], [inst_estado]) VALUES (2, N'SAN PEDRO', N'UNIVERSIDAD', N'INACTIVO')
GO
INSERT [dbo].[institucion] ([Institucion_cod], [inst_nombre], [inst_tipoinstitucion], [inst_estado]) VALUES (3, N'CESAR VALLEJO', N'UNIVERSIDAD', N'ACTIVO')
GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR]    Script Date: 21/01/2023 12:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[ELIMINAR]
(

  @Institucion_cod  INT
)


AS

	BEGIN

	DELETE FROM  institucion 
  

	WHERE    Institucion_cod=@Institucion_cod 


	END
GO
/****** Object:  StoredProcedure [dbo].[listado]    Script Date: 21/01/2023 12:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[listado]

	AS

		SELECT * FROM  institucion
GO
/****** Object:  StoredProcedure [dbo].[MODIFICAR]    Script Date: 21/01/2023 12:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[MODIFICAR]
(
  @Institucion_cod  INT,
  @inst_nombre varchar(150),
  @inst_tipoinstitucion varchar(50),
  @inst_estado varchar(20)
)

AS

	BEGIN

	UPDATE  institucion 
	  SET inst_nombre=@inst_nombre,
	 inst_tipoinstitucion=@inst_tipoinstitucion,
	  inst_estado=@inst_estado

	WHERE    Institucion_cod=@Institucion_cod 


	END
GO
/****** Object:  StoredProcedure [dbo].[REGISTRAR]    Script Date: 21/01/2023 12:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[REGISTRAR]
(

  @Institucion_cod  INT,
  @inst_nombre varchar(150),
  @inst_tipoinstitucion varchar(50),
  @inst_estado varchar(20)
)

AS
	BEGIN
		INSERT INTO institucion VALUES (
		  @Institucion_cod ,
		  @inst_nombre,
		  @inst_tipoinstitucion,
		  @inst_estado
		)
	END
GO
/****** Object:  StoredProcedure [dbo].[retornar]    Script Date: 21/01/2023 12:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[retornar]
(

  @Institucion_cod  INT
)


	AS

		BEGIN

			SELECT  * FROM  institucion  WHERE    Institucion_cod=@Institucion_cod 


		END
GO
USE [master]
GO
ALTER DATABASE [tramiteBD] SET  READ_WRITE 
GO
