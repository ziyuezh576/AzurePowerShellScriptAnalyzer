
$roleInstances = @("ContosoFrontEnd_IN_0", "ContosoBackEnd_IN_1")

Invoke-AzCloudServiceRebuild -ResourceGroupName "ContosOrg" -CloudServiceName "ContosoCS" -RoleInstance $roleInstances
