
$imageConfig = New-AzImageConfig -Location 'West US';

$osDiskVhdUri = "https://contoso.blob.core.windows.net/test/os.vhd"

$dataDiskVhdUri1 = "https://contoso.blob.core.windows.net/test/data1.vhd"

$dataDiskVhdUri2 = "https://contoso.blob.core.windows.net/test/data2.vhd"

Set-AzImageOsDisk -Image $imageConfig -OsType 'Windows' -OsState 'Generalized' -BlobUri $osDiskVhdUri;

Add-AzImageDataDisk -Image $imageConfig -Lun 1 -BlobUri $dataDiskVhdUri1;

Add-AzImageDataDisk -Image $imageConfig -Lun 2 -BlobUri $dataDiskVhdUri2;

New-AzImage -Image $imageConfig -ImageName 'ImageName01' -ResourceGroupName 'ResourceGroup01';
