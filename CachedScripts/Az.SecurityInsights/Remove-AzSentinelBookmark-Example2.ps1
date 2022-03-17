
$SentinelConnection = @{

$Bookmark = Get-AzSentinelBookmark @SentinelConnection | Where-Object {$_.DisplayName -eq "My Bookmark"}

Remove-AzSentinelBookmark @SentinelConnection -BookmarkId $Bookmark.Name
