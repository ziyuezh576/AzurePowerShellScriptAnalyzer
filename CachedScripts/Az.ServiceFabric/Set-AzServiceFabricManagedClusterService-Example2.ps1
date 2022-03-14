
$resourceGroupName = "testRG"

$clusterName = "testCluster"

$appName = "testApp"

$serviceName = "testService1"

$minInstancePercentage = 20

$minInstanceCount = 2

$statelessServiceMetric = New-Object -TypeName "Microsoft.Azure.Commands.ServiceFabric.Models.PSServiceMetric" -ArgumentList @("metric1", "Low", 4)

$service = Get-AzServiceFabricManagedClusterService -ResourceGroupName $resourceGroupName -ClusterName $clusterName -ApplicationName $appName

$service | Set-AzServiceFabricManagedClusterService -Stateless -Metric @($statelessServiceMetric) -MinInstanceCount $minInstanceCount -MinInstancePercentage $minInstancePercentage -Verbose
