
        $storageAccountResourceGroupName = "Group"

        $storageAccountResourceId = "yourstorageaccountresourceid"

        $storageAccountName = "yourstorageacct001"

        $storageAccountKey = Get-AzStorageAccountKey `
            -ResourceGroupName $storageAccountResourceGroupName `
            -Name $storageAccountName | Where-Object {$_.KeyName -eq "key1"} | %{$_.Value}

        $storageContainer = "container002"

        $location = "East US 2"

        $clusterResourceGroupName = "Group"

        $clusterName = "your-cmk-cluster"

        $clusterCreds = Get-Credential

        $assignedIdentity = "your-ami-resource-id"

        $encryptionKeyName = "new-key"

        $encryptionVaultUri = "https://MyKeyVault.vault.azure.net"

        $encryptionKeyVersion = "00000000000000000000000000000000"

        New-AzHDInsightCluster `
            -ClusterType Spark `
            -ClusterSizeInNodes 4 `
            -ResourceGroupName $clusterResourceGroupName `
            -ClusterName $clusterName `
            -HttpCredential $clusterCreds `
            -Location $location `
            -StorageAccountResourceId $storageAccountResourceId `
            -StorageAccountKey $storageAccountKey `
            -StorageContainer $storageContainer `
            -SshCredential $clusterCreds `
            -AssignedIdentity $assignedIdentity `
            -EncryptionKeyName $encryptionKeyName `
            -EncryptionVaultUri $encryptionVaultUri `
            -EncryptionKeyVersion $encryptionKeyVersion
