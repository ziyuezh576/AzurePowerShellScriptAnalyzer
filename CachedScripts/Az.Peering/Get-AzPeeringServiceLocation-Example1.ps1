
Get-AzPeeringServiceLocation -Country "United States" | Where-Object { $_.State -match "Washington"}
