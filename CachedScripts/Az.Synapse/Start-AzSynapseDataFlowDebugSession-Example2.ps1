
$ws = Get-AzSynapseWorkspace -Workspacename ContosoWorkspace -ResourceGroupName GroupName  

$result = $ws | Start-AzSynapseDataFlowDebugSession  

$result
