
$ResourceId = (Get-AzResource -ResourceType Microsoft.ServiceBus/namespaces).ResourceId

Remove-AzServiceBusNamespace -ResourceId $resourceid
