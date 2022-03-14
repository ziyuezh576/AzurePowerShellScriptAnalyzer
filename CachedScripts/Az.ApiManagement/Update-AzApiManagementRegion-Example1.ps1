
$apimService = Get-AzApiManagement -ResourceGroupName $resourceGroupName -Name $apiManagementName

$apimService = Update-AzApiManagementRegion -ApiManagement $apimService -Location "North Central US" -Capacity 2 -Sku Premium

$apimService = Set-AzApiManagement -InputObject $apimService -PassThru
