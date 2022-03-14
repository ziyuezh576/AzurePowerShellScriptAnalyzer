
$location01 = New-AzApplicationInsightsWebTestGeolocationObject -Location "emea-nl-ams-azr"

$location02 = New-AzApplicationInsightsWebTestGeolocationObject -Location "us-ca-sjc-azr"

 New-AzApplicationInsightsWebTest -ResourceGroup azpwsh-rg-test -Name standardwebtestpwsh03 -Location 'westus2' `
-Tag @{"hidden-link:/subscriptions/xxxxxxxxxx-xxxx-xxxxx-xxxxxxxxxxxx/resourceGroups/azpwsh-rg-test/providers/microsoft.insights/components/appinsightsportal01" = "Resource"} `
-RequestUrl "https://docs.microsoft.com/"  -RequestHttpVerb "GET" `
-NameInAppInsights 'standardwebtestpwsh03' `
-RuleSslCheck -RuleSslCertRemainingLifetimeCheck 7 -RuleExpectedHttpStatusCode 200 `
-Enabled -Frequency 300 -Timeout 120 -WebTestKind "standard" -RetryEnabled -GeoLocations $location01, $location02 ` |Get-AzApplicationInsightsWebTest
