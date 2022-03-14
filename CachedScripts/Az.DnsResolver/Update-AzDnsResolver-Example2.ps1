
$dnsResolverObject = Get-AzDnsResolver -ResourceGroupName powershell-test-rg -Name  psdnsresolvername33nmy1fz

Update-AzDnsResolver -InputObject $dnsResolverObject  -Tag @{} 
