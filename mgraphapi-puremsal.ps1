$authparams = @{

    ClientID = 'appidorclientid'

    TenantId = 'tenantid'

    ClientSecret =('getfromapp' | ConvertTo-SecureString -AsPlainText -Force)

}

$auth = Get-MsalToken @authParams

 

 

$authorizationHeader = @{

    Authorization = $auth.CreateAuthorizationHeader()

}

$requestBody = @{

    Method      = 'Get'

    Uri         = 'https://graph.microsoft.com/v1.0/users/user@upn.com/authentication/methods'

    Headers     = $authorizationHeader

    ContentType = 'Application/Json'

}

$response = Invoke-RestMethod @requestBody

 

$response | select value 
