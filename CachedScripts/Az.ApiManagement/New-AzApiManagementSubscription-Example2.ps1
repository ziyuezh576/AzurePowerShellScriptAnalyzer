
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

New-AzApiManagementSubscription -Context $context -Scope "/apis" -Name "GlobalApiScope"
