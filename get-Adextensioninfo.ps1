$csvData = Import-Csv -Path 'pathinfo'

 

$updatedData = $csvData | ForEach-Object {

    $email = $_.EmailAddress

    $user = Get-ADUser -Filter {EmailAddress -eq $email} -Properties extensionattribute9

 

    if ($user) {

        $extensionAttribute9 = $user.extensionattribute9 -f "FO"

    } else {

        $extensionAttribute9 = "Not Found"

    }

 

    [PSCustomObject]@{

        EmailAddress = $email

        extensionattribute9 = $extensionAttribute9

    }

}

 

# Export the updated data to a new CSV file

$updatedData | Export-Csv -Path 'pathinfo' -NoTypeInformation 
