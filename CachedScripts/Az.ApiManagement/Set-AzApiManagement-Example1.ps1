
$apim = Get-AzApiManagement -ResourceGroupName "ContosoGroup" -Name "ContosoApi"

$apim.Sku = "Premium"

$apim.Capacity = 5

$apim.AddRegion("Central US", "Premium", 3)

Set-AzApiManagement -InputObject $apim
