
$securePassword = $plainPassword | ConvertTo-SecureString -AsPlainText -Force

$TenantId = 'yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyy'

$ApplicationId = 'zzzzzzzz-zzzz-zzzz-zzzz-zzzzzzzz'

Connect-AzAccount -ServicePrincipal -ApplicationId $ApplicationId -TenantId $TenantId -CertificatePath './certificatefortest.pfx' -CertificatePassword $securePassword
