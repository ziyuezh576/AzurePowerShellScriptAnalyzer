
$vm = Get-AzVM -ResourceGroupName $rg -Name $vmName

Get-AzDataCollectionRuleAssociation -TargetResourceId $vm.Id
