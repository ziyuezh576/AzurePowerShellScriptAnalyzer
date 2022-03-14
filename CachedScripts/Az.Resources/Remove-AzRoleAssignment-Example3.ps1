
$roleassignment = Get-AzRoleAssignment |Select-Object -First 1 -Wait

Remove-AzRoleAssignment -InputObject $roleassignment
