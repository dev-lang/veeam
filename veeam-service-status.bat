@echo off
title Consultar status de servicios de Veeam

set archivo="status.txt"

if exist %archivo% (
  echo el archivo %archivo% existe, se va a eliminar
  del %archivo%
) else (
  echo el archivo %archivo% no existe, se va a crear al finalizar el script
)

wmic service where (name like 'Veeam%%') get name, state /value >> %archivo%

if exist %archivo% (
  echo el archivo %archivo% se ha creado o modificado
	type %archivo%
) else (
  echo el archivo %archivo% no existe, vuelva a intentarlo
)

pause
