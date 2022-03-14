
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Remove-AzApiManagementLogger -Context $apimContext -LoggerId "Logger123" -Force
