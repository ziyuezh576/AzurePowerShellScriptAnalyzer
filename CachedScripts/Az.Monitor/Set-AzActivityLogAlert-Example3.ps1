
Get-AzActivityLogAlert -Name $alertName -ResourceGroupName $resourceGroupName | Set-AzActivityLogAlert

$alert = Get-AzActivityLogAlert -Name $alertName -ResourceGroupName $resourceGroupName

$alert.Description = 'Changing the description'

$alert.Enabled = $false

Set-AzActivityLogAlert -InputObject $alert
