
$SentinelConnection = @{

$Incident = Get-AzSentinelIncident @SentinelConnection | Where-Object {$_.IncidentNumber -eq "346"}

Remove-AzSentinelIncident @SentinelConnection -IncidentId $Incident.Name
