
        $storageAccountResourceGroupName = "Group"

        $storageAccountResourceId = "yourstorageaccountresourceid"

        $storageAccountName = "yourstorageacct001"

        $storageAccountKey = Get-AzStorageAccountKey `
            -ResourceGroupName $storageAccountResourceGroupName `
            -Name $storageAccountName | Where-Object {$_.KeyName -eq "key1"} | %{$_.Value}

        $storageContainer = "container002"

        $location = "East US 2"

        $clusterResourceGroupName = "Group"

        $clusterName = "your-hadoop-002"

        $clusterCreds = Get-Credential

        $virtualNetworkId="yourvnetresourceid"

        $subnetName="yoursubnetname"

        $databaseUserName="yourusername"

        $databasePassword="******"

        $databasePassword=ConvertTo-SecureString $databasePassword -AsPlainText -Force

        $sqlserverCredential=New-Object System.Management.Automation.PSCredential($databaseUserName, $databasePassword)

        $sqlserver="yoursqlserver.database.windows.net"

        $ambariDatabase="ambaridb"

        $hiveDatabase ="hivedb"

        $oozieDatabase = "ooziedb"

        $config=New-AzHDInsightClusterConfig|Add-AzHDInsightMetastore `
        -SqlAzureServerName $sqlserver -DatabaseName $ambariDatabase `
        -Credential $sqlserverCredential -MetastoreType AmbariDatabase

        $config=$config|Add-AzHDInsightMetastore `
        -SqlAzureServerName $sqlserver -DatabaseName $hiveDatabase `
        -Credential $sqlserverCredential -MetastoreType HiveMetastore

        $config=$config|Add-AzHDInsightMetastore `
        -SqlAzureServerName $sqlserver -DatabaseName $oozieDatabase `
        -Credential $sqlserverCredential -MetastoreType OozieMetastore

        $zones="1"

        New-AzHDInsightCluster `
            -ClusterType Hadoop `
            -ClusterSizeInNodes 4 `
            -ResourceGroupName $clusterResourceGroupName `
            -ClusterName $clusterName `
            -HttpCredential $clusterCreds `
            -Location $location `
            -StorageAccountResourceId $storageAccountResourceId `
            -StorageAccountKey $storageAccountKey `
            -StorageContainer $storageContainer `
            -SshCredential $clusterCreds `
            -VirtualNetworkId $virtualNetworkId -SubnetName $subnetName `
            -AmbariDatabase $config.AmbariDatabase -HiveMetastore $config.HiveMetastore -OozieMetastore $config.OozieMetastore -Zone $zones
