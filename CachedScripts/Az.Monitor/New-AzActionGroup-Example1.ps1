
$dict = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"

$dict.Add('key1', 'value1')

$actionGrp1 = New-AzActionGroup -ActionGroupId 'actiongr1' -WebhookProperty $dict
