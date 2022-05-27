 

$Computer = Read-Host "Please Enter Computer Name "

 

Invoke-Command -ComputerName $Computer -ScriptBlock {

 

$initialsize = Read-Host "Please Enter initial pagefile size "

$maxsize = Read-Host "Please Enter maximum pagefile size "

 

 

#  Set automanage pagefile to false; min/max pagefile size

$computerSystem = Get-WmiObject -Class Win32_ComputerSystem -EnableAllPrivileges

$computerSystem.AutomaticManagedPagefile = $false

$computerSystem.Put() | Out-Null

 

$pageFileSetting = Get-WmiObject -Class Win32_PageFileSetting

$pageFileSetting.InitialSize = $initialsize

$pageFileSetting.MaximumSize = $maxsize

$pageFileSetting.Put() | Out-Null

}