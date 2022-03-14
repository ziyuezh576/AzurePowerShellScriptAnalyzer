
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Get-AzApiManagementPolicy -Context $apimContext -ApiId "9876543210" -OperationId "777"
