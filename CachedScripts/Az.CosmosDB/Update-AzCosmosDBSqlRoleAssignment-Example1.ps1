
Update-AzCosmosDBSqlRoleAssignment `
	-AccountName accountName `
	-ResourceGroupName resourceGroupName `
	-Id roleAssignmentId `
	-RoleDefinitionId "/subscriptions/subId/resourceGroups/resourceGroupName/providers/Microsoft.DocumentDB/databaseAccounts/accountName/sqlRoleDefinitions/roleDefinitionId"
