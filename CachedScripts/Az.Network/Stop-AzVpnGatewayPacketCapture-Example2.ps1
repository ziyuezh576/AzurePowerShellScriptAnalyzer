
$rgname = "testRg"

 $storeName = "teststorage"

 $containerName = "packetcaptureresults"

 $key = Get-AzStorageAccountKey -ResourceGroupName $rgname -Name $storeName

 $context = New-AzStorageContext -StorageAccountName $storeName -StorageAccountKey $key[0].Value

 $container = Get-AzStorageContainer -Name $containerName -Context $context

 $now=get-date

 $sasurl = New-AzureStorageContainerSASToken -Name $containerName -Context $context -Permission "rwd" -StartTime $now.AddHours(-1) -ExpiryTime $now.AddDays(1) -FullUri

 $gw = Get-AzVpnGateway -ResourceGroupName $rgname -name "testGw"

Stop-AzVpnGatewayPacketCapture -InputObject $gw -SasUrl $sasurl
