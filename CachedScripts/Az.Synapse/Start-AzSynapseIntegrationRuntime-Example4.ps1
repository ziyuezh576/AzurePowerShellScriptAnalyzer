
$ir = Get-AzSynapseIntegrationRuntime -WorkspaceName ContosoWorkspace -Name test-dedicated-ir -ResourceGroupName Contosorg

$ir | Start-AzSynapseIntegrationRuntime
