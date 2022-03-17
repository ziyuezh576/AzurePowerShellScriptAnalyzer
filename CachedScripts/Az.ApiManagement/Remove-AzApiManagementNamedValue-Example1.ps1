
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Remove-AzApiManagementNamedValue -Context $apimContext -NamedValueId "Property11" -PassThru
