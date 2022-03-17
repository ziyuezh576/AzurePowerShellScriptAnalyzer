
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

$serviceName = "testService3"

$serviceName2 = "testService2"

$serviceTypeName = "testStateless"

$statefulService = Get-AzServiceFabricManagedClusterService -ResourceGroupName $resourceGroupName -ClusterName $clusterName -ApplicationName $appName -Name $serviceName2

$statefulServiceCorrelation = New-Object -TypeName "Microsoft.Azure.Commands.ServiceFabric.Models.PSServiceCorrelation" -ArgumentList @("AlignedAffinity, $statefulService.Id)

New-AzServiceFabricManagedClusterService -ResourceGroupName $resourceGroupName -ClusterName $clusterName -ApplicationName $appName -Name $serviceName -Type $serviceTypeName -Stateless -InstanceCount 3 -PartitionSchemaSingleton -Correlation @($statefulServiceCorrelation) -Verbose
