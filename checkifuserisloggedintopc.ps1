$pc = Read-Host "What is the hostname"


(Get-CimInstance -ComputerName $pc -ClassName Win32_ComputerSystem).CimInstanceProperties | where{$_.Name -like "UserName"}| select value