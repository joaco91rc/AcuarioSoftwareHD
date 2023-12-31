USE [master]
GO
/****** Object:  Database [DBSISTEMA]    Script Date: 1/6/2023 15:42:46 ******/
CREATE DATABASE [DBSISTEMA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBSISTEMA_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\DBSISTEMA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBSISTEMA_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\DBSISTEMA.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBSISTEMA] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBSISTEMA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBSISTEMA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBSISTEMA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBSISTEMA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBSISTEMA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBSISTEMA] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBSISTEMA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBSISTEMA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBSISTEMA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBSISTEMA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBSISTEMA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBSISTEMA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBSISTEMA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBSISTEMA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBSISTEMA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBSISTEMA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBSISTEMA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBSISTEMA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBSISTEMA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBSISTEMA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBSISTEMA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBSISTEMA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBSISTEMA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBSISTEMA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBSISTEMA] SET  MULTI_USER 
GO
ALTER DATABASE [DBSISTEMA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBSISTEMA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBSISTEMA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBSISTEMA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DBSISTEMA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBSISTEMA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBSISTEMA] SET QUERY_STORE = OFF
GO
USE [DBSISTEMA]
GO
/****** Object:  UserDefinedTableType [dbo].[eDetalle_Compra]    Script Date: 1/6/2023 15:42:46 ******/
CREATE TYPE [dbo].[eDetalle_Compra] AS TABLE(
	[idProducto] [int] NULL,
	[precioCompra] [decimal](18, 2) NULL,
	[precioVenta] [decimal](18, 2) NULL,
	[cantidad] [int] NULL,
	[montoTotal] [decimal](18, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[EDetalle_Venta]    Script Date: 1/6/2023 15:42:46 ******/
CREATE TYPE [dbo].[EDetalle_Venta] AS TABLE(
	[idProducto] [int] NULL,
	[precioVenta] [decimal](18, 2) NULL,
	[cantidad] [int] NULL,
	[subTotal] [decimal](18, 2) NULL
)
GO
/****** Object:  Table [dbo].[CAJA_REGISTRADORA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAJA_REGISTRADORA](
	[idCajaRegistradora] [int] IDENTITY(1,1) NOT NULL,
	[fechaApertura] [datetime] NULL,
	[fechaCierre] [datetime] NULL,
	[usuarioAperturacaja] [nvarchar](50) NULL,
	[saldo] [decimal](18, 2) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK__CAJA_REG__5CE40299E193BD67] PRIMARY KEY CLUSTERED 
(
	[idCajaRegistradora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[estado] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[documento] [varchar](50) NULL,
	[nombreCompleto] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[estado] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA](
	[idCompra] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[idProveedor] [int] NULL,
	[tipoDocumento] [varchar](50) NULL,
	[nroDocumento] [varchar](50) NULL,
	[montoTotal] [decimal](10, 2) NULL,
	[fechaRegistro] [datetime] NULL,
 CONSTRAINT [PK__COMPRA__48B99DB7EC00C8DE] PRIMARY KEY CLUSTERED 
(
	[idCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_COMPRA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_COMPRA](
	[idDetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[idCompra] [int] NULL,
	[idProducto] [int] NULL,
	[precioCompra] [decimal](10, 2) NULL,
	[precioVenta] [decimal](10, 2) NULL,
	[cantidad] [int] NULL,
	[montoTotal] [decimal](10, 2) NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_VENTA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_VENTA](
	[idDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[precioVenta] [decimal](10, 2) NULL,
	[cantidad] [int] NULL,
	[subTotal] [decimal](10, 2) NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NEGOCIO]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NEGOCIO](
	[idNegocio] [int] NOT NULL,
	[nombre] [varchar](60) NULL,
	[cuit] [varchar](50) NULL,
	[direccion] [varchar](60) NULL,
	[logo] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idNegocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISO]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISO](
	[idPermiso] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[nombreMenu] [varchar](100) NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


INSERT INTO [dbo].[PERMISO]
           ([idRol],[nombreMenu])
     VALUES
           (2,'menuCompras')
GO
INSERT INTO [dbo].[PERMISO]
           ([idRol],[nombreMenu])
     VALUES
           (2,'menuClientes')
GO

INSERT INTO [dbo].[PERMISO]
           ([idRol],[nombreMenu])
     VALUES
           (2,'menuProveedores')

GO

INSERT INTO [dbo].[PERMISO]
           ([idRol],[nombreMenu])
     VALUES
           (2,'menuCajaRegistradora')
GO
CREATE TABLE [dbo].[PRODUCTO](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL,
	[idCategoria] [int] NULL,
	[stock] [int] NOT NULL,
	[precioCompra] [decimal](10, 2) NULL,
	[precioVenta] [decimal](10, 2) NULL,
	[estado] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDOR](
	[idProveedor] [int] IDENTITY(1,1) NOT NULL,
	[documento] [varchar](50) NULL,
	[razonSocial] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[estado] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROL]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANSACCION_CAJA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[TRANSACCION_CAJA](
	[idTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[idCajaRegistradora] [int] NULL,
	[hora] [datetime] NULL,
	[tipoTransaccion] [nvarchar](50) NULL,
	[monto] [decimal](10, 2) NULL,
	[docAsociado] [nvarchar](50) NULL,
	[usuarioTransaccion] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[documento] [varchar](50) NULL,
	[nombreCompleto] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[clave] [varchar](50) NULL,
	[idRol] [int] NULL,
	[estado] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
 CONSTRAINT [PK__USUARIO__645723A656449249] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

GO
CREATE TABLE [dbo].[VENTA](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NULL,
	[tipoDocumento] [varchar](50) NULL,
	[nroDocumento] [varchar](50) NULL,
	[documentoCliente] [varchar](50) NULL,
	[nombreCliente] [varchar](100) NULL,
	[montoPago] [decimal](10, 2) NULL,
	[montoCambio] [decimal](10, 2) NULL,
	[montoTotal] [decimal](10, 2) NULL,
	[fechaRegistro] [datetime] NULL,
	[formaPago] [varchar](100) NULL,
 CONSTRAINT [PK__VENTA__077D56141516F264] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CAJA_REGISTRADORA] ADD  CONSTRAINT [DF__CAJA_REGI__fecha__59C55456]  DEFAULT (getdate()) FOR [fechaApertura]
GO
ALTER TABLE [dbo].[CAJA_REGISTRADORA] ADD  CONSTRAINT [DF__CAJA_REGI__fecha__5AB9788F]  DEFAULT (getdate()) FOR [fechaCierre]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[COMPRA] ADD  CONSTRAINT [DF__COMPRA__fechaReg__5EBF139D]  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] ADD  DEFAULT ((0)) FOR [precioCompra]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] ADD  DEFAULT ((0)) FOR [precioVenta]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[DETALLE_VENTA] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[PERMISO] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((0)) FOR [stock]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((0)) FOR [precioCompra]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((0)) FOR [precioVenta]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[PROVEEDOR] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[ROL] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[TRANSACCION_CAJA] ADD  DEFAULT (getdate()) FOR [hora]
GO
ALTER TABLE [dbo].[USUARIO] ADD  CONSTRAINT [DF__USUARIO__fechaRe__6A30C649]  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[VENTA] ADD  CONSTRAINT [DF__VENTA__fechaRegi__6B24EA82]  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD  CONSTRAINT [FK__COMPRA__idProvee__6D0D32F4] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[PROVEEDOR] ([idProveedor])
GO
ALTER TABLE [dbo].[COMPRA] CHECK CONSTRAINT [FK__COMPRA__idProvee__6D0D32F4]
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD  CONSTRAINT [FK__COMPRA__idUsuari__6C190EBB] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[USUARIO] ([idUsuario])
GO
ALTER TABLE [dbo].[COMPRA] CHECK CONSTRAINT [FK__COMPRA__idUsuari__6C190EBB]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK__DETALLE_C__idCom__6E01572D] FOREIGN KEY([idCompra])
REFERENCES [dbo].[COMPRA] ([idCompra])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] CHECK CONSTRAINT [FK__DETALLE_C__idCom__6E01572D]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[PRODUCTO] ([idProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[PRODUCTO] ([idProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD  CONSTRAINT [FK__DETALLE_V__idVen__6FE99F9F] FOREIGN KEY([idVenta])
REFERENCES [dbo].[VENTA] ([idVenta])
GO
ALTER TABLE [dbo].[DETALLE_VENTA] CHECK CONSTRAINT [FK__DETALLE_V__idVen__6FE99F9F]
GO
ALTER TABLE [dbo].[PERMISO]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[ROL] ([idRol])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[CATEGORIA] ([idCategoria])
GO
ALTER TABLE [dbo].[TRANSACCION_CAJA]  WITH CHECK ADD  CONSTRAINT [FK__TRANSACCI__idCaj__5F7E2DAC] FOREIGN KEY([idCajaRegistradora])
REFERENCES [dbo].[CAJA_REGISTRADORA] ([idCajaRegistradora])
GO
ALTER TABLE [dbo].[TRANSACCION_CAJA] CHECK CONSTRAINT [FK__TRANSACCI__idCaj__5F7E2DAC]
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD  CONSTRAINT [FK__USUARIO__idRol__73BA3083] FOREIGN KEY([idRol])
REFERENCES [dbo].[ROL] ([idRol])
GO
ALTER TABLE [dbo].[USUARIO] CHECK CONSTRAINT [FK__USUARIO__idRol__73BA3083]
GO
/****** Object:  StoredProcedure [dbo].[SP_APERTURACAJA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_APERTURACAJA] (
@usuarioAperturaCaja varchar(20),
@estado bit,
@saldo decimal(18,2),

@resultado bit output,
@mensaje varchar(500) output)
as
begin
set @resultado = 0

begin 
INSERT INTO CAJA_REGISTRADORA (usuarioAperturaCaja,estado,saldo,fechaCierre) values (@usuarioAperturaCaja,@estado,@saldo,null)
set @resultado = SCOPE_IDENTITY()
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_CERRARCAJA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_CERRARCAJA] (
@idCajaRegistradora int,
@fechaCierre varchar (20),

@saldo decimal (18,2),
@resultado bit output,
@mensaje varchar(500) output)
as
begin
set @resultado = 1

UPDATE CAJA_REGISTRADORA SET
fechaCierre=@fechaCierre,
estado=0,
saldo=@saldo
where idCajaRegistradora=@idCajaRegistradora


end
GO
/****** Object:  StoredProcedure [dbo].[SP_DETALLECAJA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DETALLECAJA](
@fechaConsulta varchar(10)
)
as
begin

select cr.fechaApertura,tc.hora,tc.tipoTransaccion,tc.monto,tc.docAsociado,tc.usuarioTransaccion 
from CAJA_REGISTRADORA cr
inner join TRANSACCION_CAJA tc  on tc.idCajaRegistradora = cr.idCajaRegistradora
where cr.fechaApertura = @fechaConsulta
end
GO
/****** Object:  StoredProcedure [dbo].[SP_EDITARCATEGORIA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_EDITARCATEGORIA](
@idCategoria int,
@descripcion varchar (50),
@estado bit ,
@resultado bit output,
@mensaje varchar(500) output
)
as 
begin

SET @resultado = 1
if not exists (SELECT * FROM CATEGORIA WHERE descripcion = @descripcion and idCategoria != @idCategoria)
	
	UPDATE  CATEGORIA SET 
	descripcion = @descripcion,
	estado = @estado
	WHERE idCategoria = @idCategoria
	
	ELSE
	begin
		set @resultado =  0
		set @mensaje =  'No se puede repetir la descripcion de una categoria'
		end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_EDITARPRODUCTO]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_EDITARPRODUCTO] (
@idProducto int,
@codigo varchar (20),
@nombre varchar(30),
@descripcion varchar (30),
@idCategoria int,
@estado bit,
@stock int,
@precioCompra decimal (18,2),
@precioVenta decimal (18,2),
@resultado bit output,
@mensaje varchar(500) output)
as
begin
set @resultado = 1
if not exists (select * from PRODUCTO WHERE codigo=@codigo AND idProducto!= @idProducto)
UPDATE PRODUCTO SET
codigo=@codigo,
nombre=@nombre,
descripcion=@descripcion,
idCategoria=@idCategoria,
estado=@estado,
stock=@stock,
precioCompra=@precioCompra,
precioVenta=@precioVenta
where idProducto=@idProducto
else
begin 
set @resultado=0
set @mensaje = 'ya existe un producto con el mimso codigo'
end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_EDITARPROVEEDOR]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_EDITARPROVEEDOR](
@idProveedor int,
@documento varchar(50),
@razonSocial varchar(50),
@correo varchar(50),
@telefono varchar(50),
@estado bit,
@resultado bit output,
@mensaje varchar(500) output)
as
BEGIN
set @resultado=1
declare @idPersona int
if not exists (SELECT * FROM PROVEEDOR WHERE documento =@documento and idProveedor!=@idProveedor)
begin
UPDATE PROVEEDOR SET 
documento=@documento,
razonSocial=@razonSocial,
correo=@correo,
telefono=@telefono,
estado=@estado
where idProveedor=@idProveedor
end
else
begin
set @resultado=0
set @mensaje = 'El numero de cuit ya existe'
end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_EDITARUSUARIO]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_EDITARUSUARIO](
@idUsuario int,
@documento varchar (50),
@nombreCompleto varchar (100),
@correo varchar (100),
@clave varchar (100),
@idRol int,
@estado bit,
@respuesta bit output,
@mensaje varchar(500) output

)
as 
begin

set @respuesta = 0
set @mensaje = ''
if not exists( select * from USUARIO where documento = @documento and idUsuario != @idUsuario)
begin 
UPDATE USUARIO SET 
documento= @documento,
nombreCompleto = @nombreCompleto,
correo = @correo,
clave = @clave,
idRol = @idRol,
estado = @estado 
where idUsuario = @idUsuario

		set @respuesta = 1
		
end
else 
set @mensaje = 'No se puede repetir el documento para mas de un usuario'



end
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARCATEGORIA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_ELIMINARCATEGORIA](
@idCategoria int,
@resultado bit output,
@mensaje varchar(500) output
) as 
begin

SET @resultado = 1
if not exists (
SELECT * FROM CATEGORIA c
inner join PRODUCTO p ON P.idCategoria= C.idCategoria
WHERE  C.idCategoria = @idCategoria
)

BEGIN

DELETE TOP(1) FROM CATEGORIA WHERE idCategoria= @idCategoria
END

	ELSE
	begin
		set @resultado =  0
		set @mensaje =  'No se puede eliminar  la categoria porque se encuentra relacionado a un producto'
		end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARPRODUCTO]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_ELIMINARPRODUCTO](
@idProducto int ,
@respuesta bit output,
@mensaje varchar (500) output)
as
begin
set @respuesta = 0
set @mensaje =''
declare @pasoreglas bit = 1

if exists (select * from DETALLE_COMPRA dc
inner join PRODUCTO  p on p.idProducto= dc.idProducto
where p.idProducto= @idProducto)
begin 
set @pasoreglas = 0
set @respuesta=0
set @mensaje = @mensaje + 'No se puede eliminar el producto porque se encuentra relacionado a una compra\n'
end
if exists (select * from DETALLE_VENTA dv
inner join PRODUCTO  p on p.idProducto= dv.idProducto
where p.idProducto= @idProducto)
begin
set @pasoreglas = 0
set @respuesta=0
set @mensaje = @mensaje + 'No se puede eliminar el producto porque se encuentra relacionado a una venta\n'
end
if (@pasoreglas = 1)
begin
delete from PRODUCTO WHERE idProducto=@idProducto
set @respuesta=1
end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARPROVEEDOR]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_ELIMINARPROVEEDOR](
@idProveedor int,
@resultado bit output,
@mensaje varchar(500) output)
as
begin
set @resultado=1
if not exists (
SELECT * FROM PROVEEDOR p 
INNER JOIN COMPRA C ON P.idProveedor=C.idProveedor
WHERE p.idProveedor=@idProveedor)
begin
delete top(1) from PROVEEDOR WHERE idProveedor = @idProveedor
END
ELSE
BEGIN
SET @resultado = 0
SET @mensaje= 'No se puede eliminar le proveedor porque se encuentra relacionado a una Compra'
end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARUSUARIO]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_ELIMINARUSUARIO](
@idUsuario int,

@respuesta bit output,
@mensaje varchar(500) output

)
as 
begin

set @respuesta = 0
set @mensaje = ''
declare @pasoreglas bit = 1

if exists ( select * from COMPRA C 
INNER JOIN USUARIO U ON U.idUsuario = C.idUsuario
WHERE C.idUsuario= @idUsuario
)
BEGIN
set @pasoreglas = 0
set @respuesta = 0
set @mensaje = @mensaje + 'No se puede eliminar porque el usuario se encuentra relacionado a una compra\n'
END

if exists ( select * from VENTA V 
INNER JOIN USUARIO U ON U.idUsuario = V.idUsuario
WHERE V.idUsuario= @idUsuario
)
BEGIN
set @pasoreglas = 0
set @respuesta = 0
set @mensaje = @mensaje + 'No se puede eliminar porque el usuario se encuentra relacionado a una venta \n'
END

if (@pasoreglas = 1) 
begin 
delete from USUARIO  WHERE idUsuario =@idUsuario
SET @respuesta = 1
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICARCLIENTE]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_MODIFICARCLIENTE](
@idCliente int,
@documento varchar(50),
@nombreCompleto varchar (50),
@correo varchar(50),
@telefono varchar(50),
@estado bit,
@resultado int output,
@mensaje varchar(500) output)
as
begin 
SET @resultado=1
declare @idPersona int
if not exists (SELECT * FROM CLIENTE WHERE documento = @documento and idCliente != @idCliente)
begin
UPDATE CLIENTE SET
documento = @documento,
nombreCompleto=@nombreCompleto,
correo=@correo,
telefono=@telefono,
estado=@estado
WHERE idCliente=@idCliente
end
else
begin
set @resultado=0
set @mensaje='El numero de documento ya existe'
end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRARCATEGORIA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_REGISTRARCATEGORIA](

@descripcion varchar (50),
@estado bit ,
@resultado int output,
@mensaje varchar(500) output
) as 
begin

SET @resultado = 0
if not exists (SELECT * FROM CATEGORIA WHERE descripcion = @descripcion)
	begin
	INSERT INTO CATEGORIA (descripcion,estado) VALUES  (@descripcion , @estado)
	set @resultado = SCOPE_IDENTITY()
	end
	ELSE
		set @mensaje =  'No se puede repetir la descripcion de una categoria'
end
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRARCLIENTE]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_REGISTRARCLIENTE](

@documento varchar(50),
@nombreCompleto varchar (50),
@correo varchar(50),
@telefono varchar(50),
@estado bit,
@resultado int output,
@mensaje varchar(500) output
)
as
begin 
SET @resultado = 0
declare @idPersona int
if not exists(SELECT * FROM CLIENTE WHERE documento=@documento)
begin
INSERT INTO CLIENTE (documento,nombreCompleto,correo,telefono,estado) VALUES (@documento,@nombreCompleto,@correo,@telefono,@estado)
set @resultado = SCOPE_IDENTITY()
end

else
set @mensaje='El numero de documento ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRARCOMPRA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_REGISTRARCOMPRA](
@idUsuario int,
@idProveedor int,
@tipoDocumento varchar(500),
@nroDocumento varchar (500),
@montoTotal decimal (18,2),
@detalleCompra [eDetalle_Compra] READONLY,
@resultado bit output,
@mensaje varchar(500) output
) AS
BEGIN

			BEGIN TRY
				declare @idCompra int = 0
				set @resultado = 1
				set @mensaje = ''

					begin transaction registro

						INSERT INTO COMPRA (idUsuario,idProveedor,tipoDocumento,nroDocumento,montoTotal)
						VALUES (@idUsuario,@idProveedor,@tipoDocumento,@nroDocumento,@montoTotal)
						set @idCompra = SCOPE_IDENTITY()

						INSERT INTO DETALLE_COMPRA(idCompra,idProducto,precioCompra,precioVenta,cantidad,montoTotal)
						select @idCompra,idProducto,precioCompra,precioVenta,cantidad,montoTotal from @detalleCompra

						UPDATE p set p.stock = p.stock + dc.cantidad,
						p.precioCompra = dc.precioCompra,
						p.precioVenta = dc.precioVenta
						from PRODUCTO p
						INNER JOIN @detalleCompra dc on dc.idProducto = p.idProducto



					commit transaction registro

			END TRY
			BEGIN CATCH
				set @resultado = 0
				set @mensaje = ERROR_MESSAGE()
				ROLLBACK TRANSACTION registro

			END CATCH



END
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRARMOVIMIENTO]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_REGISTRARMOVIMIENTO](
@idCajaRegistradora int,
@tipoTransaccion NVARCHAR(50),
@monto decimal (18,2),
@docAsociado NVARCHAR(50),
@usuarioTransaccion NVARCHAR(50),
@resultado bit output,
@mensaje varchar(500) output)
as
begin
set @resultado = 0
if not exists (select * from TRANSACCION_CAJA WHERE docAsociado= @docAsociado)
begin
INSERT INTO TRANSACCION_CAJA (idCajaRegistradora,tipoTransaccion,monto,docAsociado,usuarioTransaccion)
values (@idCajaRegistradora,@tipoTransaccion,@monto,@docAsociado,@usuarioTransaccion)
set @resultado = SCOPE_IDENTITY()
end
else
set @mensaje = 'No se puede duplicar un movimiento para un mismo documento Asociado'
end
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRARPRODUCTO]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_REGISTRARPRODUCTO] (
@codigo varchar(20),
@nombre varchar (30),
@descripcion varchar (30),
@idCategoria int,
@estado bit,
@stock int,
@precioCompra decimal (18,2),
@precioVenta decimal (18,2),
@resultado int output,
@mensaje varchar(500) output)
as
begin
set @resultado = 0
IF not exists (SELECT * FROM PRODUCTO where codigo =@codigo)
begin 
INSERT INTO PRODUCTO (codigo,nombre,descripcion,idCategoria,estado,stock,precioCompra,precioVenta) values (@codigo,@nombre,@descripcion,@idCategoria,@estado,@stock,@precioCompra,@precioVenta)
set @resultado = SCOPE_IDENTITY()
end
else
set @mensaje = 'Ya existe un producto con el mismo Codigo'
end
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRARPROVEEDOR]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_REGISTRARPROVEEDOR](
@documento varchar(50),
@razonSocial varchar(50),
@correo varchar(50),
@telefono varchar(50),
@estado bit,
@resultado int output,
@mensaje varchar(500) output)
as
BEGIN
SET @resultado=0
declare @idPersona int
if not exists (SELECT * FROM PROVEEDOR WHERE documento =@documento)
BEGIN
INSERT INTO PROVEEDOR (documento,razonSocial,correo,telefono,estado) VALUES(
@documento,@razonSocial,@correo,@telefono,@estado)

set @resultado = SCOPE_IDENTITY()
end
else
set @mensaje = 'El numero de CUIT ya existe'
end
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRARUSUARIO]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_REGISTRARUSUARIO](
@documento varchar (50),
@nombreCompleto varchar (100),
@correo varchar (100),
@clave varchar (100),
@idRol int,
@estado bit,
@resultado int output,
@mensaje varchar(500) output

)
as 
begin

set @resultado = 0

if not exists( select * from USUARIO where documento = @documento)
begin 
insert into USUARIO (documento,nombreCompleto,correo,clave,idRol,estado) values ( @documento,@nombreCompleto,@correo,@clave,@idRol,@estado)
set @resultado = SCOPE_IDENTITY()
		
end
else 
set @mensaje = 'No se puede repetir el documento para mas de un usuario'



end
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRARVENTA]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTRARVENTA](
@idUsuario int,
@tipoDocumento varchar(500),
@nroDocumento varchar(500),
@documentoCliente varchar(500),
@nombreCliente varchar(500),
@montoPago decimal(18,2),
@montoCambio decimal(18,2),
@montoTotal decimal(18,2),
@formaPago varchar(100),
@detalleVenta [EDetalle_Venta] READONLY,
@resultado bit output,
@mensaje varchar(500) output
) AS
BEGIN

BEGIN TRY
DECLARE @idVenta int = 0
set @resultado = 1
set @mensaje = ''

	BEGIN TRANSACTION registro

		INSERT INTO VENTA (idUsuario,tipoDocumento,nroDocumento,documentoCliente,nombreCliente,montoPago,montoCambio,montoTotal,formaPago)
			VALUES (@idUsuario,@tipoDocumento,@nroDocumento,@documentoCliente,@nombreCliente,@montoPago,@montoCambio,@montoTotal,@formaPago)

			SET @idVenta = SCOPE_IDENTITY()

				INSERT INTO DETALLE_VENTA(idVenta,idProducto,precioVenta,cantidad,subTotal)
					SELECT @idVenta,idProducto,precioVenta,cantidad,subTotal FROM @detalleVenta

	COMMIT TRANSACTION registro

END TRY

BEGIN CATCH 
	SET @resultado=0
	set @mensaje = ERROR_MESSAGE()
	ROLLBACK TRANSACTION registro
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_REPORTECOMPRAS]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_REPORTECOMPRAS](
@fechaInicio varchar(10),
@fechaFin varchar(10),
@idProveedor int)
as
begin
SET DATEFORMAT dmy;
select 
convert(char(10),c.fechaRegistro,103)[FechaRegistro], c.tipoDocumento, c.nroDocumento,c.montoTotal,
u.nombreCompleto[UsuarioRegistro],
pr.documento[DocumentoProveedor],pr.razonSocial,
p.codigo[CodigoProducto],p.nombre[NombreProducto],ca.descripcion[Categoria],dc.precioCompra,dc.precioVenta,dc.cantidad,dc.montoTotal[SubTotal]


from COMPRA c
inner join USUARIO U ON U.idUsuario= C.idUsuario
INNER JOIN PROVEEDOR pr ON pr.idProveedor=c.idProveedor
inner join DETALLE_COMPRA dc on dc.idCompra = c.idCompra
inner join PRODUCTO p on p.idProducto= dc.idProducto
inner join CATEGORIA ca on ca.idCategoria = p.idCategoria
WHERE CONVERT(DATE,c.fechaRegistro) BETWEEN @fechaInicio AND @fechaFin
and pr.idProveedor = iif(@idProveedor=0,pr.idProveedor,@idProveedor)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_REPORTEVENTAS]    Script Date: 1/6/2023 15:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REPORTEVENTAS](
@fechaInicio varchar(10),
@fechaFin varchar(10))
as
begin
SET DATEFORMAT dmy;
select 
convert(char(10),v.fechaRegistro,103)[FechaRegistro], v.tipoDocumento, v.nroDocumento,v.montoTotal,
u.nombreCompleto[UsuarioRegistro],
v.documentoCliente,v.nombreCliente,v.formaPago,
p.codigo[CodigoProducto],p.nombre[NombreProducto],ca.descripcion[Categoria],dv.precioVenta,dv.cantidad,dv.subTotal


from VENTA v
inner join USUARIO U ON U.idUsuario= v.idUsuario

inner join DETALLE_VENTA dv on dv.idVenta = v.idVenta
inner join PRODUCTO p on p.idProducto= dv.idProducto
inner join CATEGORIA ca on ca.idCategoria = p.idCategoria
WHERE CONVERT(DATE,v.fechaRegistro) BETWEEN @fechaInicio AND @fechaFin

end
GO
USE [master]
GO
ALTER DATABASE [DBSISTEMA] SET  READ_WRITE 
GO
INSERT INTO [dbo].[ROL]
           ([descripcion]
           )
     VALUES
           ('ADMINISTRADOR')
           
GO

INSERT INTO [dbo].[ROL]
           ([descripcion]
           )
     VALUES
           ('EMPLEADO')

GO

GO
INSERT INTO USUARIO
           ([documento]
           ,[nombreCompleto]
           ,[correo]
           ,[clave]
           ,[idRol]
           ,[estado]
           )
     VALUES
           (36618342,'JOACO ALVAREZ','JOAQUINAALVAREZ91@GMAIL.COM','mu0303456',1,1)


GO


INSERT INTO [dbo].[PERMISO]
           ([idRol],[nombreMenu])
     VALUES
           (1,'menuUsuarios')
GO

INSERT INTO [dbo].[PERMISO]
           ([idRol],[nombreMenu])
     VALUES
           (1,'menuMantenedor')
GO
INSERT INTO [dbo].[PERMISO]
           ([idRol],[nombreMenu])
     VALUES
           (1,'menuVentas')


GO

INSERT INTO [dbo].[PERMISO]
           ([idRol],[nombreMenu])
     VALUES
           (1,'menuCompras')
GO
INSERT INTO [dbo].[PERMISO]
           ([idRol],[nombreMenu])
     VALUES
           (1,'menuClientes')
GO

INSERT INTO [dbo].[PERMISO]
           ([idRol],[nombreMenu])
     VALUES
           (1,'menuProveedores')
GO

INSERT INTO [dbo].[PERMISO]
           ([idRol],[nombreMenu])
     VALUES
           (1,'menuReportes')
GO

INSERT INTO [dbo].[PERMISO]
           ([idRol],[nombreMenu])
     VALUES
           (1,'menuCajaRegistradora')
GO

INSERT INTO [dbo].[PERMISO]
           ([idRol],[nombreMenu])
     VALUES
           (2,'menuVentas')


GO