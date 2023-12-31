USE [DBEst]
GO
/****** Object:  Table [dbo].[est]    Script Date: 22/09/2023 14:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[est](
	[codigo] [varchar](5) NULL,
	[nombres] [varchar](50) NULL,
	[telefono] [int] NULL,
	[grado] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_buscar_est]    Script Date: 22/09/2023 14:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_buscar_est]
@nombres varchar (50)
as
select codigo,nombres,telefono,grado from est where nombres like @nombres + '%'
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_est]    Script Date: 22/09/2023 14:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_listar_est]
as
select * from est order by codigo 
GO
/****** Object:  StoredProcedure [dbo].[sp_mantenimiento_est]    Script Date: 22/09/2023 14:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_mantenimiento_est]
@codigo varchar (5),
@nombres varchar (50),
@telefono int,
@grado varchar (50),
@accion varchar (50) output
as
if (@accion='1')
begin
    declare @codnuevo varchar (5), @codmax varchar(5)
	set @codmax = (select max(codigo) from est)
	set @codmax = isnull(@codmax, 'A0000')
	set @codnuevo = 'A'+RIGHT(RIGHT(@codmax,4)+10001,4)
	insert into est(codigo,nombres,telefono,grado)
	values(@codnuevo,@nombres,@telefono,@grado)
	set @accion='Se genero el codigo: ' +@codnuevo
end
else if (@accion='2')
begin
    update est set nombres=@nombres, telefono=@telefono, grado=@grado where codigo=@codigo
	set @accion='Se modifico el codigo: ' +@codigo
end
else if (@accion='3')
begin
    delete from est where codigo=@codigo
	set @accion='Se borro el codigo: ' +@codigo
end 
GO
