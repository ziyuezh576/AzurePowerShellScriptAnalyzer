
$InstancePassword = "Newpassword1234"

$SecureString = ConvertTo-SecureString $InstancePassword -AsPlainText -Force

Set-AzSqlInstance -Name "managedinstance1" -ResourceGroupName "ResourceGroup01" -AdministratorPassword $SecureString -LicenseType LicenseIncluded -StorageSizeInGB 1024 -VCore 16 -Edition BusinessCritical
