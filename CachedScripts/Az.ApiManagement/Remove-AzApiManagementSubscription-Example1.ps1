
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Remove-AzApiManagementSubscription -Context $apimContext -SubscriptionId "0123456789" -Force
