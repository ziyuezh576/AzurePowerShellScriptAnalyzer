
$storageAccountResourceGroupName = "Group"

$storageAccountResourceId = "yourstorageaccountresourceid"

$storageAccountName = "yourstorageacct001"

$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $storageAccountResourceGroupName -Name $storageAccountName)[0].value

$storageContainer = "container001"

$location = "East US 2"

$clusterResourceGroupName = "Group"

$clusterName = "your-hadoop-001"

$clusterCreds = Get-Credential

$hiveSqlServer = "your-sqlserver-001"

$hiveDb = "your-sqldb-001"

$hiveCreds = Get-Credential

$oozieSqlServer = "your-sqlserver-001"

$oozieDb = "your-sqldb-002"

$oozieCreds = Get-Credential

New-AzHDInsightClusterConfig  `
            | Add-AzHDInsightMetastore `
                -SqlAzureServerName "$oozieSqlServer.database.contoso.net" `
                -DatabaseName $oozieDb `
                -Credential $oozieCreds `
                -MetastoreType OozieMetastore `
            | Add-AzHDInsightMetastore `
                -SqlAzureServerName "$hiveSqlServer.database.contoso.net" `
                -DatabaseName $hiveDb `
                -Credential $hiveCreds `
                -MetastoreType HiveMetastore `
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
