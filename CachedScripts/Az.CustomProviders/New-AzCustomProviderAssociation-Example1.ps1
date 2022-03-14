
$provider = Get-AzCustomProvider -ResourceGroupName myRg -Name Namespace.Type

New-AzCustomProviderAssociation -Scope $resourceId -Name MyAssoc -TargetResourceId $provider.Id
