
$apiKeyDescription="testapiKey"

$permissions = @("ReadTelemetry", "WriteAnnotations")

New-AzApplicationInsightsApiKey -ResourceGroupName "testGroup" -Name "test" -Description $apiKeyDescription -Permissions $permissions
