
$get = Get-AzPurviewAccount -Name test-pa -ResourceGroupName test-rg

Remove-AzPurviewAccount -InputObject $get
