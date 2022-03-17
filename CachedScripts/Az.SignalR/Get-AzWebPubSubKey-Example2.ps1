
$wps = Get-AzWebPubSub -ResourceGroupName psdemo -ResourceName psdemo-wps

$wps | Get-AzWebPubSubKey | Format-List
