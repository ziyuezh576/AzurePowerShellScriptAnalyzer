
$password = "Password#1234" | ConvertTo-SecureString -AsPlainText -Force

$resourceGroupName = "test20"

$keyVaultResourceGroupName = "test20kvrg"

$keyVaultName = "test20kv"

$localCertificateFile = "c:\Mycertificates\my2017Prodcert.pfx"

$templateParameterFile = "~\Documents\GitHub\azure-quickstart-templates-parms\service-fabric-secure-nsg-cluster-65-node-3-nodetype\azuredeploytest.parameters.json"

$templateFile = "~\GitHub\azure-quickstart-templates\service-fabric-secure-nsg-cluster-65-node-3-nodetype\azuredeploy.json"

New-AzServiceFabricCluster -ResourceGroupName $resourceGroupName -TemplateFile $templateFile -ParameterFile $templateParameterFile -CertificateFile $localCertificateFile -CertificatePassword $password -KeyVaultResourceGroupName $keyVaultResourceGroupName -KeyVaultName $keyVaultName
