
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Remove-AzApiManagementApi -Context $apimContext -ApiId "0123456789"
