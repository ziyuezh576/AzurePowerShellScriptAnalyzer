
$container = Update-AzContainerGroup -Name test-cg -ResourceGroupName test-rg -Tag @{"k"="v"}

$container.Tag | fl
