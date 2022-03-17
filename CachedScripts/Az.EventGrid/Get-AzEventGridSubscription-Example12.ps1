
$odataFilter = "Name ne 'ABCD'"

Get-AzEventGridSubscription -ResourceGroupName MyResourceGroupName -Location westus2 -Top 15 -ODataQuery $odataFilter

Get-AzEventGridSubscription $result.NextLink
