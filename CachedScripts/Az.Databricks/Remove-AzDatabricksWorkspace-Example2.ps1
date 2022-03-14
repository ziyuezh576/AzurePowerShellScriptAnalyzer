
$dbr = Get-AzDatabricksWorkspace -ResourceGroupName testgroup -Name databricks-test02

Remove-AzDatabricksWorkspace -InputObject $dbr
