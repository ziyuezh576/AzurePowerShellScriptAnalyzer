
$rgName = "testRG"

$clusterName = "testCluster"

Remove-AzServiceFabricManagedClusterClientCertificate -ResourceGroupName $rgName -Name $clusterName -CommonName 'Contoso.com'
