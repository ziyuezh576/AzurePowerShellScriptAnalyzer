
$job = Get-AzSqlElasticJob -ResourceGroupName rg -ServerName elasticjobserver -Name job1

$job | Add-AzSqlElasticJobStep -Name step1 -TargetGroupName tg1 -CredentialName cred1 -CommandText "SELECT 1"
