
$image = Get-AzImage -ResourceGroupName 'ResourceGroup01' -ImageName 'Image01' 

$image.Tags = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"

$image.Tags.Add("key1", "val1")

Update-AzImage -ResourceGroupName 'ResourceGroup01' -ImageName 'Image01' -Image $image
