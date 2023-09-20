#microsoft graph and msal use

 

 

$null = Get-PSSession | Remove-PSSession

[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

 

 

#Generate Access Token to use in the connection string to MSGraph

#first one is clientid

$AppId = 'clientidorappid'

$TenantId = 'tenantid'

$ClientSecret = 'getfromapp'

 

# the force refresh at the end forces the access token to be refreshed automatically.

Import-Module MSAL.PS

$MsalToken = Get-MsalToken -TenantId $TenantId -ClientId $AppId -ClientSecret ($ClientSecret | ConvertTo-SecureString -AsPlainText -Force) -ForceRefresh

#Connect to Graph using access token

Connect-Graph -AccessToken $MsalToken.AccessToken

 

$UPN = 'upn'

 

Get-MgUserAuthenticationMethod -UserId $UPN

 

#Get-MgContext | Select -ExpandProperty Scopes

 

Disconnect-MgGraph 
