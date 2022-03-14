
$total = 0

$odataFilter = "Name ne 'ABCD'"

$result = Get-AzEventGridDomain -ResourceGroup MyResourceGroupName -Top 10 -ODataQuery $odataFilter

$total += $result.Count

        $result = Get-AzEventGridDomain -NextLink $result.NextLink

        $total += $result.Count

Write-Output "Total number of domains is $Total"
