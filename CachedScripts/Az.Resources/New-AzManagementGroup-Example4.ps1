
$parentObject = Get-AzManagementGroup -GroupName "TestGroupParent"

New-AzManagementGroup -GroupName "TestGroup" -ParentObject $parentObject
