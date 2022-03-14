
$total = 0

$odataFilter = "Name ne 'ABCD'"

$result = Get-AzEventGridDomainTopic -ResourceGroup MyResourceGroupName -DomainName Domain1 -Top 10 -ODataQuery $odataFilter

$total += $result.Count

        $result = Get-AzEventGridDomainTopic -NextLink $result.NextLink

        $total += $result.Count
