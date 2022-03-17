
$package = New-AzSynapseWorkspacePackage -WorkspaceName ContosoWorkspace -Package ".\ContosoPackage.whl"

Update-AzSynapseSparkPool -WorkspaceName ContosoWorkspace -Name ContosoSparkPool -PackageAction Add -Package $package
