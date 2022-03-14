
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | New-AzSynapseWorkspaceKey -Name ContosoWorkspaceKey -EncryptionKeyIdentifier https://<key-vault-url>/keys/<key-name>
