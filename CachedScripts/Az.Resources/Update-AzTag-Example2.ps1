
$replacedTags = @{"key1"="value1"; "key3"="value3";}

Update-AzTag -ResourceId /subscriptions/{subId} -Tag $replacedTags -Operation Replace
