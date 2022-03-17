
$apimContext = New-AzApiManagementContext -ResourceGroupName "Api-Default-WestUS" -ServiceName "contoso"

Get-AzApiManagementCertificate -ResourceId $kvcert.Id | Sync-AzApiManagementKeyVaultObject
