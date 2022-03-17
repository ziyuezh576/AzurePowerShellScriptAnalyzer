
$storageAccountResourceGroupName = "Group"

$storageAccountResourceId = "yourstorageaccountresourceid"

$storageAccountName = "yourstorageacct001"

$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $storageAccountResourceGroupName -Name $storageAccountName)[0].value

$storageContainer = "container001"

$location = "East US 2"

$clusterResourceGroupName = "Group"

$clusterName = "your-hadoop-001"

$clusterCreds = Get-Credential

$domain="sampledomain.onmicrosoft.com"

$domainUser="sample.user@sampledomain.onmicrosoft.com"

$domainPassword=ConvertTo-SecureString "domainPassword" -AsPlainText -Force

$domainUserCredential=New-Object System.Management.Automation.PSCredential($domainUser, $domainPassword)

$organizationalUnitDN="ou=testunitdn"

$ldapsUrls=("ldaps://sampledomain.onmicrosoft.com:636","ldaps://sampledomain.onmicrosoft.com:389")

$clusterUsersGroupDNs=("groupdn1","groupdn2")

New-AzHDInsightClusterConfig `
            | Add-AzHDInsightSecurityProfile `
                -Domain $domain `
                -DomainUserCredential $domainUserCredential `
                -OrganizationalUnitDN $organizationalUnitDN `
                -LdapsUrls $ldapsUrls `
                -ClusterUsersGroupDNs $clusterUsersGroupDNs `
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
                -StorageContainer $storageContainer
