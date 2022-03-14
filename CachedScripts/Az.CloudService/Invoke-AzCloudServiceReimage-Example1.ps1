
$roleInstances = @("ContosoFrontEnd_IN_0", "ContosoBackEnd_IN_1")

Invoke-AzCloudServiceReimage -ResourceGroupName "ContosOrg" -CloudServiceName "ContosoCS" -RoleInstance $roleInstances
