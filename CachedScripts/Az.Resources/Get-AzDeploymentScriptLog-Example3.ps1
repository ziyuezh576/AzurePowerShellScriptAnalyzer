
$ds = Get-AzDeploymentScript -Name MyDeploymentScript -ResourceGroupName DS-TestRg

Get-AzDeploymentScriptLog -DeploymentScriptInputObject $ds
