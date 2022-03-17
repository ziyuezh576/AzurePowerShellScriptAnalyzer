
$flowLog = Get-AzNetworkWatcherFlowLog -Location eastus -Name pstest

$flowLog.Enabled = $true

$flowLog.Format.Version = 2

$flowLog | Set-AzNetworkWatcherFlowLog -Force
