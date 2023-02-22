$cn = Read-Host "What is the hostname"

$Fulldir = "C:\Users"

$listofUsers = @()

 

 

$listofUsers += Invoke-Command -Computer $cn -ScriptBlock {

 

    Get-ChildItem -Path $args[0] -Directory

    

} -ArgumentList $Fulldir | Select Name

 

 

$listofUsersFiltered = @($listofUsers | ForEach-Object {$_.name})

 

$users = $listofUsersFiltered

    foreach ($user in $users){

        Get-ADUser -Filter {

            name -like $user -or samaccountname -like $user

            } | Select Name,SamAccountName,Enabled } 
