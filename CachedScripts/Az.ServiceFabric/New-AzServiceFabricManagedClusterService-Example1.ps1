
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

$serviceName = "testService1"

$serviceTypeName = "testStateless"

$statelessServiceMetric = New-Object -TypeName "Microsoft.Azure.Commands.ServiceFabric.Models.PSServiceMetric" -ArgumentList @("metric1", "Low", 4)

New-AzServiceFabricManagedClusterService -ResourceGroupName $resourceGroupName -ClusterName $clusterName -ApplicationName $appName -Name $serviceName -Type $serviceTypeName -Stateless -InstanceCount -1 -PartitionSchemaSingleton -Metric @($statelessServiceMetric) -Verbose
