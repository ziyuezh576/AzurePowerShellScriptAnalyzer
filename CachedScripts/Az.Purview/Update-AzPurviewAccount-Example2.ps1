
$get = Get-AzPurviewAccount -Name test-pa -ResourceGroupName test-rg 

Update-AzPurviewAccount -InputObject $get -Tag @{"k"="v"}
