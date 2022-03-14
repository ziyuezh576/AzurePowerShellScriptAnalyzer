
$context=New-AzApiManagementContext -ResourceGroupName Api-Default-Central-US -ServiceName contoso

Update-AzApiManagementCache -Context $context -CacheId centralus -Description "Team new cache" -PassThru
