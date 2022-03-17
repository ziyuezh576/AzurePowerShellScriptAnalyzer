
$account = New-AzStorageAccount -ResourceGroupName "myresourcegroup" -AccountName "mystorageaccount" -SkuName Premium_LRS -Location eastus -KeyExpirationPeriodInDay 5 -SasExpirationPeriod "1.12:05:06"

$$account.KeyPolicy.KeyExpirationPeriodInDays

$$account.SasPolicy.SasExpirationPeriod
