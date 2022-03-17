
$ResourceGroup = Get-AzResourceGroup -Name 'ResourceGroup11'

$Policy = Get-AzPolicyDefinition -BuiltIn | Where-Object {$_.Properties.DisplayName -eq 'Allowed locations'}

$Locations = Get-AzLocation | where displayname -like '*east*'

$AllowedLocations = @{'listOfAllowedLocations'=($Locations.location)}

New-AzPolicyAssignment -Name 'RestrictLocationPolicyAssignment' -PolicyDefinition $Policy -Scope $ResourceGroup.ResourceId -PolicyParameterObject $AllowedLocations
