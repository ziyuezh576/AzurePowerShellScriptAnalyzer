
New-AzResourceGroup -Location "West US" -Name "testRG" 

New-AzVirtualWan -ResourceGroupName "testRG" -Name "myVirtualWAN" -Location "West US" -AllowBranchToBranchTraffic $true

Get-AzVirtualWan -Name "myVirtualWAN" -ResourceGroupName "testRG"
