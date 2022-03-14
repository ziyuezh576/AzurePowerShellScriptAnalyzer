
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

$product = Get-AzApiManagementProduct -Context $apimContext -Title 'Starter'

$product | Select-Object -First 1
