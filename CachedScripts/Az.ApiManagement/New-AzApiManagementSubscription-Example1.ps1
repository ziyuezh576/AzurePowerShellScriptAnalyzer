
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

New-AzApiManagementSubscription -Context $apimContext -UserId "777" -ProductId "999"
