
$myDiskAccess = Get-AzDiskAccess -ResourceGroupName "ResourceGroup01" -Name "DiskAccess01"

Remove-AzDiskAccess -ResourceId $myDiskAccess.id
