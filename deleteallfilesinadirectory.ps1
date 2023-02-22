$cn = Read-Host "What is the hostname"

$Fulldir = Read-Host "What is the path"

 

 

Invoke-Command -Computer $cn -ScriptBlock {

 

    #[System.IO.Directory]::Delete($args[0], $true)

    Remove-Item $args[0] -Recurse -Force -Verbose

   

} -ArgumentList $Fulldir
