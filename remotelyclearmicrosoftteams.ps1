Write-Host "Make sure the users teams has been quit completely"

Write-Host "This will clear the teams cache for all users on the pc"

$Computer = Read-Host "Please Enter Computer Name: "


 

Invoke-Command -ComputerName $Computer -ScriptBlock {


Get-ChildItem "C:\Users\*\AppData\Roaming\Microsoft\Teams\*" -directory | Where name -in ('application cache','blob_storage','databases','GPUcache','IndexedDB','Local Storage','tmp','Temp','Cache') | ForEach{Remove-Item $_.FullName -Recurse -Force}

   

}