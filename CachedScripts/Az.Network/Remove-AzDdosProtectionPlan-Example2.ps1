
$vnet = Get-AzVirtualNetwork -Name VnetName -ResourceGroupName ResourceGroupName

$vnet.DdosProtectionPlan = $null

$vnet.EnableDdosProtection = $false

$vnet | Set-AzVirtualNetwork

Remove-AzDdosProtectionPlan -ResourceGroupName ResourceGroupName -Name DdosProtectionPlan
