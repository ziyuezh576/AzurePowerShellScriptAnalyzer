
$roleDef = Get-AzRoleDefinition "Contoso On-Call"

$roleDef.Actions.Add("Microsoft.ClassicCompute/virtualmachines/start/action")

$roleDef.Description = "Can monitor all resources and start and restart virtual machines"

$roleDef.AssignableScopes = @("/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")

Set-AzRoleDefinition -Role $roleDef
