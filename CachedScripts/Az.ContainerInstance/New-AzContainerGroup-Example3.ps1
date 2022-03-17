
$container = New-AzContainerInstanceObject -Name test-container -Image alpine -Command "echo hello" 

$containerGroup = New-AzContainerGroup -ResourceGroupName test-rg -Name test-cg -Location eastus -Container $container -OsType Linux
