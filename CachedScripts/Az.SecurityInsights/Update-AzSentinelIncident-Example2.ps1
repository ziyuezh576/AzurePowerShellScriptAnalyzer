
$ownerObject = @{"AssignedTo" = "John Doe"; "Email" = "johndoe@contoso.com"; "ObjectId" = "f4e959b4-feda-4345-a1e7-16b4af2fc226";"UserPrincipalName" = "johndoe@contoso.com"}

Update-AzSentinelIncident -ResourceGroupName "myResourceGroup" -WorkspaceName "myWorkspaceName"  -IncidentId a4b586c8-97d8-4cc5-9154-b723c62d26d8 -Owner $ownerObject
