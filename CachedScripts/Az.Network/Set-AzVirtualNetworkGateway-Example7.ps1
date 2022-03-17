
$Gateway=Get-Azvirtualnetworkgateway -ResourceGroupName "ResourceGroup001" -Name "Gateway001"

$rootCerts=$Gateway.VpnClientConfiguration.VpnClientRootCertificates

$rootCerts.Count

$rootCerts[0]

$rootCerts[1]

$rootCerts.Remove($rootCerts[1])

$Gateway1 = Set-AzVirtualNetworkGateway -VirtualNetworkGateway $Gateway -VpnClientRootCertificates $rootCerts
