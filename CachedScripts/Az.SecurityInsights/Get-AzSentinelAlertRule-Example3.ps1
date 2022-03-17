
Get-AzSentinelAlertRule -ResourceGroupName $resourceGroupName -WorkspaceName $workspaceName | Where-Object {$_.DisplayName -like "*Azure Security Center*"}
