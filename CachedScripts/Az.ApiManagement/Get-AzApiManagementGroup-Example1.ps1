
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Get-AzApiManagementGroup -Context $apimContext
