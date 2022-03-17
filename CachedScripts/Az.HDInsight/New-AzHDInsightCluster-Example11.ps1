
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

        $ipConfigName="ipconfig"

        $privateIPAllocationMethod="dynamic" # the only supported IP allocation method for private link IP configuration is dynamic

        $subnetId=$vnetId+"/subnets/"+$subnetName

        $ipConfiguration= New-AzHDInsightIPConfiguration -Name $ipConfigName -PrivateIPAllocationMethod $privateIPAllocationMethod -SubnetId $subnetId -Primary

        $privateLinkConfigurationName="plconfig"

        $groupId="headnode"

        $privateLinkConfiguration= New-AzHDInsightPrivateLinkConfiguration -Name $privateLinkConfigurationName -GroupId $groupId -IPConfiguration $ipConfiguration

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
            -ResourceProviderConnection Outbound -PrivateLink Enabled -PrivateLinkConfiguration $privateLinkConfiguration
