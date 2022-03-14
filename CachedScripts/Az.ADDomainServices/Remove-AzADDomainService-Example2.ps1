
$GetADDomainExample = Get-AzADDomainService -ResourceGroupName $env.ResourceGroupName -Name $env.ADdomainName

Remove-AzADDomainService -InputObject $GetADDomainExample
