
$start = Get-Date -Date "2021-07-16T12:09:03.141Z" -AsUTC

$end = Get-Date -Date "2021-07-18T12:09:03.141Z" -AsUTC

Get-AzChangeAnalysis -StartTime $start -EndTime $end -ResourceId '/subscriptions/xxxxxx-xxxxx-xxxx-xxxx-xxxxxxf/resourceGroups/azpssmokerg1268133cx4/providers/Microsoft.Storage/storageAccounts/azpssmokesa1268133cx4'
