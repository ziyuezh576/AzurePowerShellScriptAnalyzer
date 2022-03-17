
$sac = Get-AzStreamAnalyticsCluster -ResourceGroupName pwshaz-rg-test -Name sac-m-test01

Update-AzStreamAnalyticsCluster -InputObject $sac -Tag @{'key2'=2;'key3'=3}
