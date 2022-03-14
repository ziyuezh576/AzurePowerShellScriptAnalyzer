
$EventLogNames       = @()

$EventLogNames      += 'Directory Service'

$EventLogNames      += 'Microsoft-Windows-EventCollector/Operational'

$EventLogNames      += 'System'

$ResourceGroupName   = 'MyResourceGroup'

$WorkspaceName       = 'MyWorkspaceName'

$Count = 0

    $Count++

    $null = New-AzOperationalInsightsWindowsEventDataSource `
    -ResourceGroupName $ResourceGroupName `
    -WorkspaceName $WorkspaceName `
    -Name "Windows-event-$($Count)" `
    -EventLogName $EventLogName `
    -CollectErrors `
    -CollectWarnings `
    -CollectInformation

Get-AzOperationalInsightsDataSource `
   -ResourceGroupName $ResourceGroupName `
   -WorkspaceName $WorkspaceName `
   -Kind 'WindowsEvent'
