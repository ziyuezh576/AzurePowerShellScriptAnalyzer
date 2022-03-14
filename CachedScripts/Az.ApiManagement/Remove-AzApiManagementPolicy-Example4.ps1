
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Remove-AzApiManagementPolicy -Context $apimContext -ApiId "9876543210" -OperationId "777"
