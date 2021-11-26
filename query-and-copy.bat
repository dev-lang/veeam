@echo off

set filedir=%programdata%\Veeam\EndpointData\VeeamBackup.mdf
set filedir2=%programdata%\Veeam\EndpointData\VeeamBackup_log.ldf

set destdir=C:\Users\IEUser\Desktop

set route=%programdata%\Veeam\EndpointData

NET stop VeeamEndpointBackupSvc

TAKEOWN /F %route%
ICACLS %route% /grant %USERNAME%:F
TAKEOWN /F %filedir%
TAKEOWN /F %filedir2%
ICACLS %filedir% /grant %USERNAME%:F
ICACLS %filedir2% /grant %USERNAME%:F

pause
copy %filedir% %destdir%\VeeamBackup.mdf
copy %filedir2% %destdir%\VeeamBackup_log.ldf

pause
NET START VeeamEndpointBackupSvc

echo INFO del reg

REG QUERY "HKLM\SOFTWARE\Veeam\Veeam Endpoint Backup" /V SqlDatabaseName 
REG QUERY "HKLM\SOFTWARE\Veeam\Veeam Endpoint Backup" /V SqlInstanceName
REG QUERY "HKLM\SOFTWARE\Veeam\Veeam Endpoint Backup" /V SqlServerName
REG QUERY "HKLM\SOFTWARE\Veeam\Veeam Endpoint Backup\DbConfiguration" /V SqlLogin
REG QUERY "HKLM\SOFTWARE\Veeam\Veeam Endpoint Backup\DbConfiguration" /V SqlPassword

PAUSE
