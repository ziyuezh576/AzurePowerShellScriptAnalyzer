
$context = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

$logger = Get-AzApiManagementLogger -Context $context -LoggerId "backendapisachinc"

$samplingsetting = New-AzApiManagementSamplingSetting -SamplingType fixed -SamplingPercentage 100

New-AzApiManagementDiagnostic -LoggerId $logger.LoggerId -Context $context -AlwaysLog allErrors -SamplingSetting $samplingSetting  -DiagnosticId "applicationinsights"
