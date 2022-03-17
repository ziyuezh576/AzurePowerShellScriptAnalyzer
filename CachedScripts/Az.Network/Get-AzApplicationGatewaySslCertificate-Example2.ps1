
$AppGW = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

$Certs = Get-AzApplicationGatewaySslCertificate -ApplicationGateway $AppGW
