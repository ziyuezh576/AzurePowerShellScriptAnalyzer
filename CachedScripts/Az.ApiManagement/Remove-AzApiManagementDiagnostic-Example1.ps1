
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Remove-AzApiManagementDiagnostic -Context $apimContext -DiagnosticId "applicationinsights"
