
$password = "Password#1234" | ConvertTo-SecureString -AsPlainText -Force

$resourceGroupName = "quickstart-sf-group"

$keyVaultResourceGroupName = " quickstart-kv-group"

$keyVaultName = "quickstart-kv"

$azureRegion = "southcentralus"

$clusterDnsName = "{0}.{1}.cloudapp.azure.com" -F $resourceGroupName, $azureRegion

$localCertificateFolder = "~\Documents"

$templateParameterFile = "C:\service-fabric-secure-nsg-cluster-65-node-3-nodetype\azuredeploytest.parameters.json"

$templateFile = "C:\service-fabric-secure-nsg-cluster-65-node-3-nodetype\azuredeploy.json"

New-AzServiceFabricCluster -ResourceGroupName $resourceGroupName -TemplateFile $templateFile -ParameterFile $templateParameterFile -CertificateOutputFolder $localCertificateFolder -CertificatePassword $password -KeyVaultResourceGroupName $keyVaultResourceGroupName  -KeyVaultName $keyVaultName -CertificateSubjectName $clusterDnsName
