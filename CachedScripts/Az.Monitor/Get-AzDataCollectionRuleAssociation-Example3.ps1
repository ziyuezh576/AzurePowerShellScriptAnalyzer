
$dcr = Get-AzDataCollectionRule -ResourceGroupName $rg -RuleName $dcrName

$dcr | Get-AzDataCollectionRuleAssociation
