
$parentObject = Get-AzManagementGroup -GroupName "TestGroupParent"

Update-AzManagementGroup -GroupName "TestGroup" -ParentObject $parentObject
