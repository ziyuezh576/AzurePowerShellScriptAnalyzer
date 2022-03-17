
Get-AzStreamAnalyticsOutput -ResourceGroupName azure-rg-test -JobName sajob-01-pwsh -Name output-01| Update-AzStreamAnalyticsOutput -File .\test\template-json\StroageAccount.json
