
$currentJob = New-AzRecoveryServicesAsrFabric -Azure -Name $fabricName -Location "eastus"

Get-ASRJob -name $currentJob.id
