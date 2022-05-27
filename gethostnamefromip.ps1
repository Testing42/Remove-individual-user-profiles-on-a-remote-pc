$ipAddress= Read-Host "What is the ip address"

[System.Net.Dns]::GetHostByAddress($ipAddress).Hostname