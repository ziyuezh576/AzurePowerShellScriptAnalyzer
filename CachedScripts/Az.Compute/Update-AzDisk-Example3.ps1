
$disk = Get-AzDisk -ResourceGroupName 'ResourceGroup01' -DiskName 'Disk01';

$disk.DiskSizeGB = 10;

Update-AzDisk -ResourceGroupName 'ResourceGroup01' -DiskName 'Disk01' -Disk $disk;
