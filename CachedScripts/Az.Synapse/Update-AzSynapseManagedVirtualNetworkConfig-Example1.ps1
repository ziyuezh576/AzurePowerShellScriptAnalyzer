
$ws = Get-AzSynapseWorkspace -ResourceGroupName ContosoResourceGroup -WorkspaceName ContosoWorkspace 

$ws = $ws | Update-AzSynapseManagedVirtualNetworkConfig -AllowedAadTenantIdsForLinking a96040c4-18dd-4dde-8181-f70daca04919 

$ws | Update-AzSynapseWorkspace
