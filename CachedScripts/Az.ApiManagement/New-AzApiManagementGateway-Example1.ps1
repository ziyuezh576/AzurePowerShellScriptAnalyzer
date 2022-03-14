
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

$location = New-AzApiManagementResourceLocationObject -Name "n1" -City "c1" -District "d1" -CountryOrRegion "r1"

New-AzApiManagementGateway -Context $apimContext -GatewayId "123" -Description "desc" -LocationData $location
