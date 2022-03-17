
$updatedTag = @{}

$updatedTag.add("key0","value0")

Update-AzIotHub -ResourceGroupName "myresourcegroup" -Name "myiothub" -Tag $updatedTag
