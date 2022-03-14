
$odataFilter = "Name ne 'ABCD'"

Get-AzEventGridSubscription -Top 15 -ODataQuery $odataFilter

Get-AzEventGridSubscription $result.NextLink
