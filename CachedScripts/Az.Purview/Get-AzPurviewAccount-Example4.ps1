
$got = Get-AzPurviewAccount -Name test-pa -ResourceGroupName test-rg

Get-AzADDomainService -InputObject $got
