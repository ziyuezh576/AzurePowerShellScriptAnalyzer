
Get-AzDataBoxJobCredential -Name "DtbxPowershell" -ResourceGroupName "resourceGroupName"

$obj = Get-AzDataBoxJobCredential -Name TJy-637522091284252285 -ResourceGroupName bvttoolrg12-Wednesday

$obj | Format-List

$obj.JobSecret | Format-List

$cabinetJobSecret = $obj.JobSecret.CabinetPodSecret | Format-List
