
$inputobject = Get-AzDnsResolverInboundEndpoint -DnsResolverName pstestdnsresolvername -Name sampleInboundEndpoint -ResourceGroupName powershell-test-rg   

Update-AzDnsResolverInboundEndpoint   -InputObject $inputobject -Metadata @{"value0" = "value1"}
