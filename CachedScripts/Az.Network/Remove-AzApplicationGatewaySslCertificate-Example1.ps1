
$AppGW = Get-AzApplicationGateway -Name "ApplicationGateway01" -ResourceGroupName "ResourceGroup01"

Remove-AzApplicationGatewaySslCertificate -ApplicationGateway $AppGW -Name "Cert02"

Set-AzApplicationGateway -ApplicationGateway $AppGw
