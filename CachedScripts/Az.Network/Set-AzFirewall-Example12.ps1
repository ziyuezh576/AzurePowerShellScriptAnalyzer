
$firewall=Get-AzFirewall -ResourceGroupName rgName -Name azFw

$firewall.Deallocate()

$firewall | Set-AzFirewall

$Hub = Get-AzVirtualHub -ResourceGroupName "testRG" -Name "westushub"

$firewall.Allocate($Hub.Id)

$firewall | Set-AzFirewall
