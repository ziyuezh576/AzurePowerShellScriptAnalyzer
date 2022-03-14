
$Bookmark = Get-AzSentinelBookmark -ResourceGroupName "MyResourceGroup" -WorkspaceName "MyWorkspaceNAme" -BookmarkId "MyBookmarkId"

$Bookmark | Set-AzSentinelBookmark -Notes "Found something interesting"
