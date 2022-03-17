
$KqlScript = Get-AzSynapseKqlScript -WorkspaceName ContosoWorkspace -Name ContosoKqlScript

$KqlScript | Export-AzSynapseKqlScript -OutputFolder "C:\KqlScript"
