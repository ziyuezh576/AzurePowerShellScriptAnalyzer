
$tag = @{}

$tag.Add("key1","Value1")

Get-AzIoTDps -ResourceGroupName "myresourcegroup" -Name "myiotdps" | Update-AzIoTDps -Tag $tag -Reset
