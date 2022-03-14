
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Export-AzSynapseKqlScript -Name ContosoKqlScript -OutputFolder "C:\KqlScript"
