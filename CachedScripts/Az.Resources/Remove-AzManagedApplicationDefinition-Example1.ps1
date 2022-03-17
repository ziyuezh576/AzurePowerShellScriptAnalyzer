
$ApplicationDefinition = Get-AzManagedApplicationDefinition -Name "myAppDef" -ResourceGroupName "myRG"

Remove-AzManagedApplicationDefinition -Id $ApplicationDefinition.ResourceId -Force
