
$GetAzdigitalTwinsEndpoint = Get-AzDigitalTwinsEndpoint -EndpointName youriEHEndpoint -ResourceGroupName youritemp -ResourceName youriDigitalTwinsTest

Remove-AzDigitalTwinsEndpoint -InputObject $GetAzdigitalTwinsEndpoint
