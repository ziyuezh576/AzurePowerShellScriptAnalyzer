
$rgName = "testRG"

$clusterName = "testCluster"

$password = ConvertTo-SecureString -AsPlainText -Force "testpass1234!@#$"

New-AzServiceFabricManagedCluster -ResourceGroupName $rgName -Location centraluseuap -ClusterName $clusterName -AdminPassword $password -Sku Standard -UpgradeMode Manual -CodeVersion 7.2.477.9590 -Verbose
