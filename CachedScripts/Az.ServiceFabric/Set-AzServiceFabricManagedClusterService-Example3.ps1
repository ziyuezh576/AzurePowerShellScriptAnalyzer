
$standByReplicaKeepDuration = "00:11:00"

$servicePlacementTimeLimit = "00:11:00"

$resourceId = "/subscriptions/13ad2c84-84fa-4798-ad71-e70c07af873f/resourcegroups/testRG/providers/Microsoft.ServiceFabric/managedClusters/testCluster/applications/testApp/services/testService"

Set-AzServiceFabricManagedClusterService -ResourceId $resourceId -StandByReplicaKeepDuration $standByReplicaKeepDuration -ServicePlacementTimeLimit $servicePlacementTimeLimit -Verbose
