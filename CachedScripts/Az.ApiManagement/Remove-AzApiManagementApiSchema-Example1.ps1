
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Remove-AzApiManagementApiSchema -Context $apimContext -ApiId "echo-api" -SchemaId "2"
