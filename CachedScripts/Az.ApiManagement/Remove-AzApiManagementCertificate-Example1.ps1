
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Remove-AzApiManagementCertificate -Context $ApiMgmtContext -CertificateId "0123456789" -Force
