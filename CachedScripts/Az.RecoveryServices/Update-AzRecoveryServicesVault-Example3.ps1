
$vault = Get-AzRecoveryServicesVault -Name "vaultName" -ResourceGroupName "resourceGroupName"

$updatedVault = Update-AzRecoveryServicesVault -ResourceGroupName $vault.ResourceGroupName -Name $vault.Name -RemoveSystemAssigned

$AllUserIdentities =  $vault.Identity.UserAssignedIdentities.Keys | foreach {$_} 

$updatedVault = Update-AzRecoveryServicesVault -ResourceGroupName $vault.ResourceGroupName -Name $vault.Name -RemoveUserAssigned -IdentityId $AllUserIdentities

$updatedVault.Identity | fl
