
$rgName = "testRG"

$clusterName = "testCluster"

$cluster = Get-AzServiceFabricManagedCluster -ResourceGroupName $rgName -Name $clusterName

$cluster.DnsName = "testnewdns"

$cluster.ClientConnectionPort = 50000

$cluster | Set-AzServiceFabricManagedCluster
