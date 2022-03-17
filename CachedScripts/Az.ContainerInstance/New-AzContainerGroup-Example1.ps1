
$port1 = New-AzContainerInstancePortObject -Port 8000 -Protocol TCP

$port2 = New-AzContainerInstancePortObject -Port 8001 -Protocol TCP

$container = New-AzContainerInstanceObject -Name test-container -Image nginx -RequestCpu 1 -RequestMemoryInGb 1.5 -Port @($port1, $port2)

$containerGroup = New-AzContainerGroup -ResourceGroupName test-rg -Name test-cg -Location eastus -Container $container -OsType Linux -RestartPolicy "Never" -IpAddressType Public
