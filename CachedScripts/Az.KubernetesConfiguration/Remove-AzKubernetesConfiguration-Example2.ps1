
$kubConf = Get-AzKubernetesConfiguration -ClusterName azps_test_cluster -ClusterType ConnectedClusters -ResourceGroupName azps_test_group -Name azpstestk8s02

Remove-AzKubernetesConfiguration -InputObject $kubConf
