
$Thumbprint = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

$TenantId = 'yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyy'

$ApplicationId = '00000000-0000-0000-0000-00000000'

Connect-AzAccount -CertificateThumbprint $Thumbprint -ApplicationId $ApplicationId -Tenant $TenantId -ServicePrincipal
