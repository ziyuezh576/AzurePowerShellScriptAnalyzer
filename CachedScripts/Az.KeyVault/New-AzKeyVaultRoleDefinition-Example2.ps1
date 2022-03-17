
Get-AzKeyVaultRoleDefinition -HsmName myHsm -RoleDefinitionName 'Managed HSM Crypto User' | ConvertTo-Json -Depth 9 > C:\Temp\roleDefinition.json

New-AzKeyVaultRoleDefinition -HsmName myHsm -InputFile C:\Temp\roleDefinition.json
