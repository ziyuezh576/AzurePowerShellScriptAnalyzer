
$odataFilter = "Name ne 'ABCD'"

Get-AzEventGridSubscription -ResourceGroupName MyResourceGroupName -TopicName Topic1 -Top 10 -ODataQuery $odataFilter

Get-AzEventGridSubscription $result.NextLink
