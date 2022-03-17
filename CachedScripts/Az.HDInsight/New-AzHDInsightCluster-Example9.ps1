
        $storageAccountResourceGroupName = "Group"

        $storageAccountResourceId = "yourstorageaccountresourceid"

        $storageAccountKey = "yourstorageaccountaccesskey"

        $storageContainer = "yourcontainer01"

        $location = "East US 2"

        $clusterResourceGroupName = "Group"

        $clusterName = "your-hadoop-002"

        $clusterCreds = Get-Credential

        $domainResourceId = "your Azure AD Domin Service resource id"

        $domainUser = "yourdomainuser"

        $domainPassword = "yourdoaminpasswd"

        $domainPassword = ConvertTo-SecureString $domainPassword -AsPlainText -Force

        $domainCredential = New-Object System.Management.Automation.PSCredential($domainUser, $domainPassword)

        $clusterUserGroupDns = "dominusergroup"

        $ldapUrls = "ldaps://{your domain name}:636"

        $clusterTier = Premium

        $vnetId = "yourvnetid"

        $subnetName = "yoursubnetname"

        $assignedIdentity = "your user managed assigned identity resourcee id"

        $config= New-AzHDInsightClusterConfig|Add-AzHDInsightSecurityProfile -DomainResourceId $domainResourceId -DomainUserCredential $domainCredential -LdapsUrls $ldapUrls -ClusterUsersGroupDNs $clusterUserGroupDns

        New-AzHDInsightCluster `
            -ClusteTier $clusterTier `
            -ClusterType Hadoop `
            -ClusterSizeInNodes 3 `
            -ResourceGroupName $clusterResourceGroupName `
            -ClusterName $clusterName `
            -HttpCredential $clusterCreds `
            -Location $location `
            -StorageAccountResourceId $storageAccountResourceId `
            -StorageAccountKey $storageAccountKey `
            -StorageContainer $storageContainer `
            -SshCredential $clusterCreds `
            -VirtualNetworkId $vnetId -SubnetName $subnetName `
            -AssignedIdentity $assignedIdentity `
            -SecurityProfile $config.SecurityProfile -EnableIDBroker
