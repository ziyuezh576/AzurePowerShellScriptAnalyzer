
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Add-AzSynapseDataFlowDebugSessionPackage -PackageFile "D:\dataflowps\addpackage.json" -SessionId 3afb278e-ac5f-469f-a0b6-2f04c3ab59bc
