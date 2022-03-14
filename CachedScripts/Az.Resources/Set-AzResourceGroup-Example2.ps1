
$Tags = (Get-AzResourceGroup -Name "ContosoRG").Tags

$Tags

$Tags += @{"Status"="Approved"; "FY2016"=$null}

Set-AzResourceGroup -Name "ContosoRG" -Tag $Tags

(Get-AzResourceGroup -Name "ContosoRG").Tags
