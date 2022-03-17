
$odataFilter = "Name ne 'ABCD'"

Get-AzEventGridSubscription -TopicTypeName "Microsoft.Resources.ResourceGroups" -ResourceGroupName MyResourceGroupName -Top 100 -ODataQuery $odataFilter

Get-AzEventGridSubscription $result.NextLink
