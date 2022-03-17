
$odataFilter = "Name ne 'ABCD'"

Get-AzEventGridSubscription -ResourceId "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.EventHub/namespaces/$namespaceName" -Top 25 -ODataQuery $odataFilter

Get-AzEventGridSubscription $result.NextLink
