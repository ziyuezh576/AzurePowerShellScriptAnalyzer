
$token = $null

$TotalDirectoriesSuccess = 0

$TotalFilesSuccess = 0

$totalFailure = 0

$FailedEntries = New-Object System.Collections.Generic.List[System.Object]

    $result = Remove-AzDataLakeGen2AclRecursive -FileSystem "filesystem1" -Path "dir1" -Acl $acl  -BatchSize 1000 -MaxBatchCount 50 -ContinuationToken $token -Context $ctx

    $TotalFilesSuccess += $result.TotalFilesSuccessfulCount

    $TotalDirectoriesSuccess += $result.TotalDirectoriesSuccessfulCount

    $totalFailure += $result.TotalFailureCount

    $FailedEntries += $result.FailedEntries

    $token = $result.ContinuationToken
