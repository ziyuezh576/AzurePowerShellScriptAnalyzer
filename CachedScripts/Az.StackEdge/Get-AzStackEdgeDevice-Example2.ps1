
$device = Get-AzStackEdgeDevice -ResourceGroupName resourceGroupName1 -DeviceName deviceNameOne -Alert -UpdateSummary -NetworkSetting -ExtendedInfo

$device.Alert

$device.NetworkSetting

$device.UpdateSummary

$device.ExtendedInfo
