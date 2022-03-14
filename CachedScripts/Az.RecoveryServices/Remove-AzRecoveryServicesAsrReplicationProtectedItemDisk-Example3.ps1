
$currentJob = Remove-AzRecoveryServicesAsrReplicationProtectedItemDisk -ReplicationProtectedItem $rpi -DiskId $diskId

Get-AzRecoveryServicesAsrJob -name $currentJob.id
