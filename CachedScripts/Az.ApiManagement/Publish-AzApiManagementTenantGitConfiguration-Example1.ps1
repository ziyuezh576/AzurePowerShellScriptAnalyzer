
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Publish-AzApiManagementTenantGitConfiguration -Context $apimContext -Branch 'master' -PassThru
