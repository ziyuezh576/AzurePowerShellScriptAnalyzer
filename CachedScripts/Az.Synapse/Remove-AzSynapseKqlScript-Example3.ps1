
$kqlScript = Get-AzSynapseKqlScript -WorkspaceName ContosoWorkspace -Name ContosoKqlScript

$kqlScript | Remove-AzSynapseKqlScript
