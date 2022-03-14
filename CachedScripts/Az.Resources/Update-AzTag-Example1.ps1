
$mergedTags = @{"key1"="value1"; "key3"="value3";}

Update-AzTag -ResourceId /subscriptions/{subId} -Tag $mergedTags -Operation Merge
