
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Get-AzApiManagementNamedValue -Context $apimContext -Name "sql-connectionstring"
