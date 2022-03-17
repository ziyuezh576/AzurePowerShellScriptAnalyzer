
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

        $kafkaClientGroupName = "yourclientgroupname"

        $kafkaClientGroupId = "yourclientgroupid"

        $kafkaManagementNodeSize = "Standard_D4_v2"

        $disksPerWorkerNode = 2

        New-AzHDInsightCluster `
            -ClusterType Kafka `
            -ClusterSizeInNodes 4 `
            -ResourceGroupName $clusterResourceGroupName `
            -ClusterName $clusterName `
            -HttpCredential $clusterCreds `
            -Location $location `
            -StorageAccountResourceId $storageAccountResourceId `
            -StorageAccountKey $storageAccountKey `
            -StorageContainer $storageContainer `
            -SshCredential $clusterCreds `
            -KafkaClientGroupId  $kafkaClientGroupId -KafkaClientGroupName $kafkaClientGroupName `
            -KafkaManagementNodeSize $kafkaManagementNodeSize -DisksPerWorkerNode $disksPerWorkerNode
