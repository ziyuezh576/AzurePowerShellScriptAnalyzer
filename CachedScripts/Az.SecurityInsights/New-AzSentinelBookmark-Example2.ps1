
$SentinelConnection = @{

$BookmarkQuery = @"

$DisplayName = "My Bookmark Query"

$Notes = "This is a comment"

New-AzSentinelBookmark @SentinelConnection -DisplayName $DisplayName -Query $BookmarkQuery -Note $Notes
