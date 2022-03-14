
$ws = Get-AzSynapseWorkspace -Name ContosoWorkspace

$ws | Remove-AzSynapseRoleAssignment -RoleAssignmentId ContosoRoleAssignmentId
