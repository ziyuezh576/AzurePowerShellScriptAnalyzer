
$reponse = Get-AzManagementGroup -GroupName TestGroupParent -Expand

$response

$response.Children[0]
