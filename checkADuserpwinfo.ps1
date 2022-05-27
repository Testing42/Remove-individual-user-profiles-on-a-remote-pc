$username = Read-Host "Please Enter the username: "

 

Get-ADUser -identity $username -properties PasswordLastSet, PasswordExpired, PasswordNeverExpires | ft Name, PasswordLastSet, PasswordExpired, PasswordNeverExpires