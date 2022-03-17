
$tg = Get-AzSqlElasticJobTargetGroup -ResourceGroupName rg -ServerName elasticjobserver -Name tg1

$tg | Remove-AzSqlElasticJobTarget -ServerName s1 -RefreshCredentialName cred1
