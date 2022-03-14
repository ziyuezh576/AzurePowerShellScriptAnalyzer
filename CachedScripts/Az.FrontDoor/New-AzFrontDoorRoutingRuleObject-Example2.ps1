
$customHost = "www.contoso.com"

$customPath = "/images/contoso.png"

$queryString = "field1=value1&field2=value2"

$destinationFragment = "section-header-2"

New-AzFrontDoorRoutingRuleObject -Name $routingRuleName -FrontDoorName $frontDoorName -ResourceGroupName $rgname -FrontendEndpointName "frontendEndpoint1" -CustomHost $customHost -CustomPath $customPath -CustomQueryString $queryString -CustomFragment $destinationFragment
