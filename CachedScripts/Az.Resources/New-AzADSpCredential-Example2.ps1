
Get-AzADServicePrincipal -ApplicationId $appId | New-AzADSpCredential -StartDate $startDate -EndDate $endDate
