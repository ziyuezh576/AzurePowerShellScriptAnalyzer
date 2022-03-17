
$credential = Get-Credential

$expiration = (Get-Date).AddYears(1)

$extension = New-AzCloudServiceRemoteDesktopExtensionObject -Name 'RDPExtension' -Credential $credential -Expiration $expiration -TypeHandlerVersion '1.2.1'
