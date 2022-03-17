
$Locations = Get-AzLocation | where {($_.displayname -like 'france*') -or ($_.displayname -like 'uk*')}

$AllowedLocations = @{'listOfAllowedLocations'=($Locations.location)}

$PolicyAssignment = Get-AzPolicyAssignment -Name 'PolicyAssignment'

Set-AzPolicyAssignment -Id $PolicyAssignment.ResourceId -PolicyParameterObject $AllowedLocations
