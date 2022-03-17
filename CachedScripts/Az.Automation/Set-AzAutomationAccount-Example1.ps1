
$Tags = @{"tag01"="value01";"tag02"="value02"}

Set-AzAutomationAccount -Name "AutomationAccount01" -ResourceGroupName "ResourceGroup01" -Tags $Tags
