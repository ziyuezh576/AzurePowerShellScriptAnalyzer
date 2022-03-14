
$WebApp = Get-AzWebApp -Name "ContosoWebApp"

Remove-AzWebAppSSLBinding -WebApp $WebApp -Name "www.contoso.com"
