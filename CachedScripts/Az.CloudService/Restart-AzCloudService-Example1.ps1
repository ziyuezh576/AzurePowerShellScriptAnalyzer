
$roleInstances = @("ContosoFrontEnd_IN_0", "ContosoBackEnd_IN_1")

Restart-AzCloudService -ResourceGroupName "ContosOrg" -CloudServiceName "ContosoCS" -RoleInstance $roleInstances
