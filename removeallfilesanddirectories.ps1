$computer = Read-Host "Please Enter Computer Name: "
 

Invoke-Command -ComputerName $computer -ScriptBlock {

Write-Host "example of directory C:\user\test"

$dir = Read-Host "Please enter directory"

Get-ChildItem $dir -Recurse | ForEach { Remove-Item $_.FullName -Force -Recurse }

 

}