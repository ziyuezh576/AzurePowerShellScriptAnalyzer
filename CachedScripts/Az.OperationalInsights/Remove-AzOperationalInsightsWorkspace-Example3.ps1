
$workspace = New-AzOperationalInsightsWorkspace -ResourceGroupName $rgname -Name $wsname -Location $wslocation

$workspace | Remove-AzOperationalInsightsWorkspace -ForceDelete
