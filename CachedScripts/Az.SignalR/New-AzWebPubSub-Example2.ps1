
$wps = New-AzWebPubSub -ResourceGroupName psdemo -Name psdemo-wps `
-Location eastus -SkuName Standard_S1 -IdentityType SystemAssigned -LiveTraceEnabled true `
-LiveTraceCategory @{ Name='ConnectivityLogs' ; Enabled = 'true' }, @{ Name='MessageLogs' ; Enabled = 'true' }

$wps | format-list
