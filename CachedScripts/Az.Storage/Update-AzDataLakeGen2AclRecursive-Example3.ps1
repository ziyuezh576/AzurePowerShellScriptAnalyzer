
$ContinueOnFailure = $true # Set it to $false if want to terminate the operation quickly on encountering failures

$token = $null

$TotalDirectoriesSuccess = 0

$TotalFilesSuccess = 0

$totalFailure = 0

$FailedEntries = New-Object System.Collections.Generic.List[System.Object]

        $result = Update-AzDataLakeGen2AclRecursive -FileSystem "filesystem1" -Path "dir1" -Acl $acl  -BatchSize 100 -MaxBatchCount 50 -ContinuationToken $token -Context $ctx -ContinueOnFailure

        $result = Update-AzDataLakeGen2AclRecursive -FileSystem "filesystem1" -Path "dir1" -Acl $acl  -BatchSize 100 -MaxBatchCount 50 -ContinuationToken $token -Context $ctx

    $TotalFilesSuccess += $result.TotalFilesSuccessfulCount

    $TotalDirectoriesSuccess += $result.TotalDirectoriesSuccessfulCount

    $totalFailure += $result.TotalFailureCount

    $FailedEntries += $result.FailedEntries

    $token = $result.ContinuationToken
