
$storageAccountResourceGroupName = "Group"

$storageAccountResourceId = "yourstorageaccountresourceid"

$storageAccountName = "yourstorageacct001"

$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $storageAccountResourceGroupName -Name $storageAccountName)[0].value

$storageContainer = "container001"

$location = "East US 2"

$clusterResourceGroupName = "Group"

$clusterName = "your-hadoop-001"

$clusterCreds = Get-Credential

$secondStorageAccountResourceGroupName = "Group"

$secondStorageAccountName = "yourstorageacct002"

$secondStorageAccountKey = Get-AzStorageAccountKey `
-ResourceGroupName $secondStorageAccountResourceGroupName `
            -Name $secondStorageAccountName | %{ $_.Key1 }

New-AzHDInsightClusterConfig `
            | Add-AzHDInsightStorage `
                -StorageAccountName "$secondStorageAccountName.blob.core.contoso.net" `
                -StorageAccountKey $key2 `
            | New-AzHDInsightCluster `
                -ClusterType Hadoop `
                -OSType Windows `
                -ClusterSizeInNodes 4 `
                -ResourceGroupName $clusterResourceGroupName `
                -ClusterName $clusterName `
                -HttpCredential $clusterCreds `
                -Location $location `
                -StorageAccountResourceId $storageAccountResourceId `
                -StorageAccountKey $storageAccountKey `
                -StorageContainer $storageContainer
