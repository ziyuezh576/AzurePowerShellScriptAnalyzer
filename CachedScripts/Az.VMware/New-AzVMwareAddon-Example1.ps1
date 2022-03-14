
$data = New-AzVMwareAddonVrPropertiesObject -VrsCount 2

New-AzVMwareAddon -PrivateCloudName azps_test_cloud -ResourceGroupName azps_test_group -Property $data
