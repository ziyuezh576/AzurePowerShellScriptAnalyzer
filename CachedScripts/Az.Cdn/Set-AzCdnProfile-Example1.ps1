
$profileObject = Get-AzCdnProfile -ResourceGroupName myresourcegroup -ProfileName mycdnprofile

$profileObject.Tags = @{"key"="value"}

Set-AzCdnProfile -CdnProfile $profileObject
