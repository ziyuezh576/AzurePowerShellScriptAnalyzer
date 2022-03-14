
$Text = Get-Content -Path "C:\Azure\Certificates\ExportedCertificate.cer"

$CertificateText = for ($i=1; $i -lt $Text.Length -1 ; $i++){$Text[$i]}

$Certificate = New-AzVpnClientRootCertificate -PublicCertData $CertificateText -Name "ContosoClientRootCertificate"
