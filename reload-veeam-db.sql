-- DETTACHME
DECLARE @MSG_NOBASE NVARCHAR(64);
SET @MSG_NOBASE = N'No existe la base de datos '
+ 'VeeamBackup';  

DECLARE @MSG_DEBASE NVARCHAR(64);
SET @MSG_DEBASE = N'Se ha eliminado la base de datos '
+ 'VeeamBackup';  
 
USE [master]
IF EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'VeeamBackup' )
	BEGIN
		ALTER DATABASE [VeeamBackup] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
		EXEC master.dbo.sp_detach_db @dbname = N'VeeamBackup'
		PRINT @MSG_DEBASE
	END
ELSE 
	PRINT @MSG_NOBASE

-- ATTACHME 
DECLARE @MSG_BASE NVARCHAR(64);
SET @MSG_BASE = N'Ya existe la base de datos '
+ 'VeeamBackup';

DECLARE @MSG_NBASE NVARCHAR(64);
SET @MSG_NBASE = N'Se ha creado la base de datos '
+ 'VeeamBackup';

USE [master]
IF NOT EXISTS ( SELECT [name] FROM sys.databases WHERE [name] = 'VeeamBackup' )
	BEGIN
		CREATE DATABASE [VeeamBackup] ON 
		( FILENAME = N'C:\Users\IEUser\Desktop\VeeamBackup.mdf' ),
		( FILENAME = N'C:\Users\IEUser\Desktop\VeeamBackup_log.ldf' )
		 FOR ATTACH
		PRINT @MSG_NBASE
	END
ELSE 
	PRINT @MSG_BASE
