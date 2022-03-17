
$ddosProtectionPlan = New-AzDdosProtectionPlan -ResourceGroupName ResourceGroupName -Name DdosProtectionPlanName -Location "West US"

$vnet = Get-AzVirtualNetwork -Name VnetName -ResourceGroupName ResourceGroupName

$vnet.DdosProtectionPlan = New-Object Microsoft.Azure.Commands.Network.Models.PSResourceId

$vnet.DdosProtectionPlan.Id = $ddosProtectionPlan.Id

$vnet.EnableDdosProtection = $true

$vnet | Set-AzVirtualNetwork
