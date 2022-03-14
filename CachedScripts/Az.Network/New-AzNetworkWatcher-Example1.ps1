
New-AzResourceGroup -Name NetworkWatcherRG -Location westcentralus

New-AzNetworkWatcher -Name NetworkWatcher_westcentralus -ResourceGroup NetworkWatcherRG
