
$agent = Get-AzSqlElasticJobAgent -ResourceGroupName rg -ServerName elasticjobserver -Name agent

$agent | New-AzSqlElasticJobCredential -Name cred1 -Credential (Get-Credential)
