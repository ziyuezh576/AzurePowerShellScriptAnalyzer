
$NW = Get-AzNetworkWatcher -ResourceGroupName NetworkWatcherRg -Name NetworkWatcher_westcentralus

$nsg = Get-AzNetworkSecurityGroup -ResourceGroupName NSGRG -Name appNSG

Get-AzNetworkWatcherFlowLogStatus -NetworkWatcher $NW -TargetResourceId $nsg.Id
