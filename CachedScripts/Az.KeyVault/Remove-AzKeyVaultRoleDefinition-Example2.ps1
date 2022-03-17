
$role = Get-AzKeyVaultRoleDefinition -HsmName myHsm -RoleName "my role"

$role | Remove-AzKeyVaultRoleDefinition -HsmName myHsm -Force
