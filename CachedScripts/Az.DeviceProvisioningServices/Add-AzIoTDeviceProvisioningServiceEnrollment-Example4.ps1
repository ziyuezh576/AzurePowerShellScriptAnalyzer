
$tag = @{}

$tag.Add("environment","test")

$desired = @{}

$desired.add("version_dps", "dps1")

Add-AzIoTDeviceProvisioningServiceEnrollment -ResourceGroupName "myresourcegroup" -DpsName "mydps" -RegistrationId "enroll1" -AttestationType SymmetricKey -tag $tag -Desired $desired
