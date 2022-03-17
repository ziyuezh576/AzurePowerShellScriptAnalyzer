
Set-AzContext -SubscriptionName $targetSubscription

$validated = Test-AzRecoveryServicesDSMove -SourceVault $srcVault -TargetVault $trgVault -Force

Set-AzContext -SubscriptionName $sourceSubscription
