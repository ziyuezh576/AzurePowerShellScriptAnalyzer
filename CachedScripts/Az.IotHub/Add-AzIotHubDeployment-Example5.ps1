
$content = Get-Content "C:/Edge/modules.json" | ConvertFrom-Json -AsHashtable

Add-AzIotHubDeployment -ResourceGroupName "myresourcegroup" -IotHubName "myiothub" -Name "deploy1" -ModulesContent $content -TargetCondition "from devices.modules where tags.environment='test'"
