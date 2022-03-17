
$Subscription = Get-AzSubscription -SubscriptionName 'Subscription01'

$Assignment = Get-AzPolicyAssignment -Name 'VirtualMachinePolicyAssignment'

New-AzPolicyExemption -Name 'VirtualMachinePolicyExemption' -PolicyAssignment $Assignment -Scope "/subscriptions/$($Subscription.Id)" -ExemptionCategory Waiver
