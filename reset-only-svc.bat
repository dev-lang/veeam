wmic service where "name like 'Veeam%%'" call stopservice
pause
wmic service where "name like 'Veeam%%'" call startservice
pause
