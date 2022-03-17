
$key=(Get-AzApplicationInsights -ResourceId $ai).InstrumentationKey

$setting=@{"ApplicationInsightsAgent_EXTENSION_VERSION"="~3"; "APPINSIGHTS_INSTRUMENTATIONKEY"=$key}

Set-AzWebApp -AppSettings $setting -Name 'ContosoWebApp' -ResourceGroupName 'Default-Web-WestUS'
