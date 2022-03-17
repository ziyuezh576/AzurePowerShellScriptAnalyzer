
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Set-AzApiManagementBackend -Context $apimContext -BackendId 123 -Description "updated description" -PassThru
