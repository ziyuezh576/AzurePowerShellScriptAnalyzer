
$inputObject = Get-AzDnsResolverOutboundEndpoint -DnsResolverName sampleResolver -Name sampleOutbound -ResourceGroupName sampleResourceGroup

Update-AzDnsResolverOutboundEndpoint -InputObject $inputObject -Metadata @{"value0" = "value1"}
