
$rgName = "testRG"

$clusterName = "testCluster"

$NodeTypeName = "nt2"

$identityId = "/subscriptions/00000000-0000-0000-0000-00000000/resourceGroups/testRG/providers/Microsoft.ManagedIdentity/userAssignedIdentities/testIdentity"

New-AzServiceFabricManagedNodeType -ResourceGroupName $rgName -ClusterName $clusterName -Name $NodeTypeName -InstanceCount 5 -VmUserAssignedIdentity $identityId -IsStateless
