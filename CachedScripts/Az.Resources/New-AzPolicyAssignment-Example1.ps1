
$Subscription = Get-AzSubscription -SubscriptionName 'Subscription01'

$Policy = Get-AzPolicyDefinition -Name 'VirtualMachinePolicy'

New-AzPolicyAssignment -Name 'VirtualMachinePolicyAssignment' -PolicyDefinition $Policy -Scope "/subscriptions/$($Subscription.Id)"
