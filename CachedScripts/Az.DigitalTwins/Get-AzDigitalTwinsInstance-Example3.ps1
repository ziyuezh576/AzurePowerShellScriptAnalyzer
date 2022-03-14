
$NewAzDigital = New-AzDigitalTwinsInstance -ResourceGroupName youritemp -ResourceName youriDigitalTwin -Location eastus

Get-AzDigitalTwinsInstance -inputObject $NewAzDigital
