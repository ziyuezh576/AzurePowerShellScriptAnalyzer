
$tag = @{}

$tag.Add("environment","updatedenv")

$desired = @{}

$desired.add("version_dps", "updateddps")

Set-AzIoTDeviceProvisioningServiceEnrollmentGroup -ResourceGroupName "myresourcegroup" -DpsName "mydps" -Name "enroll1" -tag $tag -Desired $desired
