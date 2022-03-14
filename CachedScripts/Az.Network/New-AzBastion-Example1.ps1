
$subnetName = "AzureBastionSubnet"

$subnet = New-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix 10.0.0.0/24

$vnet = New-AzVirtualNetwork -Name "TestVnet" -ResourceGroupName "BastionPowershellTest" -Location "westeurope" -AddressPrefix 10.0.0.0/16 -Subnet $subnet

$publicip = New-AzPublicIpAddress -ResourceGroupName "BastionPowershellTest" -Name "Test-Ip" -location "westeurope" -AllocationMethod Dynamic -Sku Standard

$bastion = New-AzBastion -ResourceGroupName "BastionPowershellTest" -Name "test-Bastion2" -PublicIpAddress $publicip -VirtualNetwork $vnet
