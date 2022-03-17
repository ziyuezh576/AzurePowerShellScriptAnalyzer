
$validation = Invoke-AzStorageSyncCompatibilityCheck C:\DATA

$validation.Results | Select-Object -Property Type, Path, Level, Description, Result | Export-Csv -Path C:\results.csv -Encoding utf8
