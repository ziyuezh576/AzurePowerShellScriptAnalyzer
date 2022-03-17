
$job = New-AzRecoveryServicesAsrProtectionContainer -Name xyz -Fabric $fabric

Get-ASRJob -name $job.id
