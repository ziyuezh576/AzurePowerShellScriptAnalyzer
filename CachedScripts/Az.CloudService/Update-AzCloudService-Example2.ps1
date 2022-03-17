
$cloudService = Get-AzCloudService -ResourceGroup "ContosOrg" -CloudServiceName "ContosoCS"

$cloudService.ExtensionProfile.Extension = @()

$cloudService | Update-AzCloudService
