
$bastionObj = Get-AzBastion -ResourceGroupName "MyRg" -Name "MyBastion"

$bastionObj

$bastionObj.Sku.Name = "Standard"

$bastionObj.ScaleUnit = 50

Set-AzBastion -InputObject $bastionObj -Force
