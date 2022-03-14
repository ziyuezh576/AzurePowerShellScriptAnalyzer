
$GetAzDigitalTwins =  Get-AzDigitalTwinsInstance -ResourceGroupName youritemp -ResourceName youriDigitalTwinsTest

Remove-AzDigitalTwinsInstance -InputObject $GetAzDigitalTwins
