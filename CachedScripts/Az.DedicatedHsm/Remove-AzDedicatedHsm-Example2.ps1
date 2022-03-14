
$hsm = Get-AzDedicatedHsm -Name hsm-7t2xaf -ResourceGroupName dedicatedhsm-rg-n359cz

Remove-AzDedicatedHsm -InputObject  $hsm
