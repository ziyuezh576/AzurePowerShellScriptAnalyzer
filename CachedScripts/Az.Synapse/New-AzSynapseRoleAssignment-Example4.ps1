
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | New-AzSynapseRoleAssignment -RoleDefinitionName ContosoRole -SignInName ContosoName
