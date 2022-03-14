
New-AzResourceGroup -Location "West US" -Name "testRG" 

New-AzVirtualWan -ResourceGroupName "testRG" -Name "myVirtualWAN" -Location "West US"

Update-AzVirtualWan -ResourceGroupName "testRG" -Name "myVirtualWAN" -AllowBranchToBranchTraffic $true -AllowVnetToVnetTraffic $false
