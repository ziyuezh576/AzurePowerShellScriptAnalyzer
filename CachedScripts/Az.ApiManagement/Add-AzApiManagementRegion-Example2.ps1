
$service = Get-AzApiManagement -ResourceGroupName "Contoso" -Name "ContosoApi"

$service = Add-AzApiManagementRegion -ApiManagement $service -Location $secondarylocation -VirtualNetwork $additionalRegionVirtualNetwork

$service = Set-AzApiManagement -InputObject $service -PassThru
