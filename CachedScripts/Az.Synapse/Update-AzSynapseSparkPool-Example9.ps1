
$packages = Get-AzSynapseWorkspacePackage -WorkspaceName ContosoWorkspace

Update-AzSynapseSparkPool -WorkspaceName ContosoWorkspace -Name ContosoSparkPool -PackageAction Add -Package $packages
