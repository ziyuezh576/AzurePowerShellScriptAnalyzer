
$StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name "Storage1" -Location "East US" -Type "Standard_GRS"

New-AzMediaServiceStorageConfig -StorageAccountId $StorageAccount.Id -IsPrimary
