
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-East-US" -ServiceName "contoso"

Get-AzApiManagementSubscriptionKey -Context $apimContext -SubscriptionId "0123456789"
