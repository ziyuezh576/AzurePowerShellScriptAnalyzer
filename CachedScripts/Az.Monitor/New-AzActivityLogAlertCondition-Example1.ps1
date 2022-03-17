
$Condition = New-AzActivityLogAlertCondition -Field "Requests" -Equal "OtherField"

Write-Host "Field property value: $($Condition.Field)"

Write-Host "Equals property value: $($Condition.Equals)"
