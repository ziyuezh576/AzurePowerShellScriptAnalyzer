
$deletedTags = @{"key1"="value1"}

Update-AzTag -ResourceId /subscriptions/{subId} -Tag $deletedTags -Operation Delete
