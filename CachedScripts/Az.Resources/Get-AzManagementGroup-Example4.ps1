
$response = Get-AzManagementGroup -GroupName TestGroupParent -Expand -Recurse

$response

$response.Children[0]

$response.Children[0].Children[0]
