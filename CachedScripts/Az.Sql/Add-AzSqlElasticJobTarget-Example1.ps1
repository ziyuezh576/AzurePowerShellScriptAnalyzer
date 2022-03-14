
$tg = Get-AzSqlElasticJobTargetGroup -ResourceGroupName rg -ServerName elasticjobserver -Name tg1

$tg | Add-AzSqlElasticJobTarget -ServerName s1 -RefreshCredentialName cred1
