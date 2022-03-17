
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Get-AzApiManagementIdentityProviderClientSecret -Context $apimContext -Type Aad
