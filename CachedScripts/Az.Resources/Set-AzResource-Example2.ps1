
$Resource = Get-AzResource -ResourceGroupName testrg

$Resource | ForEach-Object { $_.Tags.Add("testkey", "testval") }

$Resource | Set-AzResource -Force
