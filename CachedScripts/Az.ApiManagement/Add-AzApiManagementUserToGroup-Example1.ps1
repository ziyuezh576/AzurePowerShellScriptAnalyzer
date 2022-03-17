
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Add-AzApiManagementUserToGroup -Context $apimContext -GroupId "0001" -UserId "0123456789"
