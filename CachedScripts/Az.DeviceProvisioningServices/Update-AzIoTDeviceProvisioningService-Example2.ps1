
$tag = @{}

$tag.Add("key1","Value1")

Update-AzIoTDeviceProvisioningService -ResourceGroupName "myresourcegroup" -Name "myiotdps" -Tag $tag
