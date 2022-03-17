
$cloudServiceInstanceView = Get-AzCloudServiceInstanceView -ResourceGroupName "ContosOrg" -CloudServiceName "ContosoCS"

$cloudServiceInstanceView

$cloudServiceInstanceView.ToJsonString()
