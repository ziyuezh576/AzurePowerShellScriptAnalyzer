
$pool = Get-AzSynapseSparkPool -ResourceGroupName ContosoResourceGroup -WorkspaceName ContosoWorkspace -Name ContosoSparkPool

$pool | Update-AzSynapseSparkPool -PackageAction Remove -Package $pool.WorkspacePackages
