
$rulesEngineAction = New-AzFrontDoorRulesEngineActionObject -RequestHeaderAction $headerActions -ForwardingProtocol HttpsOnly -BackendPoolName mybackendpool -ResourceGroupName Jessicl-Test-RG -FrontDoorName jessicl-test-myappfrontend -QueryParameterStripDirective StripNone -DynamicCompression Disabled -EnableCaching $true

$rulesEngineAction

$rulesEngineAction.RequestHeaderAction

$rulesEngineAction.ResponseHeaderAction

$rulesEngineAction.RouteConfigurationOverride
