
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Remove-AzApiManagementBackend -Context $apimContext -BackendId 123 -PassThru
