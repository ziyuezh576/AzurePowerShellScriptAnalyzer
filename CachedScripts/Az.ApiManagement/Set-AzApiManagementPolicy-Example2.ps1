
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Set-AzApiManagementPolicy -Context $apimContext -ProductId "0123456789" -Policy $PolicyString
