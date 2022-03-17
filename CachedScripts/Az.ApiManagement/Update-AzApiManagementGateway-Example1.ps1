
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Update-AzApiManagementGateway -Context $apimContext -GatewayId "0001" -Description "Updated Gateway"
