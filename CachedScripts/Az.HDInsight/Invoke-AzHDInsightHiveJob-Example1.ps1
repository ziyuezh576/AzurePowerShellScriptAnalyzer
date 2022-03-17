
$storageAccountResourceGroupName = "Group"

$storageAccountName = "yourstorageacct001"

$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $storageAccountResourceGroupName -Name $storageAccountName)[0].value

$storageContainer = "container001"

$clusterName = "your-hadoop-001"

$clusterCreds = Get-Credential

$statusFolder = "tempStatusFolder/"

$query = "SHOW TABLES"

Use-AzHDInsightCluster `
            -ClusterCredential $clusterCreds `
            -ClusterName $clusterName

Invoke-AzHDInsightHiveJob -StatusFolder $statusFolder `
            -Query $query `
            -DefaultContainer $storageContainer `
            -DefaultStorageAccountName "$storageAccountName.blob.core.windows.net" `
            -DefaultStorageAccountKey $storageAccountKey
