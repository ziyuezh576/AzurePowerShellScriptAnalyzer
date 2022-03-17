
$geoLocation = @()

$geoLocation += New-AzApplicationInsightsWebTestGeolocationObject -Location "emea-nl-ams-azr"

$geoLocation += New-AzApplicationInsightsWebTestGeolocationObject -Location "us-ca-sjc-azr"

New-AzApplicationInsightsWebTest -ResourceGroupName azpwsh-rg-test -Name 'pingwebtest-pwsh01' -TestName 'pingwentest-pwsh01testname' -Location 'westus2' `
-Tag @{"hidden-link:/subscriptions/xxxxxxxxxx-xxxx-xxxxx-xxxxxxxxxxxx/resourceGroups/azpwsh-rg-test/providers/microsoft.insights/components/appinsights-portal01" = "Resource"} `
-GeoLocation $geoLocation -RetryEnabled -Enabled -Frequency 300 -Timeout 90 `
-Kind 'ping' `
-Configuration "<WebTest  Name=`"basic-portal03`"  Id=`"9407db10-5d84-487f-98a3-a1ee67bb98f0`"  Enabled=`"True`"  CssProjectStructure=`"`"  CssIteration=`"`"  Timeout=`"90`"  WorkItemIds=`"`"  xmlns=`"http://microsoft.com/schemas/VisualStudio/TeamTest/2010`"  Description=`"`"  CredentialUserName=`"`"  CredentialPassword=`"`"  PreAuthenticate=`"True`"  Proxy=`"default`"  StopOnError=`"False`"  RecordedResultFile=`"`"  ResultsLocale=`"`"> 

pingwebtest-pwsh01 westus2  ping        azpwsh-rg-test      True
