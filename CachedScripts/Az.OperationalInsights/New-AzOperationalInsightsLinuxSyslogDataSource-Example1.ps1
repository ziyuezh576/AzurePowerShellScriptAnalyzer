
$FacilityNames       = @()

$FacilityNames      += 'auth'

$FacilityNames      += 'authpriv'

$FacilityNames      += 'cron'

$FacilityNames      += 'daemon'

$FacilityNames      += 'ftp'

$FacilityNames      += 'kern'

$FacilityNames      += 'mail'

$FacilityNames      += 'syslog'

$FacilityNames      += 'user'

$FacilityNames      += 'uucp'

$ResourceGroupName   = 'MyResourceGroup'

$WorkspaceName       = 'MyWorkspaceName'

$Count = 0

    $Count++

    $null = New-AzOperationalInsightsLinuxSyslogDataSource `
    -ResourceGroupName $ResourceGroupName `
    -WorkspaceName $WorkspaceName `
    -Name "Linux-syslog-$($Count)" `
    -Facility $FacilityName `
    -CollectEmergency `
    -CollectAlert `
    -CollectCritical `
    -CollectError `
    -CollectWarning `
    -CollectNotice `
    -CollectDebug `
    -CollectInformational

Get-AzOperationalInsightsDataSource `
   -ResourceGroupName $ResourceGroupName `
   -WorkspaceName $WorkspaceName `
   -Kind 'LinuxSyslog'
