﻿
/****** Object:  Table [dbo].[HMM_HISTORIAL_MOVIMIENTO]    Script Date: 10-11-2016 11:42:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[HMM_HISTORIAL_MOVIMIENTO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FECHA_MOVIMIENTO] [datetime] NULL,
	[TIPO_MOVIMIENTO] [varchar](250) NULL,
	[USUARIO_MOVIMIENTO] [int] NULL,
	[USUARIO_ORIGEN] [int] NULL,
 CONSTRAINT [PK_HMM_HISTORIAL_MOVIMIENTO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

