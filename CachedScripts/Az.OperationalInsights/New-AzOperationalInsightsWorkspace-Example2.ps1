
$OILinkTargets = Get-AzOperationalInsightsLinkTargets

$OILinkTargets[0] | New-AzOperationalInsightsWorkspace -ResourceGroupName "ContosoResourceGroup" -Name "MyWorkspace"
