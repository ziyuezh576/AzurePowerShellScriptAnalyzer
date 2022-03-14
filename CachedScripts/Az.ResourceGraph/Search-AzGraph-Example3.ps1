
$response = Search-AzGraph -Query "project id, name, type, location" -First 2

Search-AzGraph -Query "project id, name, type, location" -SkipToken $response.SkipToken
