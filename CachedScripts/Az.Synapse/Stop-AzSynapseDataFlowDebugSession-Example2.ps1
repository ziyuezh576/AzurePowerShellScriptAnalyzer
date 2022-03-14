
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace -ResourceGroupName ContosoGroup

$ws | Stop-AzSynapseDataFlowDebugSession -sessionid c744f68d-a101-4115-9cd5-8b11314fe4b8
