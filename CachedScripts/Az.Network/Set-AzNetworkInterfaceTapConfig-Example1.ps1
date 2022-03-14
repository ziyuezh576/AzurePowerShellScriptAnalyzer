
$tapConfig = Get-AzNetworkInterface -ResourceGroupName "ResourceGroup1" -NetworkInterface "sourceNicName" -Name "tapconfigName"

$tapConfig.Name = "NewTapName"

Set-AzNetworkInterfaceTapConfig -NetworkInterfaceTapConfig $tapConfig
