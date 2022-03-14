
$tags = @{}

$tags.Add('key1','value1')

New-AzIoTDeviceProvisioningService -ResourceGroupName "myresourcegroup" -Name "myiotdps" -Tag $tags
