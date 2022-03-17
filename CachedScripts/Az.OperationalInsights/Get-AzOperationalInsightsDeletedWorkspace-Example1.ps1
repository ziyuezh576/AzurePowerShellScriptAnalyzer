
$workspace = New-AzOperationalInsightsWorkspace -ResourceGroupName $rgname -Name $wsname -Location $wslocation

$workspace | Remove-AzOperationalInsightsWorkspace

Get-AzOperationalInsightsDeletedWorkspace -ResourceGroupName $rgname
