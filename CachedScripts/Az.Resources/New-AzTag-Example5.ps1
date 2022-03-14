
$Tags = @{"tagKey1"="tagValue1"; "tagKey2"="tagValue2"}

New-AzTag -ResourceId /subscriptions/{subId} -Tag $Tags
