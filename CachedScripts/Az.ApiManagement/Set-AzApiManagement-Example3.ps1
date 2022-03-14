
$portal = New-AzApiManagementCustomHostnameConfiguration -Hostname "portal.contoso.com" -HostnameType Portal -KeyVaultId "https://apim-test-keyvault.vault.azure.net/secrets/api-portal-custom-ssl.pfx"

$proxy1 = New-AzApiManagementCustomHostnameConfiguration -Hostname "gatewayl.contoso.com" -HostnameType Proxy -KeyVaultId "https://apim-test-keyvault.vault.azure.net/secrets/contoso-proxy-custom-ssl.pfx"

$proxy2 = New-AzApiManagementCustomHostnameConfiguration -Hostname "gatewayl.foobar.com" -HostnameType Proxy -KeyVaultId "https://apim-test-keyvault.vault.azure.net/secrets/foobar-proxy-custom-ssl.pfx"

$proxyCustomConfig = @($proxy1,$proxy2)

$apim = Get-AzApiManagement -ResourceGroupName "ContosoGroup" -Name "ContosoApi"

$apim.PortalCustomHostnameConfiguration = $portal

$apim.ProxyCustomHostnameConfiguration = $proxyCustomConfig 

Set-AzApiManagement -InputObject $apim -SystemAssignedIdentity
