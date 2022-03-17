
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

$serviceName = "testService2"

$serviceTypeName = "testStatefulType"

$partitionCount = 5

$partitionLowKey = 0

$partitionHighKey = 25

$statefulServiceMetric = New-Object -TypeName "Microsoft.Azure.Commands.ServiceFabric.Models.PSServiceMetric" -ArgumentList @("metric2", "Medium", 4, 2)

New-AzServiceFabricManagedClusterService -ResourceGroupName $resourceGroupName -ClusterName $clusterName -ApplicationName $appName -Name $serviceName -Type $serviceTypeName -Stateful -TargetReplicaSetSize 5 -MinReplicaSetSize 3 -Metric @($statefulServiceMetric) -PartitionSchemeUniformInt64 -PartitionCount $partitionCount -LowKey $partitionLowKey -HighKey $partitionHighKey -Verbose
