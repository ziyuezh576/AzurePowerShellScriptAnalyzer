
$bastion = Get-AzBastion -ResourceGroupName "BastionPowershellTest" -Name "testBastion"

Remove-AzBastion -InputObject $bastion
