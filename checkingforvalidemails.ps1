#domain control server

$DC = 'your full domain name here'

foreach($line in Get-Content C:\Users\amorales\Documents\emails.txt) {

    if(Get-ADUser -Filter "mail -like '$line*'" -Server $DC ) {

        "$line is valid"

    }

    else {

        "$line is invalid"

    }

}
