
$rgName = "testRG"

$clusterName = "testCluster"

$password = ConvertTo-SecureString -AsPlainText -Force "testpass1234!@#$"

New-AzServiceFabricManagedCluster -ResourceGroupName $rgName -Location centraluseuap -ClusterName $clusterName -AdminPassword $password -Verbose
