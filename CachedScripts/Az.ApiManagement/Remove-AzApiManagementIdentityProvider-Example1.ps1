
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Remove-AzApiManagementIdentityProvider -Context $apimContext -Type 'Facebook' -PassThru
