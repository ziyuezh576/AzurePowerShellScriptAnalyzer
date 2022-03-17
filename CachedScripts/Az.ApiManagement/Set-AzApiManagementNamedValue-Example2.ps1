
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Set-AzApiManagementNamedValue -Context $apimContext -NamedValueId "Property12" -Secret $True -PassThru
