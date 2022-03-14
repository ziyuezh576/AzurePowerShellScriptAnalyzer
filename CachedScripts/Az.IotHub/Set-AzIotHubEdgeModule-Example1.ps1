
$content = Get-Content "C:/Edge/modules.json" | ConvertFrom-Json -AsHashtable

Set-AzIotHubEdgeModule -ResourceGroupName "myresourcegroup" -IotHubName "myiothub" -DeviceId "myEdgeDevice1" -ModulesContent $content
