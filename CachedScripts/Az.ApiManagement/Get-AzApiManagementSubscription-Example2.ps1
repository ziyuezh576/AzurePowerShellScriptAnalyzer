
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-East-US" -ServiceName "contoso"

Get-AzApiManagementSubscription -Context $apimContext -SubscriptionId "0123456789"
