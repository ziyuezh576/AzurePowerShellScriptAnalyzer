
$Text = Get-Content -Path "C:\Azure\Certificates\ExportedCertificate.cer"

$CertificateText = for ($i=1; $i -lt $Text.Length -1 ; $i++){$Text[$i]}

Add-AzVpnClientRootCertificate -PublicCertData $CertificateText -ResourceGroupName "ContosoResourceGroup" -VirtualNetworkGatewayName "ContosoVirtualGateway" -VpnClientRootCertificateName "ContosoClientRootCertificate"
