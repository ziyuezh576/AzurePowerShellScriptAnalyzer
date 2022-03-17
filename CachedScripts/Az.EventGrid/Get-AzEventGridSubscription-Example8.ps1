
$odataFilter = "Name ne 'ABCD'"

Get-AzEventGridSubscription -ResourceGroupName MyResourceGroupName -Top 5 -ODataQuery $odataFilter

Get-AzEventGridSubscription $result.NextLink
