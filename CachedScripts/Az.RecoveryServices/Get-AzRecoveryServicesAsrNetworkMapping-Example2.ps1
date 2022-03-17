
$primaryFabric = Get-AzRecoveryServicesAsrFabric -Name xxxx

$Networkmappings = Get-AzRecoveryServicesAsrNetworkMapping -Name $networkMappingName -PrimaryFabric $primaryFabric
