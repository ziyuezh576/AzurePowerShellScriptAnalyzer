
$currentJob = Set-AzRecoveryServicesAsrReplicationProtectedItem -InputObject $rpi `
		-DiskEncryptionVaultId $DiskEncryptionVaultId -DiskEncryptionSecertUrl $DiskEncryptionSecertUrl `
		-KeyEncryptionVaultId $KeyEncryptionVaultId -KeyEncryptionKeyUrl $KeyEncryptionKeyUrl
