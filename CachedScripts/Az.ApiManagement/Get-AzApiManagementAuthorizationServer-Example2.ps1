
$ApiMgmtContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Get-AzApiManagementAuthorizationServer -Context $ApiMgmtContext -ServerId "0123456789"
