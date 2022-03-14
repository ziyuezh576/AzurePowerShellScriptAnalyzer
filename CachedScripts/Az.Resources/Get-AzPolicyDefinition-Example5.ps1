
Get-AzPolicyDefinition | where-object {$_.Properties.metadata.category -eq "Virtual Machine"}
