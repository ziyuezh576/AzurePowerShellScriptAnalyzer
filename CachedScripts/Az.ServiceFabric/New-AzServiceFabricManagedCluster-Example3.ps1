
$rgName = "testRG"

$clusterName = "testCluster"

$password = ConvertTo-SecureString -AsPlainText -Force "testpass1234!@#$"

New-AzServiceFabricManagedCluster -ResourceGroupName $rgName -Location centraluseuap -ClusterName $clusterName -AdminPassword $password -Sku Standard -UpgradeMode Automatic -UpgradeCadence Wave1 -ZonalResiliency -Verbose
