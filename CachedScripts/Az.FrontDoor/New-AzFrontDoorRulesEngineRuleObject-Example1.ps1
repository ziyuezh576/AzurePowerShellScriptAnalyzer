
New-AzFrontDoorRulesEngineRuleObject -Name rules1 -Priority 0 -Action $rulesEngineAction -MatchProcessingBehavior Stop -MatchCondition $rulesEngineMatchCondition

$rulesEngineRule1.Action

$rulesEngineRule1.MatchCondition[0]
