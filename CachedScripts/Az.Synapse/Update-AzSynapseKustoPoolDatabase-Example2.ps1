
$database = Get-AzSynapseKustoPoolDatabase -ResourceGroupName testrg -WorkspaceName testws -KustoPoolName testkustopool -DatabaseName mykustodatabase

$2ds = New-TimeSpan -Days 2

$4ds = New-TimeSpan -Days 4

Update-AzSynapseKustoPoolDatabase -InputObject $database -Kind ReadWrite -SoftDeletePeriod $4ds -HotCachePeriod $2ds -Location 'East US'
