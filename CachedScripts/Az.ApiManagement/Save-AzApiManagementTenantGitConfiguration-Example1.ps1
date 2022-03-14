
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Save-AzApiManagementTenantGitConfiguration -Context $apimContext -Branch 'master' -PassThru
