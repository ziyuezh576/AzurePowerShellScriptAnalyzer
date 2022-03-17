
$diskConfig = New-AzDiskConfig -Location 'eastus2euap' -AccountType 'Premium_LRS' -CreateOption 'Empty' -DiskSizeGB 32 -PurchasePlan $diskPurchasePlan

New-AzDisk -ResourceGroupName 'ResourceGroup02' -DiskName 'Disk02' -Disk $diskConfig

$disk = Get-AzDisk -ResourceGroupName 'ResourceGroup02' -DiskName 'Disk02'
