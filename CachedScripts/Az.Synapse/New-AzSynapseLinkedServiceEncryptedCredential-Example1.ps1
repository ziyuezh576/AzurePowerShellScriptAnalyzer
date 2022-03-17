
New-AzSynapseLinkedServiceEncryptedCredential -WorkspaceName ContosoWorkspace -ResourceGroupName ContosoRG -IntegrationRuntimeName "IR-LSEncryptedCredential" -DefinitionFile "D:\sqlLinkService.json" > "D:\SynapseEncryptedSQLServerLinkedService.json"
