
$dnsResolverObject = Get-AzDnsResolver -ResourceGroupName powershell-test-rg -Name  psdnsresolvername33nmy1fz

Remove-AzDnsResolver -InputObject $dnsResolverObject 
