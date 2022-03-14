
$rulesEngineAction = New-AzFrontDoorRulesEngineActionObject -RedirectType Moved -RedirectProtocol MatchRequest -CustomHost www.contoso.com

$rulesEngineAction

$rulesEngineAction.RouteConfigurationOverride
