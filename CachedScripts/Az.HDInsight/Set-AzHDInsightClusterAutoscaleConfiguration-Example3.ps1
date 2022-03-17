
$clusterResourceGroup="group"

$anotherClusterName="anotherClusterName"

$autoscaleConfig=Get-AzHDInsightClusterAutoscaleConfiguration -ResourceGroupName $clusterResourceGroup -ClusterName $anotherClusterName

$clusterResourceGroup="group"

$clusterName="MyCluster"

Set-AzHDInsightClusterAutoscaleConfiguration -ResourceGroupName $clusterResourceGroup -ClusterName $clusterName `
            -Autoscale $autoscaleConfig
