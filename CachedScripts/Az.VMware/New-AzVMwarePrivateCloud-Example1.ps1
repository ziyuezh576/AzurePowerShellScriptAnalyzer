
New-AzVMwarePrivateCloud -Name azps_test_cloud -ResourceGroupName azps_test_group -NetworkBlock 192.168.48.0/22 -Sku av36 -ManagementClusterSize 3 -Location australiaeast
