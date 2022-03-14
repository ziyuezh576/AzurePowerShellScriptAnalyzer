
$identity = @{ ResourceGroupName = 'psdemo'

$identity | Update-AzWebPubSub -EnableTlsClientCert

$wps | format-list
