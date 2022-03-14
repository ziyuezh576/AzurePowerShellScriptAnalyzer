
$enableTls=@{"Tls10" = "True"}

New-AzApiManagementSslSetting -FrontendProtocol $enableTls -BackendProtocol $enableTls
