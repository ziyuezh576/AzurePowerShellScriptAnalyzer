
$tag = @{}

$tag.Add("environment","updatedenv")

$desired = @{}

$desired.add("version_dps", "updateddps")

Set-AzIoTDeviceProvisioningServiceEnrollment -ResourceGroupName "myresourcegroup" -DpsName "mydps" -RegistrationId "enroll1" -tag $tag -Desired $desired
