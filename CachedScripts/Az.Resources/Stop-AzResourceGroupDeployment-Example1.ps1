
New-AzResourceGroupDeployment -Name mynewstorageaccount -ResourceGroupName myrg -TemplateFile .\storage-account-create-azdeploy.json -TemplateParameterFile .\storage-account-create-azdeploy.parameters.json -AsJob

Stop-AzResourceGroupDeployment -Name mynewstorageaccount -ResourceGroupName myrg

Get-Job 1
