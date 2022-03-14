
$queryResults = Invoke-AzOperationalInsightsQuery -WorkspaceId "63613592-b6f7-4c3d-a390-22ba13102111" -Query "union * | take 10"

$resultsArray = [System.Linq.Enumerable]::ToArray($queryResults.Results)
