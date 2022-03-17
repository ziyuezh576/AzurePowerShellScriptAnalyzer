
$account = Set-AzStorageAccount -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -KeyExpirationPeriodInDay 5 -SasExpirationPeriod "1.12:05:06" -EnableHttpsTrafficOnly $true

$$account.KeyPolicy.KeyExpirationPeriodInDays

$$account.SasPolicy.SasExpirationPeriod
