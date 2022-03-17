
        $storageAccountResourceGroupName = "Group"

        $storageAccountName = "yourstorageacct001"

        $storageAccountResourceId = "yourstorageaccountresourceid"

        $storageAccountKey = Get-AzStorageAccountKey `
            -ResourceGroupName $storageAccountResourceGroupName `
            -Name $storageAccountName | %{ $_.Key1 }

        $storageContainer = "container001"

        $location = "East US 2"

        $clusterResourceGroupName = "Group"

        $clusterName = "your-spark-001"

        $clusterCreds = Get-Credential

        $sshClusterCreds = Get-Credential

        New-AzHDInsightClusterConfig `
            | Add-AzHDInsightComponentVersion `
                -ComponentName "Spark" `
                -ComponentVersion "2.0" `
            | New-AzHDInsightCluster `
                -ClusterType Spark `
                -OSType Linux `
                -ClusterSizeInNodes 4 `
                -ResourceGroupName $clusterResourceGroupName `
                -ClusterName $clusterName `
                -HttpCredential $clusterCreds `
                -Location $location `
                -StorageAccountResourceId $storageAccountResourceId `
                -StorageAccountKey $storageAccountKey `
                -StorageContainer $storageContainer `
                -SshCredential $sshCredentials `
                -Version "3.5"
