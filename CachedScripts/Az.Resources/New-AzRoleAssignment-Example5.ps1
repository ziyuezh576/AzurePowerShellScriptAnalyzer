
$servicePrincipal = New-AzADServicePrincipal -DisplayName "testServiceprincipal"

New-AzRoleAssignment -RoleDefinitionName "Reader" -ApplicationId $servicePrincipal.ApplicationId
