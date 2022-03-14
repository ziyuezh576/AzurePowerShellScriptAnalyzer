
$conAks = Get-AzConnectedKubernetes -ClusterName azps_test_cluster -ResourceGroupName azps_test_group -Location eastus

Get-AzConnectedKubernetes -InputObject $conAks
