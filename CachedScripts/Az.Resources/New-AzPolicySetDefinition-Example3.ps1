
$groupsJson = ConvertTo-Json @{ name = "group1" }, @{ name = "group2" }

New-AzPolicySetDefinition -Name 'VMPolicySetDefinition' -GroupDefinition $groupsJson -PolicyDefinition C:\VMPolicySet.json
