
$odataFilter = "Name ne 'ABCD'"

$result = Get-AzEventGridTopic -Top 10 -ODataQuery $odataFilter

Get-AzEventGridTopic $result.NextLink
