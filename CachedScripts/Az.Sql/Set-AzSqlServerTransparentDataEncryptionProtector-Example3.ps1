
Set-AzSqlServerTransparentDataEncryptionProtector -AutoRotationEnabled $false -KeyId 'https://contoso.vault.azure.net/keys/contosokey/0000000000000000000000000000000000000' -ResourceGroupName 'ContosoResourceGroup' -ServerName 'ContosoServer' -Type AzureKeyVault
