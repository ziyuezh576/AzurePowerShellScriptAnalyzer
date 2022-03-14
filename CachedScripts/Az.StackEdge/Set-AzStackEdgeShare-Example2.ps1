
$AccessRights = @(@{"Username"="user-name-1";"AccessRight"="Read"}, @{"Username"="user-name-2";"AccessRight"="Read"}, @{"Username"="user-name-3";"AccessRight"="Custom"})

Set-AzStackEdgeShare -ResourceGroupName resource-group-name -UserAccessRight $AccessRights
