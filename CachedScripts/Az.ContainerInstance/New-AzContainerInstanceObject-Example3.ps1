
$container = New-AzContainerInstanceObject -Name test-container -Image alpine

New-AzContainerGroup -ResourceGroupName testrg-rg -Name test-cg -Location eastus -Container $container
