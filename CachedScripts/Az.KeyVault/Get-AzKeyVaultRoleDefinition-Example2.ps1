
$backupRole = Get-AzKeyVaultRoleDefinition -HsmName myHsm -RoleDefinitionName "Managed HSM Backup User"

$backupRole.Permissions

$backupRole.Permissions.DataActions
