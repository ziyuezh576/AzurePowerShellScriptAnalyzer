
$nic1 = Get-AzNetworkInterface -Name mynic -ResourceGroupName $myrg

Get-AzNetworkInterfaceIpConfig -Name ipconfig1 -NetworkInterface $nic1
