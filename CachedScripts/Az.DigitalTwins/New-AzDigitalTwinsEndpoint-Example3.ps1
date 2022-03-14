
New-AzDigitalTwinsEndpoint -EndpointName youriServiceBusPoint -EndpointType ServiceBus -ResourceGroupName youritemp -ResourceName youriDigitalTwins -PrimaryConnectionString "Endpoint=sb://yourieventhubnp.servicebus.windows.net/;SharedAccessKeyName=******;SharedAccessKey=********;EntityPath=yourieventhub"
