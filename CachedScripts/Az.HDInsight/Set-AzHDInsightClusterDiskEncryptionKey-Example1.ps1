
        $clusterResourceGroupName = "Group"

        $clusterName = "your-cmk-cluster"

Set-AzHDInsightClusterDiskEncryptionKey `
		-ResourceGroupName $clusterResourceGroupName `
		-ClusterName $clusterName `
		-EncryptionKeyName new-key `
		-EncryptionVaultUri https://MyKeyVault.vault.azure.net `
		-EncryptionKeyVersion 00000000000000000000000000000000
