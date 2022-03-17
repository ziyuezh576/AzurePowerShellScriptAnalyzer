
$storageAccountResourceGroupName = "Group"

$storageAccountResourceId = "yourstorageaccountresourceid"

$storageAccountName = "yourstorageacct001"

$storageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $storageAccountResourceGroupName -Name $storageAccountName)[0].value 

$storageContainer = "container001"

$location = "East US 2"

$clusterResourceGroupName = "Group"

$clusterName = "your-hadoop-001"

$clusterCreds = Get-Credential

$tenantId = (Get-AzContext).Tenant.TenantId

$objectId = "<Azure AD Service Principal Object ID>"

$applicationId = "<Azure AD Service Principal Application ID>"

$certificateFilePath = "<Path to Azure AD Service Principal Certificate>"

$certificatePassword = "<Password for Azure AD Service Principal Certificate>"

New-AzHDInsightClusterConfig `
            | Add-AzHDInsightClusterIdentity `
                -AadTenantId $tenantId `
                -ObjectId $objectId `
                -Application $applicationId
