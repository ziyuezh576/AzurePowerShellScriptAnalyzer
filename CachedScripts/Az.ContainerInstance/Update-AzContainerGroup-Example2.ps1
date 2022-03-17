
$container = Get-AzContainerGroup -Name test-cg -ResourceGroupName test-rg | Update-AzContainerGroup -Tag @{"k"="v"}

$container.Tag | fl
