
$Workspace = Get-AzOperationalInsightsWorkspace -ResourceGroupName "ContosoResourceGroup" -Name "MyWorkspace"

Get-AzOperationalInsightsStorageInsight -Workspace $Workspace -Name "MyStorageInsight"
