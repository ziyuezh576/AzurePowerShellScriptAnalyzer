
$start = Get-Date -Date "2021-07-16T12:09:03.141Z" -AsUTC

$end = Get-Date -Date "2021-07-18T12:09:03.141Z" -AsUTC

Get-AzChangeAnalysis -StartTime $start -EndTime $end -ResourceGroupName azpssmokerg1268133cx4
