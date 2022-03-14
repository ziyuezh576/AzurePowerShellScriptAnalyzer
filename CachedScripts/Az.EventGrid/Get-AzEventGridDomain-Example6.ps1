
$total = 0

$odataFilter = "Contains(Name, 'ABCD')"

$result = Get-AzEventGridDomain -Top 20 -ODataQuery $odataFilter

$total += $result.Count

        $result = Get-AzEventGridDomain -NextLink $result.NextLink

        $total += $result.Count

Write-Output "Total number of domains is $Total"
