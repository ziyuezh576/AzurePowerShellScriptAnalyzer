
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

$serviceName = "testApp~testService2"

$serviceTypeName = "testStatefulType"

New-AzServiceFabricService -ResourceGroupName $resourceGroupName -ClusterName $clusterName -ApplicationName $appName -Name $serviceName -Type $serviceTypeName -Stateful -TargetReplicaSetSize 3 MinReplicaSetSize 5
