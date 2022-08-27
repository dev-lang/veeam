@echo off
title Reiniciar Servicios en Veeam 11
wmic service where "name like 'Veeam%'" call stopservice
taskkill /f /im Veeam*
net start VeeamBackupSvc
net start VeeamAWSSvc
net start VeeamAzureSvc
net start VeeamBackupCdpSvc
net start VeeamBackupRESTSvc
net start VeeamBrokerSvc
net start VeeamCatalogSvc
net start VeeamCloudSvc
net start VeeamCRS	
net start VeeamDCS
net start VeeamDeploySvc
net start VeeamDistributionSvc
net start VeeamEndpointBackupSvc
net start VeeamExplorersRecoverySvc
net start VeeamFilesysVssSvc
net start VeeamGCPSvc
net start VeeamMountSvc	
net start VeeamNFSSvc
net start VeeamOneAgentSvc
net start VeeamRSS
net start VeeamTapeSvc
net start VeeamTransportSvc
net start VeeamVssProviderSvc
cd "C:\Program Files\Veeam\Backup and Replication\Console"
start veeam.backup.shell.exe -logon VeeamBackupServer:localhost:9392:current
pause
