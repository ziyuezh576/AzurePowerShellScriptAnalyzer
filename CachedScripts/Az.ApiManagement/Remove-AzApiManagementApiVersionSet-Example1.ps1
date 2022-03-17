
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Remove-AzApiManagementApiVersionSet -Context $apimContext -ApiVersionSetId "query-param-set"
