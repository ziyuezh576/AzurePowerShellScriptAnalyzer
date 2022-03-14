
$linkedService = Get-AzSynapseLinkedService -WorkspaceName ContosoWorkspace -Name ContosoLinkedService

$linkedService | Remove-AzSynapseLinkedService
