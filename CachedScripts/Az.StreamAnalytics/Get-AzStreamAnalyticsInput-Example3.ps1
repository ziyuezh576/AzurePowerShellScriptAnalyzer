
New-AzStreamAnalyticsInput -ResourceGroupName azure-rg-test -JobName sajob-01-portal -Name input-05 -File .\test\template-json\IotHub.json | Get-AzStreamAnalyticsInput
