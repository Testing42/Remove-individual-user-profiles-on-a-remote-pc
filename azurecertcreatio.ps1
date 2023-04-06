# Create certificate

$mycert = New-SelfSignedCertificate -DnsName "yourdnsname" -CertStoreLocation "cert:\CurrentUser\My" -NotAfter (Get-Date).AddYears(1) -KeySpec KeyExchange

 

# Export certificate to .pfx file

$mycert | Export-PfxCertificate -FilePath C:\your\directory\path\cert\certTestcreation.pfx -Password (Get-Credential).password

 

# Export certificate to .cer file

$mycert | Export-Certificate -FilePath C:\Users\a-moralesa\Documents\cert\certTestcreation.cer

 

# below this line the script deletes the certs made inside of the store.

 

$certThumbPrint = @()

$certThumbPrint = Get-ChildItem Cert:\CurrentUser\My | Select-Object -ExpandProperty Thumbprint

 
#remove this foreach loop if you want the cert to remain in your cert manager
foreach($cert in $certThumbPrint){

    Get-ChildItem Cert:\CurrentUser\My\$cert | Remove-Item

}

 

<#

 

Step 1. run the script above to create the cert with a change in the name above and change the dnsname

 

step 2. change the the .addyears() to a different number so that the certificate lasts longer

 

step 3. take the cert and add it to your automation account the pfx goes here with the password you

created in this script the username doesn't matter but the password doesn't have to be an actual account in azure.

 

Step 4. Go to application you are using for authentication and upload the cert using th ".cer"

 

step 5. now you are able to use the certificate to authenticate.

 

 

#>

 
	
