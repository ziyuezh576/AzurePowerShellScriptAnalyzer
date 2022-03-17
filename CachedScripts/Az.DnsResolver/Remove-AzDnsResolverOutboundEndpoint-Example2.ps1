
$inputObject = Get-AzDnsResolverOutboundEndpoint -DnsResolverName sampleResolver -Name sampleOutbound -ResourceGroupName sampleResourceGroup

Remove-AzDnsResolverOutboundEndpoint -InputObject $inputObject 
