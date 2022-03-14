
$cloudService = Get-AzCloudService -ResourceGroup "ContosOrg" -CloudServiceName "ContosoCS"

$cloudService.RoleProfile.Role | ForEach-Object {$_.SkuCapacity += 1}

$role = $cloudService.RoleProfile.Role | Where-Object {$_.Name -eq "ContosoFrontend"}

$role.SkuCapacity -= 1

$cloudService.Configuration = $configuration

$cloudService | Update-AzCloudService
