
$context = New-AzApiManagementContext -ResourceGroupName powershelltest -ServiceName

$gitAccess=Get-AzApiManagementTenantAccess -Context $context

New-AzApiManagementUserToken -Context $context -UserId $gitAccess.Id
