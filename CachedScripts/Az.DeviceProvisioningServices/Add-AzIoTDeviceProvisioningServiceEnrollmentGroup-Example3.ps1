
$tag = @{}

$tag.Add("environment","test")

$desired = @{}

$desired.add("version_dps", "dps1")

Add-AzIoTDeviceProvisioningServiceEnrollmentGroup -ResourceGroupName "myresourcegroup" -DpsName "mydps" -Name "enroll1" -AttestationType SymmetricKey -tag $tag -Desired $desired
