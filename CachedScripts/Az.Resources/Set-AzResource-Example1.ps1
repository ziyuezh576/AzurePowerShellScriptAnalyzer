
$Resource = Get-AzResource -ResourceType Microsoft.Web/sites -ResourceGroupName ResourceGroup11 -ResourceName ContosoSite

$Resource.Properties.Enabled = "False"

$Resource | Set-AzResource -Force
