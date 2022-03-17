
$odataFilter = "Name ne 'ABCD'"

Get-AzEventGridSubscription -TopicTypeName "Microsoft.EventHub.Namespaces" -Location $location -Top 15 -ODataQuery $odataFilter

Get-AzEventGridSubscription $result.NextLink
