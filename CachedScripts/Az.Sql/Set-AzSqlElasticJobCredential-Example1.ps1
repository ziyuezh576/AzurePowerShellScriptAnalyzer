
$cred = Get-AzSqlElasticJobCredential -ResourceGroupName rg -ServerName elasticjobserver -AgentName agent -Name cred1

$cred | Set-AzSqlElasticJobCredential -Name cred1 -Credential (Get-Credential)
