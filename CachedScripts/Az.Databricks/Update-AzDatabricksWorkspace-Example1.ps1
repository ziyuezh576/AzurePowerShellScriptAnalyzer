
$dbr = Get-AzDatabricksWorkspace -ResourceGroupName databricks-rg-rqb2yo -Name workspaceopsc46 -Tag @{'key'=1}

Update-AzDatabricksWorkspace -InputObject $dbr -Tag @{key="value"}
