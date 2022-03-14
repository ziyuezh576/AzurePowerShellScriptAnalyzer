
$context =New-AzApiManagementContext -ResourceGroupName Api-Default-WestUS -ServiceName contoso

$diagnostic=Get-AzApiManagementDiagnostic -Context $context -DiagnosticId "applicationinsights"

$diagnostic

$diagnostic.Sampling

$diagnostic.Sampling.Percentage = 50

$diagnostic.Sampling

Set-AzApiManagementDiagnostic -InputObject $diagnostic
