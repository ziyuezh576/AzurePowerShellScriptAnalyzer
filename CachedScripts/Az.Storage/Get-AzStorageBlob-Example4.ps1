
$MaxReturn = 10000

$ContainerName = "abc"

$Total = 0

$Token = $Null

     $Blobs = Get-AzStorageBlob -Container $ContainerName -MaxCount $MaxReturn  -ContinuationToken $Token

     $Total += $Blobs.Count

     $Token = $Blobs[$blobs.Count -1].ContinuationToken;
