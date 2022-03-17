
$odataFilter = "Name ne 'ABCD'"

$result = Get-AzEventGridTopic -ResourceGroup MyResourceGroupName -Top 10 -ODataQuery $odataFilter

Get-AzEventGridTopic $result.NextLink
