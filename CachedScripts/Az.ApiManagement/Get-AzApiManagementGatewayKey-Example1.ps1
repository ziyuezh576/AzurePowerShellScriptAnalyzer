
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Get-AzApiManagementGatewayKey -Context $apimContext -GatewayId "0123456789"
