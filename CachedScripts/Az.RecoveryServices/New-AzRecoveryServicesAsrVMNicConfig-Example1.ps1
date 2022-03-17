
$ipConfig1 = New-AzRecoveryServicesAsrVMNicIPConfig -IpConfigName "ipconfig1" -RecoverySubnetName "default" `
-TfoSubnetName "default" -RecoveryStaticIPAddress "10.1.40.10" -TfoStaticIPAddress "10.3.4.33"

$ipConfig2 = New-AzRecoveryServicesAsrVMNicIPConfig -IpConfigName "ipconfig2" -IsSelectedForFailover -RecoverySubnetName "default" `
-TfoSubnetName "default" -RecoveryStaticIPAddress "10.1.40.13" -TfoStaticIPAddress "10.3.4.32"

$ipConfigs = @($ipConfig1, $ipConfig2)

$nicConfig = New-AzRecoveryServicesAsrVMNicConfig -NicId $AsrNicGuid -ReplicationProtectedItem $Rpi -RecoveryVMNetworkId $recoveryNetworkId `
    -TfoVMNetworkId $tfoNetworkId -IPConfig $ipConfigs
