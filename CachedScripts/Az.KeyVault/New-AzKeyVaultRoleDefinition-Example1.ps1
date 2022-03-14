
$role = Get-AzKeyVaultRoleDefinition -HsmName myHsm -RoleDefinitionName 'Managed HSM Crypto User'

$role.Name = $null

$role.RoleName = "my custom role"

$role.Description = "description for my role"

$role.Permissions[0].DataActions = @("Microsoft.KeyVault/managedHsm/roleAssignments/write/action", "Microsoft.KeyVault/managedHsm/roleAssignments/delete/action") # todo

New-AzKeyVaultRoleDefinition -HsmName myHsm -Role $role
