
$MaxReturn = 1000

$FileSystemName = "filesystem1"

$Total = 0

$Token = $Null

     $items = Get-AzDataLakeGen2ChildItem -FileSystem $FileSystemName -Recurse -MaxCount $MaxReturn  -ContinuationToken $Token

     $Total += $items.Count

     $Token = $items[$items.Count -1].ContinuationToken;
