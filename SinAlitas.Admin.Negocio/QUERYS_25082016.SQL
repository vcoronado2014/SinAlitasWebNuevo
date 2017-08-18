
/****** Object:  Table [dbo].[ROL_ROL]    Script Date: 25-08-2016 8:59:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ROL_ROL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](250) NULL,
	[ACTIVO] [int] NULL,
	[ELIMINADO] [int] NULL,
 CONSTRAINT [PK_ROL_ROL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

INSERT INTO [dbo].[ROL_ROL]
           ([NOMBRE]
           ,[ACTIVO]
           ,[ELIMINADO])
     VALUES
           ('Super Administrador'
           ,1
           ,0)
GO

INSERT INTO [dbo].[ROL_ROL]
           ([NOMBRE]
           ,[ACTIVO]
           ,[ELIMINADO])
     VALUES
           ('Supervisor'
           ,1
           ,0)
GO

INSERT INTO [dbo].[ROL_ROL]
           ([NOMBRE]
           ,[ACTIVO]
           ,[ELIMINADO])
     VALUES
           ('Profesor'
           ,1
           ,0)
GO

alter table pco_producto_codigo add PORCENTAJE_DESCUENTO INT NULL
GO

alter table PROF_PROFESOR add ROL_ID INT NULL
GO

UPDATE PROF_PROFESOR set rol_id = 3
go

alter table PCO_PRODUCTO_CODIGO add TOTAL_PACK INT NULL
GO
INSERT INTO [dbo].[PROF_PROFESOR]
           ([RUT]
           ,[NOMBRES]
           ,[PRIMER_APELLIDO]
           ,[SEGUNDO_APELLIDO]
           ,[FOTOGRAFIA]
           ,[CODIGO]
           ,[PAI_ID]
           ,[REG_ID]
           ,[COM_ID]
           ,[DIRECCION]
           ,[SEXO]
           ,[FECHA_NACIMIENTO]
           ,[NOMBRE_USUARIO]
           ,[PASSWORD]
           ,[ACTIVO]
           ,[ELIMINADO]
           ,[TELEFONOS_CONTACTO]
           ,[BANCO]
           ,[TIPO_CUENTA]
           ,[NUMERO_CUENTA]
           ,[EMAIL]
           ,[NOD_ID]
           ,[COM_ID_ASIGNADA]
           ,[ROL_ID])
     VALUES
           ('11111111-1'
           ,'JUAN'
           ,'PEREZ'
           ,'PEREZ'
           ,''
           ,''
           ,1
           ,13
           ,2
           ,'PRUEBA 1561'
           ,'Masculino'
           ,'01-01-1972'
           ,'juanperez'
           ,'123456'
           ,1
           ,0
           ,'85006987'
           ,'Estado'
           ,1
           ,'11111111'
           ,'vcoronado@saydex.cl'
           ,1
           ,'*'
           ,2)
GO
