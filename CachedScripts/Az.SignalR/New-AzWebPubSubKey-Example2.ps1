
$wps = Get-AzWebPubSub -Name psdemo-wps -ResourceGroupName psdemo

$wps | New-AzWebPubSubKey -KeyType Primary | Format-List
