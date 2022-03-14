
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Get-AzApiManagementUserSsoUrl -Context $apimContext -UserId "0123456789"
