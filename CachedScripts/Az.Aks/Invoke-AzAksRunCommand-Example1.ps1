
Invoke-AzAksRunCommand -ResourceGroupName $resourceGroup -Name $clusterName -Command "kubectl get pods"
