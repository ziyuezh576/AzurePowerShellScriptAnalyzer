
$vnet = Get-AzVirtualNetwork -Name myvnet -ResourceGroupName myrg

$Subnet = Get-AzVirtualNetworkSubnetConfig -Name mysubnet -VirtualNetwork $vnet

$PIP1 = Get-AzPublicIPAddress -Name "PIP1" -ResourceGroupName "RG1"

$IPConfig1 = New-AzNetworkInterfaceIpConfig -Name "IPConfig-1" -Subnet $Subnet -PublicIpAddress $PIP1

 $nic = New-AzNetworkInterface -Name $NicName -ResourceGroupName myrg -Location westus
