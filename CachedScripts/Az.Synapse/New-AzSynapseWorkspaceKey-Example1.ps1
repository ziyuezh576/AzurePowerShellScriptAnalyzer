
New-AzSynapseWorkspaceKey -ResourceGroupName ContosoResourceGroup -WorkspaceName ContosoWorkspace -Name ContosoWorkspaceKey -EncryptionKeyIdentifier https://<key-vault-url>/keys/<key-name>
