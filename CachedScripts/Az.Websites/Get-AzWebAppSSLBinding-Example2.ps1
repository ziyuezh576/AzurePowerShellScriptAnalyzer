
$WebApp = Get-AzWebApp -Name "ContosoWebApp"

Get-AzWebAppSSLBinding -WebApp $WebApp
